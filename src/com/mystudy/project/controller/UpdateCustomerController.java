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

@WebServlet("/Customer_Qna/updateCustomer")
public class UpdateCustomerController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		
		HttpSession session = req.getSession();
		CustomerVO vo = (CustomerVO) session.getAttribute("vo");
		
		//System.out.println(req.getParameter("name") + ", " + req.getParameter("pwd"));
		//System.out.println("vo : " + vo);
	
		vo.setName(req.getParameter("name"));
		vo.setPwd(req.getParameter("pwd"));
		vo.setAddr(req.getParameter("addr"));
		vo.setPhone(req.getParameter("phone"));
		vo.setEmail(req.getParameter("email"));
		vo.setZip(req.getParameter("zip"));
		vo.setAddr2(req.getParameter("addr2"));
		
		
		try {
			int result = CustomerDAO.updateCus(vo);
			
			if(result > 0) {
				out.print("<script>"
						+ "alert('수정이 완료되었습니다.');"
						+ "location.href='myPage.jsp';"
						+ "</script>");
			}else {
				out.println("<script>"
						+ "alert('[정보수정 실패] - 지속된 실패시 관리자에게 문의하세요.');"
						+ "location.href='myPage.jsp';"
						+ "</script>");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			out.flush();
			out.close();
		}
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//System.out.println("doPost 실행");

		req.setCharacterEncoding("UTF-8");
		doGet(req, resp);
	}
}
