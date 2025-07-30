<%@page import="com.mystudy.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
	<jsp:useBean id="ProductsVO" class="com.mystudy.project.VO.ProductsVO" scope="session"/>
<%
	ProductsVO.setCategoryMain(request.getParameter("categoryMain"));
	ProductsVO.setCategorySub(request.getParameter("categorySub"));
	ProductsVO.setProductname(request.getParameter("productname"));
	ProductsVO.setPrice(Integer.parseInt(request.getParameter("price")));
	ProductsVO.setSaleprice(Integer.parseInt(request.getParameter("saleprice")));
	ProductsVO.setImage(request.getParameter("image"));
	ProductsVO.setContent(request.getParameter("content"));
	ProductsVO.setPcount(Integer.parseInt(request.getParameter("pcount")));

%>	
	
<%
	//System.out.println("> update.jsp vo : " + ProductsVO);

	SqlSession ss = DBService.getFactory().openSession(true);
	
	try {
		int result = ss.update("jspProject.update", ProductsVO);
		if(result > 0) {
%>
			<script>
				alert("수정처리 완료");
				location.href = "../admin/main_admin.jsp";
			</script>
<%	
		}else if (result == 0) {
%>			
			<script>
				alert("수정 실패 \n"
						+ "다시 입력해 주세요");
				history.back();
			</script>
<%		
		}
		}catch (Exception e) {
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
	alert("[예외발생] 수정되지 않습니다");
	//history.back(); //이전페이지(수정화면)
	history.go(-1); //상세화면으로 이동
</script>
</head>
<body>

</body>
</html>