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

@WebServlet("/Customer_Qna/idCheckController")
public class IdCheckController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String id = req.getParameter("id");
		//System.out.println("id : " + id);
		
		CustomerVO vo = null;
		String msgt = "";
		String msgf = "";
		
		if(id.equals("admin")) {
			msgf = "-사용할 수 없는 아이디 입니다.";
			req.setAttribute("msgt", msgt);
			req.setAttribute("msgf", msgf);
			
			resp.setContentType("text/plain");
	        resp.setCharacterEncoding("UTF-8");
		    resp.getWriter().write(msgt);
		    resp.getWriter().write(msgf);
		    
			return;
		}
		
		vo = CustomerDAO.checkId(id);
		
		if(id != null && vo != null) {
			if(id.equalsIgnoreCase(vo.getId())) {
				msgf = "-이미 존재하는 아이디 입니다.";
			}else {
				msgt = "사용가능한 아이디 입니다.";
			}
		}else{
			if(id.trim() == "") {
				msgf = "-아이디를 입력해주세요.";
			}else {
				msgt = "사용가능한 아이디 입니다.";
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
