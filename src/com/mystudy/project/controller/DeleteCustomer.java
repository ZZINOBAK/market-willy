package com.mystudy.project.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mystudy.project.DAO.CustomerDAO;
import com.mystudy.project.VO.CustomerVO;

@WebServlet("/Customer_Qna/deleteCustomer")
public class DeleteCustomer extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		
		HttpSession session = req.getSession();
		CustomerVO vo = (CustomerVO) session.getAttribute("vo");
		
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		
		//System.out.println("vo : " + vo + "\n id : " + id + ", pwd : " + pwd);
		
		if(vo.getPwd().equals(pwd)) {
			int result = CustomerDAO.deleteCus(id);
			if(result > 0) {
				session.invalidate();
				out.print("<script>"
						+ "alert('[회원탈퇴 완료]');"
						+ "location.href='../main.jsp';"
						+ "</script>");
			}else {
				out.print("<script>"
						+ "alert('[회원탈퇴 실패] - 지속된 실패시 관리자에게 문의하세요.');"
						+ "history.back();"
						+ "</script>");
			}
		}else {
			out.print("<script>"
					+ "alert('[회원탈퇴 실패] - 비밀번호가 일치하지 않습니다.');"
					+ "location.href='../main.jsp';"
					+ "</script>");
		}
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//System.out.println("doPost 실행");

		req.setCharacterEncoding("UTF-8");
		doGet(req, resp);
	}
}
