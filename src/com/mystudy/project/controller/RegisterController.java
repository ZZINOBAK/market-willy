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

@WebServlet("/Customer_Qna/register")
public class RegisterController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");

		CustomerVO vo = new CustomerVO();
		
		vo.setId(req.getParameter("id")); 
		vo.setName(req.getParameter("name"));
		vo.setPwd(req.getParameter("pwd")); 
		vo.setAddr(req.getParameter("addr"));
		vo.setPhone(req.getParameter("phone"));
		vo.setEmail(req.getParameter("email"));
		vo.setZip(req.getParameter("zip"));
		vo.setAddr2(req.getParameter("addr2"));

		PrintWriter out = resp.getWriter();
		
		//System.out.println(vo);
		
		try {
			int result = CustomerDAO.register(vo);
			
			if(result > 0) {
				out.print("<script>"
						+ "alert('회원가입 성공!');"
						+ "location.href='login.jsp';"
						+ "</script>");
				out.flush();
				out.close();
			}else {
				out.println("<script>alert('[회원가입 실패] - 로그인 화면으로 돌아갑니다.');"
							+ "location.href='login.jsp';"
							+ "</script>");
				out.flush();
				out.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		

		//System.out.println("회원가입 완료");
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//System.out.println("doPost 실행");

		req.setCharacterEncoding("UTF-8");
		doGet(req, resp);
	}
}
