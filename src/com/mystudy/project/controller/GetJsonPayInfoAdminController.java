package com.mystudy.project.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.project.DAO.PayInfoDAO;
import com.mystudy.project.VO.PayInfoVO;


@WebServlet("/admin/getJsonAdminPayInfo")
public class GetJsonPayInfoAdminController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println(":::GetJsonPayInfoAdminController~~~");
		//한글깨짐 방지를 위한 문자타입(UTF-8) 처리
		response.setContentType("text/html; charset=UTF-8");
	
		//DB 데이터 가져오기
		List<PayInfoVO> list = PayInfoDAO.getList();
		//System.out.println("list : " + list);
		
		//JSON 형식 문자열 만들고 응답처리
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
			result.append("\"oNum\": " + vo.getoNum() + ", ");
			result.append("\"id\": \"" + vo.getId() + "\", ");
			result.append("\"oPatment\": \"" + vo.getoPayment() + "\", ");
			result.append("\"info\": " + vo.getInfo() + ", ");
			result.append("\"oCount\": " + vo.getoCount() + ", ");
			result.append("\"productName\": \"" + vo.getProductName() + "\" ");
			result.append("},");
		}
		//result.delete(result.length() - 1, result.length());
		result.deleteCharAt(result.length() - 1);
		result.append("]}");
		
		//System.out.println(result.toString());
		
		return result.toString();
	}
	
}
