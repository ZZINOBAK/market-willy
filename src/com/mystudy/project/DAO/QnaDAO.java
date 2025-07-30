package com.mystudy.project.DAO;

import java.util.*;

import org.apache.ibatis.session.SqlSession;

import com.mystudy.mybatis.DBService;
import com.mystudy.project.VO.QnaVO;

public class QnaDAO {
	
	//게시글 작성
	public static int writeQna(QnaVO vo) {
		SqlSession ss = null;
		int result = 0;
		
		ss = DBService.getFactory().openSession();
		result = ss.insert("jspProject.writeQna", vo);
		
		if(result > 0){
			ss.commit();
		}
		
		if(ss != null) ss.close();
		
		return result;
	}
	
	//전체 게시글 받기
	public static List<QnaVO> selectAll(){
		SqlSession ss = null;
		List<QnaVO> list = null;
		
		try {
			ss = DBService.getFactory().openSession();
			list = ss.selectList("jspProject.allQna");
		
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			ss.close();
		}
		System.out.println("QnaDAO -- list : " + list);
		
		return list;
	}
	
	//게시글 번호 조회해 상세보기
	public static QnaVO viewQna(int qnaNum) {
		SqlSession ss = null;
		QnaVO vo = null;
		
		try {
			ss = DBService.getFactory().openSession();
			vo = ss.selectOne("jspProject.viewQna", qnaNum);
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			if( ss != null) ss.close();
		}
		System.out.println("view vo : " + vo);
		
		return vo;
	}
	
	//아이디로 게시글 조회하기
	public static List<QnaVO> viewId(String id) {
		SqlSession ss = null;
		List<QnaVO> list = null;
		
		try {
			ss = DBService.getFactory().openSession();
			list = ss.selectList("jspProject.selectQna_id", id);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if( ss != null ) ss.close();
			
		}
		
		return list;
	}
	
	//미답변 게시글 조회
	public static List<QnaVO> notAnswerQna(){
		SqlSession ss = null;
		List<QnaVO> list = null;
		
		try {
			ss = DBService.getFactory().openSession();
			list = ss.selectList("jspProject.notAnswerQna");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ss != null) ss.close();
		}
		
		return list;
	}
	
	//답변 게시글 조회
	public static List<QnaVO> answerQna(){
		SqlSession ss = null;
		List<QnaVO> list = null;
		
		try {
			ss = DBService.getFactory().openSession();
			list = ss.selectList("jspProject.answerQna");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (ss != null) ss.close();
		}
		
		return list;
	}
	
	//게시글 수정
	public static int updateQna(QnaVO vo) {
		SqlSession ss = null;
		int result = 0;
		
		try {
			ss = DBService.getFactory().openSession();
			result = ss.update("jspProject.updateQna", vo);
			
			if(result > 0) {
				ss.commit();
			}	
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(ss != null) ss.close();
		}
		
		return result;
		
	}
	
	//게시글 삭제
	public static int deleteQna(int qnaNum) {
		System.out.println("deleteQna 실행");
		SqlSession ss = null;
		int result = 0;
		
		try {
			ss = DBService.getFactory().openSession();
			result = ss.delete("jspProject.deleteQna", qnaNum);
			System.out.println("deleteQna - result : " + result);
			
			if(result > 0) {
				ss.commit();
			}
		} catch(Exception e) {
			e.printStackTrace();
		}finally {
			if( ss != null ) ss.close();
		}
		
		return result;
	}
	
	//페이징-----
	//게시글 전체 건수 조회
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
	
	//페이지에 해당하는 글 목록 가져오기
	public static List<QnaVO> getList(int begin, int end){
		Map<String, Integer> map = new HashMap<>();
		map.put("begin", begin);
		map.put("end", end);
		
		SqlSession ss = DBService.getFactory().openSession();
		List<QnaVO> list = null;
		
		try {
			list = ss.selectList("jspProject.list", map);
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			ss.close();
		}
		return list;
	}
	//-----
	
	
	//관리자 답변시 답변정보 o처리
	public static int updateQnaOX(int ansNum) {
		SqlSession ss = null;
		int result = 0;
		
		try {
			ss = DBService.getFactory().openSession();
			result = ss.update("jspProject.updateQna_OX", ansNum);
			
			if(result > 0) {
				ss.commit();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			ss.close();
		}
		
		return result;
	}
}
