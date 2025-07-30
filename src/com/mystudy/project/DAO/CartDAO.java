package com.mystudy.project.DAO;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.mybatis.DBService;
import com.mystudy.project.VO.CartVO;

public class CartDAO {

	//장바구니 조회 - 전체
	public static List<CartVO> getList() {
		SqlSession ss = DBService.getFactory().openSession();
		List<CartVO> list = ss.selectList("jspProject.clist");
		ss.close();
		return list;
	}
	
	//장바구니 조회 - 아이디로
	public static List<CartVO> getListById(String test) {
		SqlSession ss = DBService.getFactory().openSession();
		List<CartVO> list = ss.selectList("jspProject.cListId", test);
		ss.close();
		return list;
	}
	
	//장바구니 조회 - 상품번호 + 아이디로
	public static CartVO selectOne(CartVO test) {
		SqlSession ss = DBService.getFactory().openSession();
		CartVO list = ss.selectOne("jspProject.cSelect", test);
		ss.close();
		return list;
	}
	
	//장바구니 담기
	public static int insertCart(CartVO test) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.insert("jspProject.cInsert", test);
	    ss.close();
	    return result; 
	}
	
	//장바구니 수정
	public static int updateCart(CartVO test) {
		SqlSession ss = DBService.getFactory().openSession(false);
		int result = ss.update("jspProject.cUpdate", test);
	    if (result == 1) {
	        ss.commit();
	    } else {
	        // 예외 처리: Update가 실패한 경우 예외를 발생시키거나 처리합니다.
	        // 여기에서는 RuntimeException을 예외로 던집니다.
	        System.out.println("실패");
	    }
	    ss.close();
	    return result;
	}
	
	//장바구니 삭제
	public static int deleteCart(CartVO test) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.delete("jspProject.cDelete", test);
	    ss.close();
	    return result; 
	}
}





