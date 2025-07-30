package com.mystudy.project.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;


import com.mystudy.mybatis.DBService;
import com.mystudy.project.VO.ProductsVO;
import com.mystudy.project.VO.ReviewVO;



public class ReviewDAO {
	
	

	public static int getTotalCount() {
		int totalCount = 0;
		
		SqlSession ss = DBService.getFactory().openSession();
		try {
			totalCount = ss.selectOne("jspProject.totCount");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		
		return totalCount;
	}
	
	//페이지에 해당하는 글목록(게시글) 가져오기(조회)
	public static List<ReviewVO> getList(int begin, int end) {
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);
		
		SqlSession ss = DBService.getFactory().openSession();
		List<ReviewVO> list = ss.selectList("jspProject.page", map);
		ss.close();
		
		return list;
	}
	public static List<ReviewVO> getReviewList(int productnum) {
		SqlSession ss = DBService.getFactory().openSession();
		List<ReviewVO> list = ss.selectList("jspProject.reviewlist", productnum);
		ss.close();
		
		return list;
	}
	public static int insert(ProductsVO vo) {
		SqlSession ss = DBService.getFactory().openSession();
		int result = ss.insert("jspProject.addReview", vo);
		ss.close();
		return result;
     
    }
	
	
	

}



