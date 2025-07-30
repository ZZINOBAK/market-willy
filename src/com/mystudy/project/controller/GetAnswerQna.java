package com.mystudy.project.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.project.DAO.QnaDAO;
import com.mystudy.project.VO.QnaAnswerVO;
import com.mystudy.project.VO.QnaVO;

@WebServlet("/admin/getAnswerQna")
public class GetAnswerQna extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=UTF-8");
		
		List<QnaVO> list = QnaDAO.answerQna();
		//System.out.println(list);
		String result = makeJson(list);
		
		PrintWriter out = resp.getWriter();
		out.print(result);
	}
	
	private String makeJson(List<QnaVO> list) {
		StringBuilder result = new StringBuilder();
		result.append("{\"list\" : [");
		
		
		
		for(QnaVO vo : list) {
			result.append("{");
			result.append("\"qnaNum\" : " + vo.getQnaNum() + ",");
			result.append("\"id\" : \"" + vo.getId() + "\",");
			result.append("\"qnaTitle\" : \"" + vo.getQnaTitle() + "\",");
			result.append("\"qnaPwd\" : \"" + vo.getQnaPwd() + "\",");
			result.append("\"qnaDate\" : \"" + vo.getQnaDate() + "\"");
			result.append("},");
		}
		
		result.deleteCharAt(result.length()-1);
		result.append("]}");
		
		return result.toString();
	}
}
