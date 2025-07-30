package com.mystudy.project.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mystudy.project.DAO.OrderListDAO;
import com.mystudy.project.VO.CustomerVO;
import com.mystudy.project.VO.OrderListVO;
import com.mystudy.project.VO.PayInfoVO;

@WebServlet("/order/orderDetail")
public class OrderDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("-------------------------------------");
		System.out.println("OrderListController doGet() 시작");

		HttpSession session = request.getSession();
		CustomerVO vo = (CustomerVO) session.getAttribute("vo");
		String id = vo.getId();
		
		try {
			int payNum = Integer.parseInt(request.getParameter("payNum"));
			OrderListVO test = new OrderListVO();
			test.setId(id);
			test.setPayNum(payNum);
			
			List<OrderListVO> aa = OrderListDAO.getOneByIdNoNum(test);
			System.out.println("getOneByIdNoNum 결과 : " + aa);
			request.setAttribute("list", aa);
			List<PayInfoVO> bb = OrderListDAO.getOneByIdNoNumNpay(payNum);
			System.out.println("payinfo2 : " + bb);
			request.setAttribute("list1", bb);
			
		} catch(Exception e) {
			System.out.println("예외 발생");
			
			String alertMessage = "주문 상세내역 조회 실패"; // 원하는 알림 메시지 내용을 설정합니다.
			request.setAttribute("alertMessage", alertMessage);
		}
		request.getRequestDispatcher("orderListDetail.jsp").forward(request, response);
		
		System.out.println("OrderListController doGet() 끝");	
	}

}
