<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 내역</title>
    <link rel="stylesheet" href="../resource/css/commonEx.css">
    <link rel="stylesheet" href="../resource/css/mykurly_order_list.css">
    <link rel="stylesheet" href="../resource/css/mykurly_orderview.css">
    <link rel="stylesheet" href="../resource/css/order.css">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
	$(document).ready(function(){
		ajaxGetPayInfo();
	});
	function ajaxGetPayInfo() {
		$.ajax("getJsonAdminPayInfo", {
			type : "get",
			dataType : "json", //응답 받을 데이터 타입(형식)
			success : function(respData){
		
				//전달받은 JSON 데이터 사용 tr 태그 만들고 화면출력
				let htmlTag = "";
				let alist = respData.list; //JSON 객체의 속성명 "list"의 값 추출
				$.each(alist, function(index, member){
					htmlTag += "<tr>";
					htmlTag += "<td>" + this.oNum + "</td>";
					htmlTag += "<td>" + this.id + "</td>";
					htmlTag += "<td>" + this.productName + "</td>";
					htmlTag += "<td>" + this.oCount + "</td>";
					htmlTag += "<td>" + this.oPatment + "</td>";
					
					if (this.info == 0) {
						htmlTag += "<td>배송전</td>";
					} else if (this.info == 1){
						htmlTag += "<td>배송완료</td>";
					} else {
						htmlTag += "<td>환불완료</td>";
					}
					htmlTag += "</tr>";
				});	
				$("#dispData").html(htmlTag);
			},
			error : function(jqXHR, textStatus, errorThrown){
				console.log(">> Ajax 처리 실패 : \n"
						+ "jqXHR.readyState : " + jqXHR.readyState + "\n"
						+ "textStatus : " + textStatus + "\n"
						+ "errorThrown : " + errorThrown);
			}
		});
	}
</script>

<style>
    .sidebar {
        font-size: 18px; /* 글씨 크기 조절 */
        line-height: 3; /* 글씨 간격 조절 */
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
    <div id="container">
        
        <div id="main" class="order_complete">
            <div id="content">
                
                <div class="page_aticle aticle_type2">
                    <div class="section_orderview">
                        <div class="head_aticle">
                            <h2 class="tit">결제 내역</h2>
                        </div>


                        <div class="head_section">
                            <h3 class="tit">결제 정보</h3>
                        </div>

                        <table class="tbl tbl_type2">
                            <colgroup>
                                <col style="width:160px">
                                <col style="width:auto">
                            </colgroup>
							<thead>
								<tr>
									<th>주문번호</th>
									<th>아이디</th>
									<th>상품명</th>
									<th>수량</th>
									<th>결제수단</th>
									<th>배송정보</th>
								</tr>
							</thead>
							
                            <tbody id="dispData">
                                <tr>
                                    <td></td>
                                </tr>                               
                                <tr>   
                                    <td></td>
                                </tr>
                                <tr>   
                    	            <td></td>
                                </tr>
                                <tr>        
                                    <td></td>
                                </tr>
                                <tr>
                                    <td></td>
                                </tr>

                                <tr>
                                    <td></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

                </div>
            </div>
        </div>
    </div>
</body>

</html>