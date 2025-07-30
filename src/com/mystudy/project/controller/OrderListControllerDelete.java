package com.mystudy.project.controller;

import java.io.IOException;
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

@WebServlet("/order/deleteOrderlist")
public class OrderListControllerDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("-------------------------------------");
		System.out.println("OrderListControllerDelete doGet() 시작");

		HttpSession session = request.getSession();
		CustomerVO vo = (CustomerVO) session.getAttribute("vo");
		if(vo == null) {
			vo = new CustomerVO();
			vo.setId("admin");
		}
		String id = vo.getId();
		String admin = (String) session.getAttribute("admin");
		
		System.out.println("오더리스트 세션id : " + id);
		
		if (id == null) {
			String alertMessage = "로그인 후 이용해주세요."; 
			request.setAttribute("alertMessage", alertMessage); 
			
			request.getRequestDispatcher("../Customer_Qna/login.jsp").forward(request, response); 
		} else {
			if (!"admin".equals(id)) { //고객 주문내역 환불중
				OrderListVO orderListVo = new OrderListVO();
				orderListVo.setId(id);
				orderListVo.setoNum(request.getParameter("oNum"));
				orderListVo.setPayment("환불중");
				
				try {
					int result = OrderListDAO.updateOrderList(orderListVo);
					System.out.println("udeleteOrderList 결과 : " + result);
					System.out.println(orderListVo);
					
					if(result > 0) {
						String alertMessage = "주문 취소 요청 완료"; // 원하는 알림 메시지 내용을 설정합니다.
						request.setAttribute("alertMessage", alertMessage);
					} else {
						String alertMessage = "주문 취소 요청 실패"; // 원하는 알림 메시지 내용을 설정합니다.
						request.setAttribute("alertMessage", alertMessage);
					}
				} catch(Exception e) {
					System.out.println("예외 발생");
					
					String alertMessage = "주문 취소 요청 실패"; // 원하는 알림 메시지 내용을 설정합니다.
					request.setAttribute("alertMessage", alertMessage);
				}
				
				List<OrderListVO>  listOrderListVo = OrderListDAO.getOneByIdNoNum(orderListVo);
				System.out.println("getList 결과 : " + listOrderListVo);
				
				request.setAttribute("list", listOrderListVo);
					
				request.getRequestDispatcher("orderListDetail.jsp").forward(request, response);

			} 
			if ("admin".equals(admin)) { //관리자 주문내역 환불완료
				OrderListVO orderListVo = new OrderListVO();
				orderListVo.setId(request.getParameter("id"));
				orderListVo.setoNum(request.getParameter("oNum"));
				orderListVo.setPayment("환불완료");
				System.out.println(orderListVo);

				try {
					int result = OrderListDAO.updateOrderList(orderListVo);
					System.out.println("udeleteOrderList 결과 : " + result);
					System.out.println(orderListVo);
					
					if (result > 0) {
		                List<OrderListVO> listOrderListVo = OrderListDAO.getOneByIdNoNum(orderListVo);
		                System.out.println(listOrderListVo);

		                OrderListVO updatedOrder = listOrderListVo.get(0);
		                String payment1 = updatedOrder.getPayment();

		                response.setCharacterEncoding("UTF-8");
		                response.getWriter().write("{\"success\": true, \"payment\": \"" + payment1 + "\"}");
		                
		            } else {
		            	response.getWriter().write("{\"success\": false, \"error\": \"데이터 업데이트 실패\"}");
		            }

				} catch(Exception e) {
					System.out.println("예외 발생");
	            	response.getWriter().write("{\"success\": false, \"error\": \"데이터 업데이트 실패\"}");
				}
			}
		}
		System.out.println("OrderListControllerDelete doGet() 끝");	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("-------------------------------------");
		System.out.println("OrderListControllerDelete  doPost() 시작");
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		CustomerVO vo = (CustomerVO) session.getAttribute("vo");
		String id = vo.getId();
		System.out.println("오더리스트 세션id : " + id);
		
		 // 주문 취소 처리를 위한 코드를 작성하세요.
	    String payment = request.getParameter("payment"); // 결제 상태
	    
	    if ("환불중".equals(payment)) {
	    	response.getWriter().write("{\"success\": false, \"error\": \"주문 취소 진행중\"}");

	    } else {
	    	OrderListVO orderListVo = new OrderListVO();
	 		orderListVo.setId(id);
	 		orderListVo.setoNum(request.getParameter("oNum"));
	 		orderListVo.setPayment("환불중");
	 		
	 		try {
	 			int result = OrderListDAO.updateOrderList(orderListVo);
		 		if (result > 0) {
		 			System.out.println("result 갑 1");
//	                List<OrderListVO> listOrderListVo = OrderListDAO.getOneByIdNoNum(orderListVo);
//	                System.out.println("djfslkjldkf" + listOrderListVo);

//	                OrderListVO updatedOrder = listOrderListVo.get(0);
//	                String payment1 = updatedOrder.getPayment();
//	                System.out.println(payment1);
	                
	                // UTF-8로 응답 문자 인코딩 설정
	                response.setCharacterEncoding("UTF-8");
	                response.getWriter().write("{\"success\": true, \"payment\": \"환불중\"}");
	                
	            } else {
	            	response.getWriter().write("{\"success\": false, \"error\": \"주문 취소 요청 실패\"}");
	            }
	 		} catch(Exception e) {
				System.out.println("예외 발생");
            	response.getWriter().write("{\"success\": false, \"error\": \"주문 취소 요청 실패\"}");
	 		}
	    }
	    System.out.println("OrderListControllerDelete doPost() 끝");
	}
}
