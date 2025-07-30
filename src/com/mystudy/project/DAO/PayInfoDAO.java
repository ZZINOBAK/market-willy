package com.mystudy.project.DAO;
import java.util.List;
import org.apache.ibatis.session.SqlSession;

import com.mystudy.mybatis.DBService;
import com.mystudy.project.VO.PayInfoVO;

public class PayInfoDAO {
	
	public static List<PayInfoVO> getList(String id) {
		List<PayInfoVO> list = null;
		try (SqlSession ss = DBService.getFactory().openSession()) {
			list = ss.selectList("jspProject.payInfoId", id);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public static List<PayInfoVO> getAddr(String id) {
		List<PayInfoVO> list = null;
		try (SqlSession ss = DBService.getFactory().openSession()) {
			list = ss.selectList("jspProject.addr", id);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public static List<PayInfoVO> getList() {
		List<PayInfoVO> list = null;
		SqlSession ss = null;
		try {
			ss = DBService.getFactory().openSession();
			list = ss.selectList("jspProject.payInfoAdmin");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		return list;
	}
	
	 public boolean insertPayment(PayInfoVO payInfoVO) {
		 SqlSession ss = null;
	        try {
	        	ss = DBService.getFactory().openSession();
	            int rowsInserted = ss.insert("jspProject.insertPayInfo", payInfoVO);
	            ss.commit();
	            return rowsInserted > 0;
	        } catch (Exception e) {
	            e.printStackTrace();
	            
	        } finally {
				ss.close();
			}
	        return false;
	    }	

}
