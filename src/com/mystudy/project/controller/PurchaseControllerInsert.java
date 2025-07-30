package com.mystudy.project.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mystudy.project.DAO.CartDAO;
import com.mystudy.project.DAO.OrderListDAO;
import com.mystudy.project.VO.CartVO;
import com.mystudy.project.VO.CustomerVO;
import com.mystudy.project.VO.OrderListVO;

@WebServlet("/cart/purchase")
public class PurchaseControllerInsert extends HttpServlet {
	// 여기서 장바구니에서 주문내역이로 데이터 이동
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		System.out.println("-------------------------------------");
		System.out.println("PurchaseControllerInsert doGet() 시작");
		
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		CustomerVO vo = (CustomerVO) session.getAttribute("vo");
		String id = vo.getId();
		
		// 장바구니 데이터 결제창으로 옮기기....
		// 장바구니에서 데이터 삭제, 주문내역에 데이터 생성
		String[] selectedItems = request.getParameterValues("selectedItems");
		
		OrderListVO cart = new OrderListVO();
		List<OrderListVO> list = new ArrayList<>();
		
		int oNum = OrderListDAO.generateOrderNumber();
		System.out.println("오넘 설정하기 " + oNum);
		for (int i = 0; i < selectedItems.length; i++) {
			int productNum = Integer.parseInt(selectedItems[i]);
			System.out.println(productNum + "     프로덕트넘" + i );
			
			cart.setProductNum(productNum);
			cart.setId(id);
			cart.setoNum(oNum + "_" + productNum);

			try {
				OrderListDAO.insertOrderList(cart);

				System.out.println("여기서 인서트된 오넘을 출력 : " + cart.getoNum());
//				List<OrderListVO> one = OrderListDAO.getOneByoNum(oNum);
				list = OrderListDAO.getOneByoNum(oNum);
				System.out.println("하어러누다");
//				System.out.println(one);
//				list.add(one);
				System.out.println(list.toString());
				
				CartVO cart1 = new CartVO();
				cart1.setProductNum(productNum);
				cart1.setId(id);
				CartDAO.deleteCart(cart1);
				System.out.println("딜리트 완료료료");
			} catch(Exception e) {
				System.out.println("예외 발생");
				System.out.println(e);
				String alertMessage = "결제 요청 실패"; // 원하는 알림 메시지 내용을 설정합니다.
				request.setAttribute("alertMessage", alertMessage);
			}
		}
		
		request.setAttribute("list", list);
		
		request.getRequestDispatcher("../pay/paycheckout.jsp").forward(request, response);
		
		System.out.println("PurchaseControllerInsert doGet() 끝");
	}

}
