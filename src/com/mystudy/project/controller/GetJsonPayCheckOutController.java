package com.mystudy.project.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mystudy.project.DAO.PayInfoDAO;
import com.mystudy.project.VO.CustomerVO;
import com.mystudy.project.VO.PayInfoVO;


@WebServlet("/pay/getJsonPayCheckAddr")
public class GetJsonPayCheckOutController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("> GetJsonMembersNameController doGet() 실행--------");
		//한글깨짐 방지를 위한 문자타입(UTF-8) 처리
		//response.setContentType("text/html; charset=UTF-8");
		response.setContentType("application/json; charset=UTF-8");
		
		HttpSession session = request.getSession();
		
		CustomerVO vo = (CustomerVO) session.getAttribute("vo");
		String id = vo.getId();
		//System.out.println("id : " + id);
		
		List<PayInfoVO> list = PayInfoDAO.getAddr(id);
		//System.out.println("list : " + list);
		
		//JSON 형식 문자열 만들기
		// {"list" : [{}, {}, ... , {}] }
		String result = makeJson(list);
		
		//클라이언트에게 응답처리
		PrintWriter out = response.getWriter();
		out.print(result);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

	private String makeJson(List<PayInfoVO> list) {
		//JSON 형식 문자열 만들기
		StringBuilder result = new StringBuilder();
		result.append("{ \"list\" : [");
		
		for (PayInfoVO vo : list) {
			result.append("{");
			result.append("\"addr2\": \"" + vo.getAddr2() + "\", ");			
			result.append("\"zip\": \"" + vo.getZip() + "\", ");
			result.append("\"addr\": \"" + vo.getAddr() + "\" ");
			
			result.append("},");
		}
		//result.delete(result.length() - 1, result.length());
		result.deleteCharAt(result.length() - 1);
		result.append("]}");
		
		//System.out.println(result.toString());
		
		return result.toString();
	}
	
}
