<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제하기</title>
<script>
	function go_main() {
		window.location.href = "../main_login.jsp";
	}

	function go_payment() {
		var form = document.getElementById("purchasetForm");
        
		var aInput = document.createElement("input");
        aInput.type = "hidden"; // 숨겨진 입력 필드로 만듭니다.
        aInput.name = "type"; // 이름 설정
        aInput.value = "insert"; // 값을 설정

        // 폼에 추가 데이터를 추가
        form.appendChild(aInput);
        
        // 폼을 서버로 제출
        form.submit();
	}
	
	function go_before() {
	    window.history.back(); // 이전 페이지로 이동
	}

</script>
</head>
<body>
	<button onclick="go_main()">메인페이지로가기</button>

	<h1>결제하기test</h1>
	<form action="payment" method="get" id="purchasetForm">
		<table>
	        <thead>
	            <tr>
	                <th>장바구니번호</th>
	                <th>확인용아이디<th>
	                <th>상품번호</th>
	                <th>상품명</th>
	                <th>수량</th>
	                <th>가격</th>
	                <th>할인가</th>
	            </tr>
	        </thead>
	        <tbody>
	            <c:forEach var="vo" items="${list}">
	                <tr>
	                    <td>${vo.oNum}</td>
	                    <td>${vo.id}</td>
	                    <td>${vo.productNum}
	                    <input type="hidden" name="productNum" value="${vo.productNum}">
	                    </td>
	                    <td>${vo.productName}
	                    <input type="hidden" name="productName" value="${vo.productName}">
	                    </td>
	                    <td>${vo.cCount}
	                    <input type="hidden" name="cCount" value="${vo.cCount}">
	                    </td>
	                    <td>${vo.price}
	                    <input type="hidden" name="price" value="${vo.price}">
	                    </td>
	                    <td>${vo.saleprice}
	                    <input type="hidden" name="saleprice" value="${vo.saleprice}">
	                    </td>
	                </tr>
	            </c:forEach>
	        </tbody>
	    </table>
		<button onclick="go_before()">취소하기</button>
		<button onclick="go_payment()">결제하기</button>
	</form>
</body>
</html>