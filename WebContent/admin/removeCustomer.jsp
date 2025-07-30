<%@page import="com.mystudy.project.DAO.CustomerDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	//관리자 권한으로 회원 탈퇴조치
	
	String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	//System.out.println(id + ", " + pwd);
	
	CustomerDAO.deleteCus(id);
	
	response.sendRedirect("viewAllCustomer.jsp");
%>
