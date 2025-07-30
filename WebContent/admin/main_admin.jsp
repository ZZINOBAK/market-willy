<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%
	String id = (String) session.getAttribute("admin");
%>
<head>
<title>관리자 페이지</title>
<style>
*{
	background-color: black;
	color: white;
}
.center {
    text-align: center;
    padding: 0;
    border: 1px solid white;
    width: 200px;
    margin: auto;
    margin-top: 20px;
}

a{
	text-decoration: none;
}
a:hover{
	color: red;
}
</style>
</head>

<body>
	<h2 class="center">고객관리</h2>
	<p class="center"><a href="viewAllCustomer.jsp">전체 회원 조회</a></p>
	<hr>
	
	<h2 class="center">문의사항 관리</h2>
	<p class="center"><a href="viewAllQna.jsp">전체 문의사항 조회</a></p>
	<hr>
	
	<h2 class="center">상품관리</h2>
	<p class="center"><a href="admin_listProduct">전체 상품 조회</a></p>
	<hr>
	
	<h2 class="center">주문관리</h2>
	<p class="center"><a href="selectOrderlist">전체 주문 내역</a></p>
	<hr>
	
	<h2 class="center">결제 관리</h2>
	<p class="center"><a href="adminPayInfo.jsp">결제 내역</a>
	<hr><hr>
	<br><br>
	<p class="center"><a href="../main.jsp">쇼핑몰 페이지로 돌아가기</a>
</body>

</html>