package com.mystudy.project.DAO;

import javax.servlet.http.HttpSession;
import org.apache.ibatis.session.SqlSession;

import com.mystudy.mybatis.DBService;
import com.mystudy.project.VO.QnaAnswerVO;
import com.mystudy.project.VO.QnaVO;

public class QnaAnswerDAO {
	
	//답변작성
	public static int writeAnswer(QnaAnswerVO vo) {
		SqlSession ss = null;
		int result = 0;
		
		ss = DBService.getFactory().openSession();
		result = ss.insert("jspProject.writeAnswerQna", vo);
		
		if(result > 0) {
			ss.commit();
		}
		
		if(ss != null) ss.close();
		
		return result;
	}
	
	//답변찾기
	 public static QnaAnswerVO findAnswer(int qnaNum) { 
		 SqlSession ss = null;
		 QnaAnswerVO vo = null;
	 
		 try {
			 ss = DBService.getFactory().openSession();
			 vo = ss.selectOne("jspProject.findAnswer", qnaNum);
			 
		 } catch(Exception e){
			 e.printStackTrace();
			 
		 } finally {
			 ss.close();
		 }
		 
		 return vo;
	 }
	
}
