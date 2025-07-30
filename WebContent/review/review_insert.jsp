
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
	

	int productnum = (int) session.getAttribute("productnum");
	vo.setProductnum(productnum);
	int oNum = (int) session.getAttribute("oNum");
	vo.setOnum(oNum);
	//System.out.println("> vo : " + vo);
	SqlSession ss = DBService.getFactory().openSession(true);

    
    
	try {
		int result = ss.insert("jspProject.addReview", vo);

    	if (result > 0) {
%>
			<script>
				alert("정상 입력되었습니다\n목록페이지로 이동합니다");
				location.href = "../admin/selectOrderlist";
			</script>
<%        
   		} else if (result == 0){
%>  		
       
       		<script>
				alert("[예외발생] 입력작업중 오류발생\n"
					+ "이전페이지로 이동합니다");
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
<script>
	alert("[예외발생] 리뷰등록 실패");
	history.back(); 
	
</script>
</head>
<body>

</body>
</html>	