<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 주문내역 관리</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
.image {
	float: left; /* 이미지를 왼쪽으로 띄웁니다. */
	margin: 5px;
}

.productName {
	vertical-align: top; /* 텍스트 컨테이너를 셀의 위쪽으로 정렬합니다. */
	text-align: left;
	color: rgb(95, 0, 128);
	margin-top: 10px;
	margin-left: 5px;
	text-decoration: none;
	font-size: 20px;
	font-weight: bold;
}

.content {
	vertical-align: top; /* 텍스트 컨테이너를 셀의 위쪽으로 정렬합니다. */
	text-align: left;
	margin-top: 5px;
	margin-left: 25px;
	font-size: 13px;
}

/*** 페이지 표시 영역 스타일(시작) ***/
.paging {
	list-style: none;
}

.paging li {
	float: left;
	margin-right: 8px;
}

.haeun {
	text-decoration: none;
	display: block;
	padding: 3px 7px;
	border: 1px solid #00b3dc;
	font-weight: bold;
	color: black;
}

.haeun2 {
	text-decoration: none;
	display: block;
	padding: 3px 7px;
	font-weight: bold;
	color: black;
}

.paging .disable {
	border: 1px solid silver;
	padding: 3px 7px;
	color: silver;
}

.paging .now {
	border: 1px solid #ff4aa5;
	padding: 3px 7px;
	background-color: #ff4aa5;
}
/*** 페이지 표시 영역 스타일(끝) ***/
#orderListByForm {
	display: inline-block;
	float: right;
}

/* 테이블을 100% 너비로 설정 */
table {
	width: 98%;
	border-collapse: collapse; /* 테이블 셀 경계를 병합하도록 설정 */
	margin: 10px;
	display: center;
	font-size: 12px;
}

/* 테이블 셀 간격 설정 (선택 사항) */
table th, table td {
	padding: 8px;
	border: 1px solid #ccc;
}

/* 테이블 레이아웃이 작동하도록 적절한 CSS 스타일 설정 */
/* 테이블 헤더 스타일 (선택 사항) */
table th {
	background-color: #f2f2f2;
	text-align: center;
}

/* 테이블 셀 스타일 (선택 사항) */
table td {
	text-align: center;
}

/* 테이블을 가운데 정렬 */
#orderListAdminForm {
	text-align: center; /* 수평 가운데 정렬 */
	display: center;
	justify-content: center;
	align-items: center;
	margin: 5px;
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
<script>
	function go_main() {
		window.location.href = "main_admin.jsp";
	}
	
	function go_orderList() {
		location.href = "selectOrderlist";
	}
	
	function go_orderListHot() {
		location.href = "selectOrderlist?type=hot";
	}
	
	function go_orderListrDelete() {
		location.href = "selectOrderlist?type=rDelete";
	}
	
	function go_otherPage(pageNo) {
		var form = document.getElementById("orderListAdminForm");
		
		var aInput = document.createElement("input");
        aInput.type = "hidden"; // 숨겨진 입력 필드로 만듭니다.
        aInput.name = "cPage"; // 이름 설정
        aInput.value = pageNo; // 값을 설정
        
        var oNumInput = document.createElement("input");
        oNumInput.type = "hidden";
        oNumInput.name = "type";
        oNumInput.value = "list"; // oNum 값을 설정

        // 폼에 추가 데이터를 추가
        form.appendChild(aInput);
        
        form.appendChild(oNumInput);
        
        form.submit();
	}
	function go_orderListBy() {
		var form = document.getElementById("orderListByForm");
		
		// 선택된 옵션 엘리먼트 가져오기
	    var selectElement = document.getElementById("mainList");
	    var selectedOption = selectElement.options[selectElement.selectedIndex];
	    
	    // 선택된 옵션의 값을 가져오기
	    var selectedValue = selectedOption.value;

	    // 숨겨진 입력 필드 생성하여 선택된 값을 폼에 추가
	    var hiddenInput = document.createElement("input");
	    hiddenInput.type = "hidden";
	    hiddenInput.name = "selectedValue"; // 서버에서 사용할 파라미터 이름
	    hiddenInput.value = selectedValue;

	    // 폼에 숨겨진 입력 필드 추가
	    form.appendChild(hiddenInput);
	    
	    // 폼 요소 가져오기
	    
	    
	    var a = document.createElement("input");
	    a.type = "hidden";
	    a.name = "type"; // 서버에서 사용할 파라미터 이름
	    a.value = "list";

	    // 폼에 숨겨진 입력 필드 추가
	    form.appendChild(a);
	    
	    // 폼을 서버로 제출
	    form.submit();
	}
	
	function go_delete(oNum, payment, id, button) {
	    var data = {
	        oNum: oNum,
	        payment: payment,
	        id: id
	    };

	    $.ajax({
	        url: '../order/deleteOrderlist',
	        type: 'GET',
	        data: data,
	        success: function(response) {
	            try {
	                var parsedData = JSON.parse(response);
	                var success = parsedData.success;
	                var updatedPayment = parsedData.payment;

	                if (success) {
	                    // 업데이트된 payment 값을 화면에 반영
	                    var tdElement = button.parentElement;
	                    var paymentElement = tdElement.firstChild;
	                    paymentElement.textContent = updatedPayment;
	                    button.style.display = 'none'; // 버튼 감추기
	                } else {
	                    alert('주문 취소에 실패했습니다.');
	                }
	            } catch (e) {
	                console.error('JSON 파싱 오류: ' + e);
	            }
	        },
	        error: function(xhr, status, error) {
	            console.error('오류: ' + error);
	        }
	    });
	}
	
	// 알러트창
	var alertMessage = "${alertMessage}"; // 서버에서 전달된 알림 메시지
	var hasDisplayedAlert = sessionStorage.getItem("hasDisplayedAlert");

	if (alertMessage && !hasDisplayedAlert) {
	    alert(alertMessage);
	    sessionStorage.setItem("hasDisplayedAlert", "true");
	}
