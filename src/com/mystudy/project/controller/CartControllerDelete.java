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

@WebServlet("/cart/deleteCart")
public class CartControllerDelete extends HttpServlet {
	int result =0;
	
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		//System.out.println("-------------------------------------");
		//System.out.println("CartControllerDelete doGet() 시작");

		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();
		
		CustomerVO cusVO = (CustomerVO) session.getAttribute("vo");
		
		if(cusVO == null) {
			out.append("<script>"
					+ "alert('로그인 후 이용해주세요');"
					+ "location.href='../Customer_Qna/login.jsp'"
					+ "</script>");
		}
		String id = cusVO.getId();
		
		//System.out.println("카트 세션id : " + id);
		
			String[] selectedItems = request.getParameterValues("selectedItems");
			
				for (int i = 0; i < selectedItems.length; i++) {
					CartVO cartVo = new CartVO();
					cartVo.setProductNum(Integer.parseInt(selectedItems[i]));
					cartVo.setId(id);
					
					try {
		                result = CartDAO.deleteCart(cartVo);
		                //System.out.println("deleteCart 결과 : " + result);
		    			
		            } catch (Exception e) {
		                // 예외 처리: 예외 메시지를 로그에 기록하거나 사용자에게 오류 메시지를 표시
		                e.printStackTrace(); // 예외 정보를 콘솔에 출력
		            }
				}
			if(result > 0) {
				List<CartVO> listCartVo = CartDAO.getListById(id);
				//System.out.println("getListById 결과 : " + listCartVo);
				
				session.setAttribute("list", listCartVo);
				
				out.append("<script>"
						+ "location.href='../cart/cart.jsp'"
						+ "</script>");
			}else {
				String alertMessage = "상품 삭제 실패"; // 원하는 알림 메시지 내용을 설정합니다.
				request.setAttribute("alertMessage", alertMessage);
			}
		
			//System.out.println("CartControllerDelete doGet() 끝");	
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("> ListController doPost() 시작");
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
		//System.out.println("> ListController doPost() 끝");
	}

}
