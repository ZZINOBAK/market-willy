<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 회원 조회</title>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="../resource/js/viewAllCustomer_admin.js"></script>
<style>
.center {
    text-align: center;
    padding: 0;
    border: 1px solid white;
    width: 200px;
    margin: auto;
    margin-top: 20px;
}

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

	<table border>
		<cation>회원목록</cation>
		<thead>
		<tr>
			<th>아이디</th>
			<th>이름</th>
			<th>비밀번호</th>
			<th>핸드폰 번호</th>
			<th>우편번호</th>
			<th>주소</th>
			<th>상세주소</th>
			<th>가입일</th>
		</tr>
		</thead>
		<tbody id='tbody'>
			
		</tbody>
	</table>
	<a href="main_admin.jsp">뒤로가기</a>
</body>
</html>