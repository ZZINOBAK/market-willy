package com.mystudy.project.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.project.DAO.CustomerDAO;
import com.mystudy.project.VO.CustomerVO;

@WebServlet("/Customer_Qna/findPwd")
public class FindPwdController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		
		CustomerVO vo = null;
		String id = req.getParameter("id");
		String email = req.getParameter("email");
		
		try {
			vo = CustomerDAO.checkId(id);
			
			if(vo != null && email.equals(vo.getEmail())) {
				out.print("<script>" 
						+ "alert('고객님의 비밀번호는 " + vo.getPwd() + "입니다.');"
						+ "location.href = 'login.jsp';"
						+ "</script>");
			}else {
				out.print("<script>" 
						+"alert('일치하는 정보가 없습니다.');"
						+ "location.href = 'login.jsp';"
						+"</script>");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		doGet(req, resp);
	}
}
