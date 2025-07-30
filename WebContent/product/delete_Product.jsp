<%@page import="com.mystudy.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  
<%
	request.setCharacterEncoding("UTF-8");
%>
	<jsp:useBean id="vo" class="com.mystudy.project.VO.ProductsVO" />
	<jsp:setProperty property="*" name="vo"/>
	
<%
	//System.out.println("> delete_ok.jsp vo : " + vo);
	
	SqlSession ss = DBService.getFactory().openSession(true);
	
	try {
		int result = ss.delete("jspProject.delete", vo);
		
		//3. 화면전환 - 정상처리시
		if(result > 0) {
%>
			<script>
				alert("삭제처리 완료");
				location.href = "list_Product";
			</script>
<%	
		}else if (result == 0) {
%>			
			<script>
			alert("암호가 일치하지않습니다 \n"
					+ "다시 입력해 주세요");
			history.back();
			</script>
<%			
		}
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		ss.close();
	}
	
	//3. 화면전환 예외발생시
%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예외발생</title>
<script>
	alert("[예외발생] 삭제처리 실패");
	history.back(); 
	
</script>
</head>
<body>

</body>
</html>	

