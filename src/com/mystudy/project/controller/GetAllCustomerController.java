package com.mystudy.project.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mystudy.project.DAO.CustomerDAO;
import com.mystudy.project.VO.CustomerVO;

@WebServlet("/admin/getAllCustomer")
public class GetAllCustomerController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//System.out.println("실행");
		
		resp.setContentType("text/html; charset=UTF-8");
		
		List<CustomerVO> list = CustomerDAO.allCustomer();
		//System.out.println(list);
		
		String result = makeJson(list);
		
		PrintWriter out = resp.getWriter();
		out.print(result);
	}
	
	private String makeJson(List<CustomerVO> list) {
		StringBuilder result = new StringBuilder();
		result.append("{\"list\" : [");
		
		for(CustomerVO vo : list) {
			result.append("{");
			result.append("\"id\" : \"" + vo.getId() + "\",");
			result.append("\"name\" : \"" + vo.getName() + "\",");
			result.append("\"pwd\" : \"" + vo.getPwd() + "\",");
			result.append("\"phone\" : \"" + vo.getPhone() + "\",");
			result.append("\"zip\" : \"" + vo.getZip() + "\",");
			result.append("\"addr\" : \"" + vo.getAddr() + "\",");
			result.append("\"addr2\" : \"" + vo.getAddr2() + "\",");
			result.append("\"regdate\" : \"" + vo.getRegdate() + "\"");
			result.append("},");
		}
		
		result.deleteCharAt(result.length()-1);
		result.append("]}");
		
		return result.toString();
	}
	

}
