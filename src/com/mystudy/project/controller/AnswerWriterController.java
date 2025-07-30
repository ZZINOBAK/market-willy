package com.mystudy.project.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.project.DAO.QnaAnswerDAO;
import com.mystudy.project.DAO.QnaDAO;
import com.mystudy.project.VO.QnaAnswerVO;

@WebServlet("/admin/answerWriter")
public class AnswerWriterController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		
		QnaAnswerVO vo = new QnaAnswerVO();
		vo.setAnsNum(Integer.parseInt(req.getParameter("ansNum")));
		vo.setAnsTitle(req.getParameter("ansTitle"));
		vo.setAnsContent(req.getParameter("ansContent"));
		
		//System.out.println("ansVO : " + vo);
		
		try {
			int result = QnaAnswerDAO.writeAnswer(vo);
			
			if(result > 0) {
				QnaDAO.updateQnaOX(vo.getAnsNum());
				//System.out.println("OX 업데이트");
				out.print("<script>"
						+ "location.href='viewAllQna.jsp';"
						+ "</script>");
				out.flush();
				out.close();
			}else {
				out.print("<script>"
						+ "alert('작성 실패');"
						+ "location.href='main_admin.jsp';"
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
