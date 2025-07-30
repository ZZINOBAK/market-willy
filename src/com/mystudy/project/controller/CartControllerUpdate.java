package com.mystudy.project.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mystudy.project.DAO.CartDAO;
import com.mystudy.project.VO.CartVO;

@WebServlet("/cart/updateCart")
public class CartControllerUpdate extends HttpServlet {	
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		//System.out.println("-------------------------------------");
		//System.out.println("UpdateCartController doGet() 시작");
		
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String id =(String) session.getAttribute("id");
		//System.out.println("카트 세션id : " + id);
		
		String[] cartupdate = request.getParameterValues("cCount");
		String[] cartupdate1 = request.getParameterValues("cNum");
		
		CartVO cartVo = new CartVO();
		int result = 0;
		for (int i = 0; i < cartupdate.length; i++) {
			int cNum = Integer.parseInt(cartupdate1[i]);
			int cCount = Integer.parseInt(cartupdate[i]);

			cartVo.setcNum(cNum); 
			cartVo.setcCount(cCount); 
			
			try {
				result = CartDAO.updateCart(cartVo);
		        //System.out.println("updateCart 결과 : " + result);
    			
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
					+ "alert('수량변경완료');"
					+ "location.href='../cart/cart.jsp'; "
					+ "</script>");
		}else {
			String alertMessage = "수량변경실패"; // 원하는 알림 메시지 내용을 설정합니다.
			request.setAttribute("alertMessage", alertMessage);
		}
		
		//System.out.println("CartController doGet() 끝");	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("> ListController doPost() 시작");
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
		//System.out.println("> ListController doPost() 끝");
	}

}
