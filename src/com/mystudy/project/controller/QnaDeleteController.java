package com.mystudy.project.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.project.DAO.QnaDAO;

@WebServlet("/Customer_Qna/qnaDeleteController")
public class QnaDeleteController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("deleteQna doGet 실행");
		resp.setContentType("text/html;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		
		 try {
	            // 게시글 삭제를 위한 qnaNum 및 id 값을 가져옵니다.
	            int qnaNum = Integer.parseInt(req.getParameter("qnaNum"));
	            System.out.println(qnaNum);
	            
	            // 여기에서 게시글 삭제 로직을 구현
	            boolean success = performDelete(qnaNum);

	            // JSON 응답 생성
	            if (success) {
	                // 게시글 삭제 성공 시
	            	out.print("success");
	            } else {
	                // 게시글 삭제 실패 시
	            	out.print("<script>" 
	            			+ "alert('삭제에 실패했습니다.');"
	            			+ "location.href='qnA.jsp'"
	            			+ "</script>");
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	}
	
	private boolean performDelete(int qnaNum) {
		System.out.println("performdelete 실행");
		int result = QnaDAO.deleteQna(qnaNum);
		System.out.println("perform - result : " + result);
		
		boolean success = false;
		
		if(result > 0) {
			success = true;
		}
		
		System.out.println("success : " + success);
		return success;
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		doGet(req, resp);
	}
}
   
