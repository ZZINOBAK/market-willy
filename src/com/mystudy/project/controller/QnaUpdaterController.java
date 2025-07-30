package com.mystudy.project.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mystudy.project.DAO.QnaDAO;
import com.mystudy.project.VO.QnaVO;

@WebServlet("/Customer_Qna/qnaUpdater")
public class QnaUpdaterController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		
		HttpSession session = req.getSession();
		QnaVO vo = (QnaVO) session.getAttribute("qnaVO");
		
		vo.setQnaTitle(req.getParameter("qnaTitle"));
		vo.setQnaContent(req.getParameter("qnaContent"));
		vo.setQnaPwd(req.getParameter("qnaPwd"));
		
		try {
			int result = QnaDAO.updateQna(vo);
			
			if(result > 0) {
				out.print("<script>"
						+ "alert('수정이 완료되었습니다.');"
						+ "location.href = 'qnA.jsp';"
						+ "</script>");
			}else {
				out.print("<script>"
						+ "alert('[수정 실패]');"
						+ "location.href = 'qnA.jsp';"
						+ "</script>");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("수정 끝");
	}
	

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		doGet(req, resp);
	}
}
