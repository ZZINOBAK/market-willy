<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="com.mystudy.project.VO.ProductsVO"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품목록</title>
<script>
	function insert_search() {
		location.href = "../product/insert_Product.jsp";
	}
	function search() {
		location.href = "../product/search_Product.jsp";
	}
</script>	
<style>
.sidebar {
    font-size: 18px;
    line-height: 3;
    margin-left: 10px;
}
ul {
            list-style: none;
            padding: 0;
            margin: 0;
            display: flex;
        }
        li {
            margin-right: 20px; /* 각 항목 간격 설정 */
        }
        
a {
	text-decoration: none; /* 밑줄 제거 */
	color: inherit; /* 링크 색상 지정 */
	font-family: noto sans;
	font-weight: 700;
}
a:hover{
	color: red;
}
</style>
</head>
<body>
<div class="sidebar">
    	<ul>
        	<li><a href="viewAllCustomer.jsp">고객 관리</a></li>
        	<li><a href="viewAllQna.jsp">문의사항 관리</a>
            <li><a href="admin_listProduct">상품 관리</a></li>
            <li><a href="selectOrderlist">주문 내역</a></li>
            <li><a href="adminPayInfo.jsp">결제 내역</a></li>
        </ul>
</div>
	<h1>제품목록</h1>
	<ul>
		<table border>
		<thead>
			<tr>
				<th>제품번호</th>
				<th>메인카테고리</th>
				<th>서브카테고리</th>
				<th>제품명</th>
				<th>가격</th>
				<th>할인가격</th>
				<th>사진</th>
				<th>내용</th>
				<th>상품등록일</th>
				<th>재고수량</th>
				<th>수정</th>
				<th>삭제</th>
			<tr>
		</thead>
		<tbody>
		<c:forEach var="pr" items="${list }">
			<tr>
		        <td>${pr.productnum}</td>
		        <td>${pr.categoryMain}</td>
		        <td>${pr.categorySub}</td>
		        <td>${pr.productname}</td>
		        <td>${pr.price}</td>
		        <td>${pr.saleprice}</td>
		        <td>${pr.image}</td>
		        <td>${pr.content}</td>
		        <td>${pr.regdate}</td>
		        <td>${pr.pcount}</td>
		        <td><a href="admin_updateProduct.jsp?productnum=${pr.productnum}">제품수정</a></td>
		        <td><a href="admin_deleteProduct.jsp?productnum=${pr.productnum}">제품삭제</a></td>
		    </tr>
		</c:forEach>	
		</tbody>
	</table>
	          
	</ul>
	<form action="search" method="post" class="">
		<input type="text" name="productname">
		<input type="submit" value="검색">
	</form>	
	<a href="../product/insert_Product.jsp">[상품추가]</a>
	<p><a href="main_admin.jsp">[처음화면으로 이동]</a></p>
</body>
</html>
                
	
	             
               
