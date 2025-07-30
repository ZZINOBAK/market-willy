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



public class ProductsDAO {
	
	public static List<ProductsVO> getList() {
		SqlSession ss = DBService.getFactory().openSession();
		List<ProductsVO> list = ss.selectList("jspProject.listProduct");
		ss.close();
		return list;
	}
	
	public static List<ProductsVO> getListone(String productname) {
		SqlSession ss = DBService.getFactory().openSession();
		List<ProductsVO> list = ss.selectList("jspProject.listone", productname);
		ss.close();
		return list;
	}
	
	public static int update(ProductsVO vo) {
		SqlSession ss = DBService.getFactory().openSession(true);
		int result = ss.update("jspProject.update", vo);
		ss.close();
		return result;
	}
	
	/*
	public int insert(ProductsVO product) {
        Connection con = null;
        PreparedStatement pstmt = null;
        int result = 0;

        con = DBUtil.getConnection();
        StringBuffer sql = new StringBuffer();
        sql.append("INSERT INTO PRODUCTS (PRODUCT_NUM, CATEGORY_MAIN, CATEGORY_SUB, PRODUCT_NAME, PRICE, SALEPRICE, IMAGE, CONTENT, REGDATE, P_COUNT)");
        sql.append("VALUES (PRODUCTS_SEQ.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, SYSDATE, ?)");

        try {
            pstmt = con.prepareStatement(sql.toString());
            pstmt.setString(1, product.getCategoryMain());
            pstmt.setString(2, product.getCategorySub());
            pstmt.setString(3, product.getProductname());
            pstmt.setInt(4, product.getPrice());
            pstmt.setInt(5, product.getSaleprice());
            pstmt.setString(6, product.getImage());
            pstmt.setString(7, product.getContent());
            pstmt.setInt(8, product.getPcount());
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
        	DBUtil.close(con, pstmt);
        }
        return result;
    }
    */
	
	public static int insertProduct(ProductsVO product) {
		SqlSession ss = null;
		int result = 0;
		
		try {
			ss = DBService.getFactory().openSession();
			result = ss.insert("jspProject.proinsert", product);
			
			if(result > 0) {
				ss.commit();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if (ss != null) ss.close();
		}
		
		return result;
	}

	public static int getTotalCount() {
		int totalCount = 0;
		
		SqlSession ss = DBService.getFactory().openSession();
		try {
			totalCount = ss.selectOne("jspProject.totalCount");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		
		return totalCount;
	}
	
	//페이지에 해당하는 글목록(게시글) 가져오기(조회)
	public static List<ProductsVO> getList(int begin, int end) {
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);
		
		SqlSession ss = DBService.getFactory().openSession();
		List<ProductsVO> list = ss.selectList("jspProject.plist", map);
		ss.close();
		
		return list;
	}

}



