package com.mystudy.project.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.mystudy.project.DAO.ProductsDAO;
import com.mystudy.project.VO.ProductsVO;

@WebServlet("/product/list_Product")
public class ListController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("> ListController doGet() 시작");
		
		System.out.println(">>> doGet 업무처리 ~~~~");
		//DB에서 데이터 가져와서 list.jsp 페이지에서 사용토록 전달
		//1. DB연결하고 데이터 가져오기
		List<ProductsVO> list = ProductsDAO.getList();
		
		//2. 응답페이지(list.jsp)에 전달
		request.setAttribute("list", list);
		System.out.println(list);
		//3. 페이지 전환 - 응답할 페이지(list.jsp)로 포워딩(위임,전가)
		request.getRequestDispatcher("list_Product.jsp").forward(request, response);
		
		
		System.out.println("> ListController doGet() 끝");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("> ListController doPost() 시작");
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
		System.out.println("> ListController doPost() 끝");
	}

}
