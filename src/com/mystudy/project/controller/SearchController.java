package com.mystudy.project.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.mybatis.DBService;
import com.mystudy.project.DAO.ProductsDAO;
import com.mystudy.project.VO.ProductsVO;

@WebServlet("/search_Product")
public class SearchController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost() 시작");
		
		request.setCharacterEncoding("UTF-8");
		String productname = request.getParameter("productname");
		
		SqlSession ss = DBService.getFactory().openSession();
		List<ProductsVO> list = ss.selectList("jspProject.listone", productname);
		ss.close();
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("product/search_Product.jsp").forward(request, response);
		
		System.out.println("doPost() 끝");
	}
}
