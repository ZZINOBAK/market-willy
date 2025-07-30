package com.mystudy.project.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.project.DAO.ProductsDAO;
import com.mystudy.project.VO.ProductsVO;

@WebServlet("/product/insertProduct")
public class InsertProduct extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		
		ProductsVO vo = new ProductsVO();
		
		vo.setCategoryMain(req.getParameter("categoryMain"));
		vo.setCategorySub(req.getParameter("categorySub"));
		vo.setProductname(req.getParameter("productname"));
		vo.setPrice(Integer.parseInt(req.getParameter("price")));
		vo.setSaleprice(Integer.parseInt(req.getParameter("saleprice")));
		vo.setImage(req.getParameter("image"));
		vo.setContent(req.getParameter("content"));
		vo.setPcount(Integer.parseInt(req.getParameter("pcount")));
		
		PrintWriter out = resp.getWriter();
		
		System.out.println(vo);
		
		try {
			int result = ProductsDAO.insertProduct(vo);
			
			if(result > 0) {
				out.print("<script>"
						+ "location.href='../admin/admin_listProduct.jsp';"
						+ "</script>");
			}else {
				out.print("<script>"
						+ "alert('[등록 오류] - 다시 시도하세요.');"
						+ "location.href='../admin/admin_listProduct.jsp';"
						+ "</script>");
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		doGet(req, resp);
	}
}
