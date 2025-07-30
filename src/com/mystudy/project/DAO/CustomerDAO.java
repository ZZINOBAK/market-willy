package com.mystudy.project.DAO;


import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.mybatis.DBService;
import com.mystudy.project.VO.CustomerVO;

public class CustomerDAO {
	
	//회원가입
	public static int register(CustomerVO vo) {
		SqlSession ss = null;
		int result = 0;
		
		
		ss = DBService.getFactory().openSession();
		result = ss.insert("jspProject.register", vo);
		
		if(result > 0) {
			ss.commit();
		}
		
		if(ss != null) ss.close();
				
		return result;
	}
	
	//전체 회원 조회
	public static List<CustomerVO> allCustomer() {
		List<CustomerVO> list = null;
		SqlSession ss = null;
		
		try {
			ss = DBService.getFactory().openSession();
			list = ss.selectList("jspProject.allCustomer");
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(ss != null) ss.close();
		}
		
		return list;
	}
	
	//아이디 값으로 찾기
	public static CustomerVO checkId(String id) {
		CustomerVO chkId = null;
		SqlSession ss = null;
		
		try {
			ss = DBService.getFactory().openSession();
			chkId = ss.selectOne("jspProject.checkId", id);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(ss != null) ss.close();
		}
		
		return chkId;
	}
	
	//이름 값으로 찾기
	public static CustomerVO checkName(String name) {
		CustomerVO chkName = null;
		SqlSession ss = null;
		
		try {
			ss = DBService.getFactory().openSession();
			chkName = ss.selectOne("jspProject.checkName", name);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(ss != null) ss.close();
		}
		
		return chkName;
	}
	
	public static CustomerVO checkEmail(String email) {
		CustomerVO chkEmail = null;
		SqlSession ss = null;
		
		try {
			ss = DBService.getFactory().openSession();
			chkEmail = ss.selectOne("jspProject.checkEmail", email);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(ss != null) ss.close();
		}
		
		return chkEmail;
	}
	
	//회원정보 수정
	public static int updateCus(CustomerVO vo) {
		SqlSession ss = null;
		int result = 0;
		
		ss = DBService.getFactory().openSession();
		result = ss.update("jspProject.updateCustomer", vo);
		
		if(result > 0) {
			ss.commit();
		}
		
		if(ss != null) ss.close();
				
		return result;
	}
	
	//회원탈퇴
	public static int deleteCus(String id) {
		SqlSession ss = null;
		int result = 0;
		
		ss = DBService.getFactory().openSession();
		result = ss.delete("jspProject.deleteCustomer", id);
		
		if(result > 0) {
			ss.commit();
		}
		
		if(ss != null) ss.close();
		
		return result;
	}
}
