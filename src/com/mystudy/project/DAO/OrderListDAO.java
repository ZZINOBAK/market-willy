package com.mystudy.project.DAO;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.mybatis.DBService;
import com.mystudy.project.VO.OrderListVO;
import com.mystudy.project.VO.PayInfoVO;

public class OrderListDAO {

	//주문내역 조회
	public static List<OrderListVO> getList() {
		SqlSession ss = DBService.getFactory().openSession();
		List<OrderListVO> list = ss.selectList("jspProject.olist");
		ss.close();
		return list;
	}
	
	//주문내역 조회 - 아이디로
	public static List<OrderListVO> getListById(String test) {
		SqlSession ss = DBService.getFactory().openSession();
		List<OrderListVO> list = ss.selectList("jspProject.oListId", test);
		ss.close();
		return list;
	}
	
	//최근 장바구니에 담긴 물품만 가져오기
	public static List<OrderListVO> getListByIdnC(int selectedItem, String id) {
		Map<String, Object> map = new HashMap<>();
		map.put("selectedItem", selectedItem);
		map.put("id", id);
		System.out.println(map);
		
		SqlSession ss = DBService.getFactory().openSession();
		List<OrderListVO> list = ss.selectList("jspProject.selectItem", map);
		ss.close();
		
		return list;
	}
	
	//주문내역 추가
	public static int insertOrderList(OrderListVO test) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("jspProject.oInsert2", test);
	    ss.close();
	    return result; 
	}
	
	//주문내역 삭제
	public static int deleteOrderList(OrderListVO test) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.delete("jspProject.oDelete", test);
	    ss.close();
	    return result; 
	}
	
	//주문내역 삭제
	public static int updateOrderList(OrderListVO test) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.delete("jspProject.oUpdate", test);
	    ss.close();
	    return result; 
	}

	public static int getTotalCount() {
		int totalCount = 0;
		SqlSession ss = null;
		try {
			ss = DBService.getFactory().openSession();
			totalCount = ss.selectOne("jspProject.totalCountOrder");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(ss != null) ss.close();
		}
		
		return totalCount;
	}

	public static List<OrderListVO> getList(int begin, int end) {
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);
		
		SqlSession ss = DBService.getFactory().openSession();
		List<OrderListVO> list = ss.selectList("jspProject.list", map);
		ss.close();
		
		return list;
	}
	
	//장바구니 수량만큼 넘기기
	public static List<OrderListVO> getitems(int begin, String end) {
		Map<String, Object> map = new HashMap<>();
		map.put("a", begin);
		map.put("end", end);
		
		SqlSession ss = DBService.getFactory().openSession();
		List<OrderListVO> list = ss.selectList("jspProject.list", map);
		ss.close();
		
		return list;
	}
	
	public static List<OrderListVO> getListByIdAdmin(int begin, int end, String id) {
		Map<String, Object> map = new HashMap<>();
		map.put("id", id); 
		map.put("begin", begin);
		map.put("end", end);
		
		SqlSession ss = DBService.getFactory().openSession();
		List<OrderListVO> list = ss.selectList("jspProject.listbyid", map);
		ss.close();
		
		return list;
	}

	public static List<OrderListVO> getListByoNumAdmin(int begin, int end, int oNum) {
		Map<String, Integer> map = new HashMap<>();
		map.put("oNum", oNum); 
		map.put("begin", begin);
		map.put("end", end);
		
		SqlSession ss = DBService.getFactory().openSession();
		List<OrderListVO> list = ss.selectList("jspProject.listbyonum", map);
		ss.close();
		
		return list;
	}
	
	public static List<OrderListVO> getListByproductNumAdmin(int begin, int end, int productNum) {
		Map<String, Integer> map = new HashMap<>();
		map.put("productNum", productNum); 
		map.put("begin", begin);
		map.put("end", end);
		
		SqlSession ss = DBService.getFactory().openSession();
		List<OrderListVO> list = ss.selectList("jspProject.listbyproductnum", map);
		ss.close();
		
		return list;
	}

	public static List<OrderListVO> getListHot(int begin, int end) {
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);
		
		SqlSession ss = DBService.getFactory().openSession();
		List<OrderListVO> list = ss.selectList("jspProject.listhot", map);
		ss.close();
		
		return list;
	}
//	
//	public static List<OrderListVO> getOneByIdNoNum(String id, int oNum, Date oDate) {
//		Map<String, Object> map = new HashMap<>();
//		map.put("id", id);
//		map.put("oNum", oNum);
//		map.put("oDate", oDate);
//		
//		SqlSession ss = DBService.getFactory().openSession();
//		List<OrderListVO> list = ss.selectList("haeun.orderDetail", map);
//		ss.close();
//		
//		return list;
//	}
	
	public static List<OrderListVO> getListrDelete(int begin, int end) {
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);
		
		SqlSession ss = DBService.getFactory().openSession();
		List<OrderListVO> list = ss.selectList("jspProject.listrDelete", map);
		ss.close();
		
		return list;
	}
	
	public static List<OrderListVO> getOneByIdNoNum(OrderListVO test) {
		SqlSession ss = DBService.getFactory().openSession(true);
		System.out.println(test);
		List<OrderListVO> list = ss.selectList("jspProject.orderDetail", test);
		ss.close();
		
		return list;
	}

	public static List<PayInfoVO> getOneByIdNoNumNpay(int test1) {
		SqlSession ss = DBService.getFactory().openSession(true);
		System.out.println("payinfoDAO1 : " + test1);
		List<PayInfoVO> list = ss.selectList("jspProject.orderDetailPay", test1);
		System.out.println("payinfoDAO2 : " + test1);

		ss.close();
		
		return list;
	}

	public static List<OrderListVO> getOneByoNum(int oNum) {
		SqlSession ss = DBService.getFactory().openSession(true);
		List<OrderListVO> one = ss.selectList("jspProject.getOneByoNum", oNum);
		ss.close();
		
		return one;	
	}

	public static int updateOrderListoPayment(String oNum, int payNum) {
		Map<String, Object> map = new HashMap<>();
		map.put("oNum", oNum);
		map.put("payNum", payNum);
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("jspProject.updateOrderListoPayment", map);
		ss.close();
		
		return result;			
	}

	public static int generateOrderNumber() {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.selectOne("jspProject.generateOrderNumber");
		ss.close();
		
		return result;	
	}

}
