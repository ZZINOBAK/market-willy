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

@WebServlet("/Customer_Qna/login")
public class LoginController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter out = resp.getWriter();

		// id, pwd값 가져오기
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		System.out.println("id : " + id + " pwd : " + pwd);
		CustomerVO vo = null;
		
		if(id.equals("admin") && pwd.equals("admin")) {
			HttpSession session = req.getSession();
			
			session.setAttribute("admin", id);
			
			resp.sendRedirect("../admin/main_admin.jsp");
			return;
		}
		
		vo = CustomerDAO.checkId(id);
		
		if(id.trim() == "" || pwd.trim() == "") { 
			out.print("<script>" 
					+ "alert('아이디 & 비밀번호를 모두 입력해주세요');" 
					+ "location.href='login.jsp';" 
					+ "</script>"); 
		}
		
		if(vo == null) {
			out.print("<script>" 
					 + "alert('[로그인 실패] - 일치하는 정보가 없습니다.');"
					 + "location.href='login.jsp';" 
					 + "</script>");
		}else {
			if(pwd.equals(vo.getPwd())) {
				//로그인 성공시 회원정보 session에 저장
				HttpSession session = req.getSession();
				session.setAttribute("vo", vo);
				
				resp.sendRedirect("../main_login.jsp");
			}else {
				out.print("<script>" 
						+ "alert('[로그인 실패] - 비밀번호를 확인해주세요.');" 
						+ "location.href='login.jsp';"
						+ "</script>");
			}
		}
			
		out.flush();
		out.close();
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("doPost 실행");

		req.setCharacterEncoding("UTF-8");
		doGet(req, resp);
	}
}
