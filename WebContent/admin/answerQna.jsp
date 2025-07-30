<%@page import="com.mystudy.project.VO.QnaVO"%>
<%@page import="com.mystudy.project.DAO.QnaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	int qnaNum = Integer.parseInt(request.getParameter("qnaNum"));
	QnaVO vo = QnaDAO.viewQna(qnaNum);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의사항 답변</title>

<script>
	function btn_back(){
		history.back();
	}
</script>
<style>
textarea {
	min-width: 300px;
	min-height: 300px;
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

	<h3>답변할 문의글</h3>
			<label for="loginId">작성자</label><br>
				<input type="text" name="id" id="id" value="<%=vo.getId()%>" readonly="readonly"><br>
				
			<label for="loginId">제목</label><br>
				<input type="text" value="<%=vo.getQnaTitle()%>" readonly="readonly"><br>
				
			<label for="userpw">문의내용</label><br>
			<textarea readonly="readonly"><%=vo.getQnaContent()%></textarea><br>

	<br><br><hr>
	<h3>문의답변</h3>
	<form action="answerWriter" method="POST">
			<input type="text" name="ansNum" value="<%=qnaNum%>" hidden="hidden">

			<input type="text" name="ansTitle" value="관리자 답변" hidden="hidden"><br>

			<label for="userpw">답변내용<span id=ico>*</span></label><br>
			<textarea name="ansContent"></textarea><br>

		<div class="boder_btom"></div>
		<button type="submit">작성하기</button>
		<button type="button" onclick="btn_back()">뒤로가기</button>
		</div>
	</form>
</body>
</html>