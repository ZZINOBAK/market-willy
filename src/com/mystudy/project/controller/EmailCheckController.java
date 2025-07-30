package com.mystudy.project.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.project.DAO.CustomerDAO;
import com.mystudy.project.VO.CustomerVO;

@WebServlet("/Customer_Qna/emailCheckController")
public class EmailCheckController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String email = req.getParameter("email");
		//System.out.println("email : " + email);
		CustomerVO vo = null;
		String msgt = "";
		String msgf = "";
		
		vo = CustomerDAO.checkEmail(email);
		
		if(email != null && vo != null) {
			if(email.equalsIgnoreCase(vo.getEmail())) {
				msgf = "-이미 존재하는 메일 입니다.";
			}else {
				msgt = "사용가능한 메일 입니다.";
			}
		}else {
			if(email.trim() == "") {
				msgf = "-메일을 입력해주세요.";
			}else {
				msgt = "사용가능한 메일입니다.";
			}
		}
		
		req.setAttribute("msgt", msgt);
		req.setAttribute("msgf", msgf);
		
		resp.setContentType("text/plain");
        resp.setCharacterEncoding("UTF-8");
	    resp.getWriter().write(msgt);
	    resp.getWriter().write(msgf);
	}
}
