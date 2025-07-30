<%@page import="com.mystudy.project.VO.ProductsVO"%>
<%@page import="com.mystudy.mybatis.DBService"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
  
<%
	int productnum = Integer.parseInt(request.getParameter("productnum"));
	//System.out.println(productnum);

	SqlSession ss = DBService.getFactory().openSession();

	ProductsVO vo = ss.selectOne("jspProject.numone", productnum);
	ss.close();
	
	//System.out.println("vo : " + vo);
	
	session.setAttribute("ProductsVO", vo);
	//System.out.println("one.jsp session ProductsVO : " + session.getAttribute("ProductsVO"));
	
    String deleteURL = "../product/delete_ok.jsp?productnum=" + productnum;

	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 상세 정보</title>
<script>

</script>
</head>
<body>
    <div id="container">
	<h2>제품 상세 정보</h2>
	<hr>
	<p><a href="admin_listProduct">전체목록으로</a></p>
					
	<form action="../product/update_Product.jsp" method="post">
		
		<table>
			<tr>
				<th>메인카테고리</th>
				<c:choose>
					<c:when test="${ProductsVO.categoryMain eq '채소'}">
						<select name="categoryMain">
							<option value="채소" selected>채소</option>
							<option value="과일.견과.쌀">과일.견과.쌀</option>
							<option value="수산.해물.건어물">수산.해물.건어물</option>
							<option value="정육.계란">정육.계란</option>
						</select>
					</c:when>
					<c:when test="${ProductsVO.categoryMain eq '과일.견과.쌀'}">
						<select name="categoryMain">
							<option value="채소" >채소</option>
							<option value="과일.견과.쌀" selected>과일.견과.쌀</option>
							<option value="수산.해물.건어물">수산.해물.건어물</option>
							<option value="정육.계란">정육.계란</option>
						</select>
					</c:when>
					<c:when test="${ProductsVO.categoryMain eq '수산.해물.건어물'}">
						<select name="categoryMain">
							<option value="채소">채소</option>
							<option value="과일.견과.쌀">과일.견과.쌀</option>
							<option value="수산.해물.건어물" selected>수산.해물.건어물</option>
							<option value="정육.계란">정육.계란</option>
						</select>
					</c:when>
					<c:when test="${ProductsVO.categoryMain eq '정육.계란'}">
						<select name="categoryMain">
							<option value="채소">채소</option>
							<option value="과일.견과.쌀">과일.견과.쌀</option>
							<option value="수산.해물.건어물">수산.해물.건어물</option>
							<option value="정육.계란" selected>정육.계란</option>
						</select>
					</c:when>
				</c:choose>		
				</td>
			</tr>
			<tr>
				<th>서브카테고리</th>
				<td>
				<select name="categorySub" id="categorySub">
				</select>
				</td>
			</tr>
			<tr>
				<th>제품명</th>
				<td><input type="text" name="productname" value="${ProductsVO.productname }"></td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input type="text" name="price" value="${ProductsVO.price }"></td>
			</tr>
			<tr>
				<th>할인가격</th>
				<td><input type="text" name="saleprice" value="${ProductsVO.saleprice }"></td>
			</tr>
			<tr>
				<th>사진</th>
				<td><input type="file" name="image" value="${ProductsVO.image }"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><input type="text" name="content" value="${ProductsVO.content }"></td>
			</tr>
			<tr>
				<th>제품등록일</th>
				<td>${ProductsVO.regdate }</td>
			</tr>
			<tr>
				<th>재고수량</th>
				<td><input type="text" name="pcount" value="${ProductsVO.pcount }"></td>
			</tr>
		</table>
		<input type="hidden" name="productnum" value="${vo.productnum }">
		<input type="submit" value="수 정">
	</form>
	</div>

<script>
var categoryMain = document.getElementsByName("categoryMain")[0]; // 메인 카테고리 선택 요소
var categorySub = document.getElementsByName("categorySub")[0]; // 서브 카테고리 선택 요소

categoryMain.addEventListener("change", function() {
    var selectedMainCategory = categoryMain.value;
    
    // 서브 카테고리 옵션 초기화
    categorySub.innerHTML = "";
    
    if (selectedMainCategory === "채소") {
        // 채소에 대한 서브 카테고리 설정
        var options = ["친환경", "고구마.감자.당근", "양파.마늘.대파.배추"];
        options.forEach(function(option) {
            var optionElement = document.createElement("option");
            optionElement.value = option;
            optionElement.text = option;
            categorySub.appendChild(optionElement);
        });
    } else if (selectedMainCategory === "과일.견과.쌀") {
        // 과일.견과.쌀에 대한 서브 카테고리 설정
        var options = ["과일", "견과류", "쌀.잡곡"];
        options.forEach(function(option) {
            var optionElement = document.createElement("option");
            optionElement.value = option;
            optionElement.text = option;
            categorySub.appendChild(optionElement);
        });
    } else if (selectedMainCategory === "수산.해물.건어물") {
        // 과일.견과.쌀에 대한 서브 카테고리 설정
        var options = ["생선류", "해조류", "조개류"];
        options.forEach(function(option) {
            var optionElement = document.createElement("option");
            optionElement.value = option;
            optionElement.text = option;
            categorySub.appendChild(optionElement);
        });
    } else if (selectedMainCategory === "정육.계란") {
        // 과일.견과.쌀에 대한 서브 카테고리 설정
        var options = ["소고기", "돼지고기", "닭고기"];
        options.forEach(function(option) {
            var optionElement = document.createElement("option");
            optionElement.value = option;
            optionElement.text = option;
            categorySub.appendChild(optionElement);
        });
    } 
});

// 페이지 로드시 초기 서브 카테고리 설정
categoryMain.dispatchEvent(new Event("change"));
</script>		
</body>
</html>