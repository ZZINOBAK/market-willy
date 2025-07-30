
<%@page import="com.mystudy.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
	request.setCharacterEncoding("UTF-8");
    // JSP 페이지에서 전달된 제품 정보를 변수에 저장
%>
	<jsp:useBean id="vo" class="com.mystudy.project.VO.ReviewVO" />
	<jsp:setProperty property="*" name="vo"/>

<%    
	
	int oNum = (int) session.getAttribute("oNum");
	vo.setOnum(oNum);
	
	SqlSession ss = DBService.getFactory().openSession(true);

    
    
	try {
		int result = ss.delete("jspProject.deleteReview", vo);

    	if (result > 0) {
%>
			<script>
				alert("삭제처리완료");
				location.href = "../admin/selectOrderlist";
			</script>
<%        
   		} else if (result == 0){
%>  		
       
       		<script>
				alert("등록된리뷰가없습니다\n");
				history.back();
			</script>  
<%
   		} 
    } catch (Exception e){
    	e.printStackTrace();
    } finally {
    	ss.close();
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예외발생</title>
<!-- <script>
	alert("등록된리뷰가없습니다");
	history.back(); 
	
</script> -->
</head>
<body>

</body>
</html>	