<%@page import="com.mystudy.project.DAO.QnaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//관리자 권한으로 게시글 제거
	int qnaNum = Integer.parseInt(request.getParameter("qnaNum"));

	QnaDAO.deleteQna(qnaNum);
	
	response.sendRedirect("viewAllQna.jsp");
%>