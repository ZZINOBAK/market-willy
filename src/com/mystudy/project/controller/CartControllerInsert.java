package com.mystudy.project.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mystudy.project.DAO.CartDAO;
import com.mystudy.project.VO.CartVO;
import com.mystudy.project.VO.CustomerVO;

@WebServlet("/product/insertCart")
public class CartControllerInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		//System.out.println("-------------------------------------");
		//System.out.println("CartControllerInsert doGet() 시작");

		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		
		CustomerVO cusVo =(CustomerVO) session.getAttribute("vo");
		if(cusVo == null) {
			out.append("<script>"
					+ "alert('로그인 후 이용해주세요');"
					+ "location.href='../Customer_Qna/login.jsp'"
					+ "</script>");
		}
		//System.out.println("카트 세션id : " + cusVo.getId());
		
		if (cusVo.getId() == null) {
			String alertMessage = "로그인 후 이용해주세요."; 
			request.setAttribute("alertMessage", alertMessage); 
			
			request.getRequestDispatcher("../Customer_Qna/login.jsp").forward(request, response);
		} else {
			int productNum = Integer.parseInt(request.getParameter("productNum"));
			int cCount = Integer.parseInt(request.getParameter("cCount"));
			int result = 0;
			//System.out.println("productNum : " + productNum + ", cCount : " + cCount);
			
			CartVO cartVo = new CartVO();
			cartVo.setProductNum(productNum);
			cartVo.setId(cusVo.getId());
			//System.out.println("cartVO : " + cartVo);
			cartVo = CartDAO.selectOne(cartVo);
			//System.out.println("selectOne 결과 : " + cartVo);
			
			//이미 해당상품이 장바구니에 있으면 수량만 수정(update)
			if (cartVo != null && cartVo.getProductNum() == productNum) {
//				cartVo.setcNum(cartVo.getcNum()); 무의미해서 주석처리함 250404
				cartVo.setcCount(cCount+cartVo.getcCount());
				
			    result = CartDAO.updateCart(cartVo);
			    //System.out.println("updateCart 결과 : " + result);
			} else {
				// 없으면 새로 추가(insert)
				CartVO cartVo1 = new CartVO();
				cartVo1.setProductNum(productNum); // 예시: 상품 번호
				cartVo1.setId(cusVo.getId());
				cartVo1.setcCount(cCount);
				//System.out.println("cartVo1 : " + cartVo1);
			   		    
				try {
					result = CartDAO.insertCart(cartVo1);
					//System.out.println("insertCart 결과 : " + result);
	    			
	            } catch (Exception e) {
	                // 예외 처리: 예외 메시지를 로그에 기록하거나 사용자에게 오류 메시지를 표시
	                e.printStackTrace(); // 예외 정보를 콘솔에 출력
	            }
				
			}
			if(result > 0) {
				List<CartVO> listCartVo = CartDAO.getListById(cusVo.getId());
				//System.out.println("getListById 결과 : " + listCartVo);
				
				request.setAttribute("list", listCartVo);
				
				out.append("<script>"
						+ "alert('장바구니에 상품을 담았습니다.');"
						+ "location.href='../cart/cart.jsp'"
						+ "</script>");
			}else {
				String alertMessage = "상품 담기 실패"; // 원하는 알림 메시지 내용을 설정합니다.
				request.setAttribute("alertMessage", alertMessage);
			}
			
			//System.out.println("CartControllerInsert doGet() 끝");
		}
	}

}