</script>
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

<h2 onclick="go_orderList()" style="cursor: pointer; display: inline-block; margin: 0px;">주문내역</h2>
<hr>

<div>
	<button type="button" onclick="go_orderListHot()">판매량순 조회</button>
	<button type="button" onclick="go_orderListrDelete()">환불요청 조회</button>

	<form action="selectOrderlist" id="orderListByForm" method="get">
	    <select id="mainList">
	        <option value="id" data-subitems="true">아이디</option>
	        <option value="oNum" data-subitems="false">주문번호</option>
	        <option value="productNum" data-subitems="true">상품번호</option>
	    </select>
	    <input type="text" id="idInput" name="idd" placeholder="입력">
	    <button type="button" onclick="go_orderListBy()">조회</button>
	</form>
</div>	
	<form action="selectOrderlist" method="get" id="orderListAdminForm" >
	
   		<table border="1">
   		
	        <thead>
	            <tr>
	            	<th>번호</th>
	            	<th class="order-columns">주문번호</th>
	            	<th>상품번호</th>
	            	<th class="order-columns">고객ID</th>
	                <th>상품</th>
	                <th>수량</th>
	                <th class="order-columns">구매날짜</th>
	                <th>가격</th>
	                <th>할인가</th>
	                <th>구매가</th>
	                <th class="order-columns">결제여부</th>
	                <th class="hide-if-not-zero">총판매액</th>
	            </tr>
	        </thead>
	        <c:set var="startIndex" value="${pvo.begin}" />
			<c:set var="endIndex" value="${pvo.end}" />
			<c:forEach var="vo" items="${list}">
	
	            <c:set var="totalPrice" value="${vo.cCount * vo.price}" />
	            <c:set var="totalSalePrice" value="${vo.cCount * vo.saleprice}" />
	        <tbody>
	            
	                <tr>
	                    <td>
	                       <c:if test="${startIndex <= endIndex}">
                    <c:set var="startIndex" value="${startIndex + 1}" />
                </c:if>
                ${startIndex - 1}
	                    	<input type="hidden" name="productName" value="${vo.productName}">
	                    </td>
	                    <td  class="order-columns">${vo.oNum}
	                    	<input type="hidden" name="productName" value="${vo.productName}">
	                    </td>
	                    <td>${vo.productNum}
	                    	<input type="hidden" name="productName" value="${vo.productName}">
	                    </td>
	                    <td  class="order-columns">${vo.id}
	                    	<input type="hidden" name="productName" value="${vo.productName}">
                    	</td>
                    	<td>
						    <article class="test">
							    <div>
							    	<img src="../resource/image/${vo.image }" width="60px;" height="60px;" alt="상품이미지">
						             <a href="../product/one_Product.jsp?productnum=${vo.productNum }" class="productName">
						             ${vo.productName}
						             </a>
							        <p class="content"> ${vo.content } </p> 
							    </div>
					    	</article>
						</td>
	                    <td>${vo.cCount}
	                    </td>
	                    <td  class="order-columns">${vo.oDate}
	                    	<input type="hidden" name="price" value="${totalPrice}">
	                    </td>
	                    <c:choose>
            				<c:when test="${vo.oNum == '0'}">
						        <td>${vo.price} </td>
						        <td>${vo.saleprice} </td>
						        <td>${vo.price - vo.saleprice} </td>
						        <td>${(vo.price - vo.saleprice ) * vo.cCount }</td>
						    </c:when>
						    <c:otherwise>
						        <td>${totalPrice}
						            <input type="hidden" name="price" value="${totalPrice}">
						        </td>
						        <td>${totalPrice - totalSalePrice}
						            <input type="hidden" name="saleprice" value="${totalPrice - totalSalePrice}">
						        </td>
						        <td>${totalSalePrice}
						            <input type="hidden" name="saleprice" value="${totalSaleprice}">
						        </td>
						    </c:otherwise>
						</c:choose>
	                    <td  class="order-columns">
						    <c:choose>
						        <c:when test="${vo.payment eq '환불중'}">
						            ${vo.payment}<br>
						            <button type="button" onclick="go_delete(${vo.oNum}, '${vo.payment}', '${vo.id}', this)">환불완료</button>
						        </c:when>
						        <c:otherwise>
						            ${vo.payment}
						        </c:otherwise>
						    </c:choose>
						</td>
						<script>
						
	    var oNum = ${vo.oNum}; // 이 부분을 실제 주문번호 데이터로 대체해야 합니다.
	    var columns = document.querySelectorAll('.order-columns');
	    
	    if (oNum === 0) {
	        // 주문번호가 0인 경우, 해당 컬럼들을 숨깁니다.
	        for (var i = 0; i < columns.length; i++) {
	            columns[i].style.display = 'none';
	        }
	    } else {
	        // 주문번호가 0이 아닌 경우, 숨겨야 하는 컬럼의 클래스를 여기에 추가하고 숨김 처리합니다.
	        var hideColumns = document.querySelectorAll('.hide-if-not-zero');
	        for (var j = 0; j < hideColumns.length; j++) {
	            hideColumns[j].style.display = 'none';
	        }
	    }

	</script>
	
			  	  	</c:forEach>
             	   </tr>
             	   
             	   <c:forEach var="vo" items="${list}">
    <c:set var="totalAmount" value="${totalAmount + (vo.cCount * (vo.price - vo.saleprice))}" scope="page" />
