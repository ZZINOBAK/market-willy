<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
     

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>

<script>
	function list() {
		location.href = "list";
	}
</script>
</head>
<body>

	<div id="container">
	<h2>제품등록</h2>
	<hr>
	<p><a href="../admin/main_admin.jsp">[처음화면으로 이동]</a></p>
	
	<form action="insertProduct" method="post">
	<table>
		<tbody>
			<tr>
				<th >메인카테고리</th>
				<td>
				<select name="categoryMain" class="placehold-text">
					<option value="채소">채소</option>
					<option value="과일.견과.쌀">과일.견과.쌀</option>
					<option value="수산.해물.건어물">수산.해물.건어물</option>
					<option value="정육.계란">정육.계란</option>
				</select>
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
				<th>상품명</th>
				<td><input type="text" name="productname"></td>
			</tr>
			<tr>
				<th>상품원가</th>
				<td><input type="text" name="price">원</td>
			</tr>
			<tr>
				<th>상품할인가</th>
				<td><input type="text" name="saleprice">원</td>
			</tr>
			<tr>
				<th>상품사진</th>
				<td><input type="file" name="image"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><input type="text" name="content"></td>
			</tr>
			
			<tr>
				<th>재고수량</th>
				<td><input type="text" name="pcount"></td>
			</tr>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="2">
					<input type="submit" class="join" value="저 장">
					<input type="reset" value="취 소">
				</td>
			</tr>
		</tfoot>
	</table>
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