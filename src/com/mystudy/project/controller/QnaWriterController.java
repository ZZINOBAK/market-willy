package com.mystudy.project.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.project.DAO.QnaDAO;
import com.mystudy.project.VO.QnaVO;

@WebServlet("/Customer_Qna/qnaWriter")
public class QnaWriterController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		
		QnaVO vo = new QnaVO();
		vo.setId(req.getParameter("id"));
		vo.setQnaTitle(req.getParameter("qnaTitle"));
		vo.setQnaContent(req.getParameter("qnaContent"));
		vo.setQnaPwd(req.getParameter("qnaPwd"));
		
		System.out.println("vo : " + vo);
		
		try {
			int result = QnaDAO.writeQna(vo);
			
			if(result > 0) {
				out.print("<script>"
						+ "alert('작성 완료!');"
						+ "location.href='myQnA.jsp';"
						+ "</script>");
				out.flush();
				out.close();
			}else {
				out.print("<script>"
						+ "alert('[작성 실패]');"
						+ "location.href='myQnA.jsp';"
						+ "</script>");
				out.flush();
				out.close();
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
