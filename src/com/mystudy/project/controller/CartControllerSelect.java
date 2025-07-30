package com.mystudy.project.controller;

import java.io.IOException;
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

@WebServlet("/selectCart")
public class CartControllerSelect extends HttpServlet {
	List<CartVO> listCartVo = new ArrayList<CartVO>();

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		//System.out.println("-------------------------------------");
		//System.out.println("CartControllerSelect doGet() 시작");
		
		HttpSession session = request.getSession();
		String id =(String) session.getAttribute("id");
		//System.out.println("카트 세션id : " + id);
		
		if (id == null) {
			String alertMessage = "로그인 후 이용해주세요."; 
			request.setAttribute("alertMessage", alertMessage); 
			
			request.getRequestDispatcher("../Customer_Qna/login.jsp").forward(request, response);
		} else {
				if ("admin".equals(id)) { //관리자
					String alertMessage = "접근불가"; 
					request.setAttribute("alertMessage", alertMessage); 
					
					request.getRequestDispatcher("../Customer_Qna/login.jsp").forward(request, response);
				} else { //고객
					listCartVo = CartDAO.getListById(id);
					//System.out.println("getListById 결과 : " + listCartVo);
					
					request.setAttribute("list", listCartVo);
					
					request.getRequestDispatcher("cart.jsp").forward(request, response);
				}
			
			//System.out.println("CartControllerSelect doGet() 끝");	
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("> ListController doPost() 시작");
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
		//System.out.println("> ListController doPost() 끝");
	}

}
