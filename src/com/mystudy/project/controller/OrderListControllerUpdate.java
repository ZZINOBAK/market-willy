package com.mystudy.project.controller;

import java.io.IOException;

import java.util.ArrayList;
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
import com.mystudy.project.paging.Paging;

@WebServlet("/order/updateOrderlist")
public class OrderListControllerUpdate extends HttpServlet {
	//deleteOrderlist에서 이것도 하고 있음... 사실상 안씀...
	OrderListVO orderListVo = new OrderListVO();
	List<OrderListVO> listOrderListVo = new ArrayList<OrderListVO>();

	
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("-------------------------------------");
		System.out.println("OrderListController doGet() 시작");

		HttpSession session = request.getSession();
		CustomerVO vo = (CustomerVO) session.getAttribute("vo");
		String id = vo.getId();
		System.out.println("오더리스트 세션id : " + id);
		
		String selectedValue = request.getParameter("selectedValue");
		String idd = request.getParameter("idd");
		System.out.println(selectedValue);
		System.out.println(idd);
		
		// 환불중 -> 환불완료 	
	
		//0. 페이징 처리를 위한 객체(Paging) 생성
		Paging p = new Paging();

		//1. 전체 게시물 수량 구하기
		p.setTotalRecord(OrderListDAO.getTotalCount());
		p.setTotalPage();
		System.out.println("> 전체 게시글 수 : " + p.getTotalRecord());
		System.out.println("> 전체 페이지 수 : " + p.getTotalPage());
		
		//2. 현재 페이지 구하기
		String cPage = request.getParameter("cPage");
		System.out.println(cPage);
		if (cPage != null) {
			p.setNowPage(Integer.parseInt(cPage));
		}
		System.out.println("> cPage : " + cPage);
		System.out.println("> paging nowPage : " + p.getNowPage());
		
		//3. 현재 페이지에 표시할 게시글 시작번호(begin), 끝번호 구하지
		p.setEnd(p.getNowPage() * p.getNumPerPage());
		p.setBegin(p.getEnd() - p.getNumPerPage() + 1);
		
		//3-1. (선택적) 끝 번호가 데이터 건수보다 많아지면 데이터 건수와 동일하게 설정
		if (p.getEnd() > p.getTotalRecord()) {
			p.setEnd(p.getTotalRecord());
		}
		
		System.out.println(">> 시작번호(begin) : " + p.getBegin());
		System.out.println(">> 끝번호(end) : " + p.getEnd());
		
		//------ 블록(block) 게산하기 -----------------
		//4. 블록 시작페이지, 끝페이지 구하기
		//4-1. 시작페이지 구하기
		int beginPage = (p.getNowPage() - 1) / p.getPagePerBlock() * p.getPagePerBlock() + 1;
		p.setBeginPage(beginPage);
		p.setEndPage(beginPage + p.getPagePerBlock() -1);
		
		//4-2. 끝페이지(endPage)가 전체 페이지 수(totalPage) 보다 크면
		// 끝페이지를 전체 페이지 수로 변경처리(설정)
		if (p.getEndPage() > p.getTotalPage()) {
			p.setEndPage(p.getTotalPage());
		}
		
		System.out.println(">> 시작페이지(beginPage) : " + p.getBeginPage());
		System.out.println(">> 끝페이지(endPage) : " + p.getEndPage());
		
		System.out.println("p : " + p);
		
		/////////////////////////////////////////////////
		//현재 페이지 기준으로 DB데이터(게시글) 가져오기
		//시작번호(begin), 끝번호(end) 사용해서
		
		List<OrderListVO> list = OrderListDAO.getListHot(p.getBegin(), p.getEnd());
		System.out.println(">> 현재 페이지 글목록(list) : " + list);
		
		//--------------------------
		//JSTL, EL 사용을 위해 scope에 데이터 등록(page 영역)
		request.setAttribute("list", list);
		request.setAttribute("pvo", p);
		
		//(개인적실습) 현재 페이지번호 사용 블록번호 구하고, 블록번호로 시작/끝 페이지 구하기
		System.out.println("p : " + p);	
		
		request.getRequestDispatcher("orderListAdmin.jsp?cPage=" + cPage).forward(request, response);
		
		System.out.println("OrderListController doGet() 끝");	
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("> ListController doPost() 시작");
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
		System.out.println("> ListController doPost() 끝");
	}
}