</c:forEach>
             	   <tr  class="hide-if-not-zero">
				<td colspan="7">총판매액</td>
    <td>${totalAmount}</td>
             	   </tr>
        	</tbody>
        	 	
	<!-- 페이징 -->
	        <tfoot>
			<tr>
				<td colspan="12">
					<ol class="paging">
					<%--[<<]에 대한 사용여부 처리 --%>
					<c:if test="${pvo.nowPage <= pvo.pagePerBlock }">
						<li class="disable">&lt; &lt;</li>
					</c:if>
					<c:if test="${pvo.nowPage > pvo.pagePerBlock }">
						<li>
							<button onclick="go_otherPage(1)" class="haeun">&lt; &lt;</button>
						</li>
					</c:if>	
					
					<%--[<]에 대한 사용여부 처리 --%>
					<c:if test="${pvo.nowPage == 1 }">
						<li class="disable">&lt;</li>
					</c:if>
					<c:if test="${pvo.nowPage != 1 }">
						<li>
						<button onclick="go_otherPage(${pvo.nowPage - 1})" class="haeun">&lt; </button>	
						</li>
					</c:if>	
					
					<%--블록내에 표시할 페이지 태그 작성(시작페이지) --%>
					<c:if test="${pvo.nowPage <= 3 }">
						<li style="display: none;">1 ...</li>
					</c:if>
					<c:if test="${pvo.nowPage > 3 }">
						<li>
						<a href="orderListAdmin.jsp?cPage=1" class="haeun2">1 ...</a>
						</li>
					</c:if>	
					
					
					<%--블록내에 표시할 페이지 태그 작성(시작페이지~끝페이지) --%>
					<c:forEach var="pageNo" begin="${pvo.beginPage }" end="${pvo.endPage }">
					<c:if test="${pageNo == pvo.nowPage }">
						<li class="now">${pageNo }</li>
					</c:if>	
					<c:if test="${pageNo != pvo.nowPage }">
						<li>
							<button onclick="go_otherPage(${pageNo})">${pageNo}</button>
						</li>
					</c:if>		
					</c:forEach>
					
					<%--블록내에 표시할 페이지 태그 작성(끝페이지) --%>
					
					<%--[>]에 대한 사용여부 처리 --%>
					<c:if test="${pvo.nowPage == pvo.totalPage }">
						<li style="display: none;">... ${pvo.totalPage }</li>
					</c:if>
					<c:if test="${pvo.nowPage < pvo.totalPage }">
						<li>
						<a href="orderListAdmin.jsp?cPage=1" class="haeun2">... ${pvo.totalPage }</a>
						</li>
					</c:if>	
					
					<%--[>>]에 대한 사용여부 처리 --%>
					<c:if test="${pvo.endPage >= pvo.totalPage }">
						<li class="disable">&gt; &gt;</li>
					</c:if>
					<c:if test="${pvo.endPage < pvo.totalPage }">
						<li>
							<button onclick="go_otherPage(${pvo.endPage + 1})" class="haeun">&gt; &gt;</button>
						</li>
					</c:if>		 
					</ol>
				</td>
			</tr>
		</tfoot>
	    </table>
	   
	</form>
	
<button type="button" onclick="go_main()">관리자 메인페이지로 돌아가기</button><br><br>
	
</body>
</html>