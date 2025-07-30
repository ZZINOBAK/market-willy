<%@page import="com.mystudy.project.VO.OrderListVO"%>
<%@page import="com.mystudy.project.DAO.OrderListDAO"%>
<%@page import="java.util.List"%>
<%@page import="com.mystudy.project.VO.CustomerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
	
<%
	CustomerVO cusVO = (CustomerVO) session.getAttribute("vo");
	String id = cusVO.getId();
	//System.out.println(id);
	
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 페이지</title>

<!-- <link rel="stylesheet" href="../resource/css/cart.css" type="text/css">
<link rel="stylesheet" href="../resource/css/reset.css" type="text/css"> -->
<link rel="stylesheet" href="../resource/css/common.css" type="text/css">
<link rel="stylesheet" href="../resource/css/resetEx.css" type="text/css">
<link rel="stylesheet" href="../resource/css/commonEx.css" type="text/css">
<link rel="stylesheet" href="../resource/css/order.css" type="text/css">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<script>
$(document).ready(function() {
    $('input[name="addrType"]').change(function() {
        if ($(this).val() === "existing") {
            $('#existingAddress').show();
            $('#newAddress').hide();
        } else if ($(this).val() === "new") {
            $('#existingAddress').hide();
            $('#newAddress').show();
        }
    });

    $('input[name="oAddr"]').change(function() {
        if ($('input[name="addrType"]:checked').val() === "new") {
            // 신규 배송지로 설정
            $('#oAddrField').val($(this).val());
        }
    });
});	
function getAddr(id) {
    $.ajax("../pay/getJsonPayCheckAddr", {
        type: "get",
        data: "id=" + encodeURIComponent(id),
        dataType: "json",
        success: function(data) {
        	let addr = data.list[0].addr;
            let zip = data.list[0].zip;
            let addr2 = data.list[0].addr2;
            
            let fullAddress = '우편번호 : ' + zip + '주소 : ' + addr + " " + addr2 ;

            console.log(addr);
            // 배송지 정보를 텍스트로 설정
            document.getElementById("addr").textContent = addr;
            document.getElementById("zip").textContent = zip;
            document.getElementById("addr2").textContent = addr2;
            document.getElementById("oAddrField").value = fullAddress;   
            
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
<!-- <script>
//값 더하기
var totalPrice = 0;
var totalPriceSpan = 0;

<c:forEach var="vo" items="${list}">
var saleprice = parseInt('${vo.saleprice}');
var price = parseInt('${vo.price}');

//만약 saleprice가 0이 아니면 saleprice를 totalPrice에 더하고, 그렇지 않으면 price를 더합니다.
totalPrice += (saleprice !== 0) ? saleprice : price;
totalPriceSpan += (saleprice !== 0) ? saleprice : price;
</c:forEach>

console.log("총 가격: " + totalPrice + ", " + totalPriceSpan);
</script> -->
<script>
// 초기 가격 변수를 설정합니다.
var totalPrice = 0;
var totalPriceSpan = 0;

<c:forEach var="vo" items="${list}">
    var saleprice = parseInt('${vo.saleprice}');
    var price = parseInt('${vo.price}');
    var cCount = parseInt('${vo.cCount}');

  
    totalPrice += (saleprice !== 0) ? (saleprice * cCount) : (price * cCount);
    totalPriceSpan += (saleprice !== 0) ? (saleprice * cCount) : (price * cCount);
</c:forEach>

console.log("총 가격: " + totalPrice + ", " + totalPriceSpan);
</script> 
<style>

    .radio-label {
        margin-right: 20px; /* 라디오 버튼과 레이블 간의 간격을 조절 */
    }

</style>
</head>
<!-- 임시 id값 test로 설정 -->
<body onload="getAddr('<%= id%>')">
<div id="container" class="container">
<div id="header">
            <div class="user_menu">
                <ul class="sign_menu">
                    <li class="link">
                        <a href="../Customer_Qna/logout.jsp" class="item after join">로그아웃</a>
                    </li>
                    <li class="link">
                        <a href="../Customer_Qna/myPage.jsp" class="item after join">내정보</a>
                    </li>
                    <li class="link">
                        <p class="item service">문의/주문</p>
                        <!-- 고객센터 hover 시 sub_menu 등장 -->
                        <ul class="sub_menu">
                            <li class="list">
                                <a href="../Customer_Qna/frequentQna.jsp" class="list_item">자주하는 질문</a>
                            </li>
                            <li class="list">
                                <a href="../Customer_Qna/writeQna.jsp" class="list_item">1:1 문의하기</a>
                            </li>
                            <li class="list">
                                <a href="../Customer_Qna/myQnA.jsp" class="list_item">나의 문의내역</a>
                            </li>
                            <li class="list">
                                <a href="../admin/selectOrderlist" class="list_item">나의 주문내역</a>
                            </li>
                        </ul>
                    </li> 
                    
                </ul>	
                <!-- .sign_menu -->
            </div>
            <div class="header_logo">
                <h1 class="logo">
                    <a href="../main_login.jsp" class="link_main">
                        <span class="gnb_logo_container"></span>
                        <img src="../resource/image/logo.png" alt="4조 - 윌리마켓" class="logo_img">
                    </a>
                </h1>
            </div>
            <div class="gnb">
            <!-- gnb = global nav bar = 최상위 메뉴  -->
                <h2 class="blind">메뉴</h2>
                    <ul class="gnb_menu">
                        <li class="list gnb_main">
                            <a href="#" class="link">
                                <span class="ico"></span>
                                <!-- ico는 css에서 bg url로 처리 -->
                                <span class="txt">카테고리</span>
                            </a>
                            <div class="gnb_sub">
                                <ul class="menu">
                                     <li class="current">
                                        <!-- hover나 active시 current가 옮겨가도록 설정해야 함 -->
                                        <a href="#" class="main_item">
                                            <span class="ico">
                                                <img src="https://img-cf.kurly.com/shop/data/category/icon_newyear_inactive_pc@2x.1609722514.png" alt="" class="ico off">
                                                <img src="https://img-cf.kurly.com/shop/data/category/icon_newyear_active_pc@2x.1609722514.png" alt="" class="ico on">
                                                <!--카테고리 별 아이콘은 직관적이게 img src로 바로 삽입 
                                                클릭X(off): 기본, 클릭(on): 보라색 아이콘-->
                                            </span>
                                            <span class="tit">
                                                <span class="txt">과일-견과-쌀</span>
                                                <span class="ico_new" alt="new"></span>
                                                <!-- ico_nex: bg url로 처리 -->
                                            </span>
                                            <!-- tit: text + ico -->
                                        </a>
                                        <ol class="subOl">
                                        	<li class="current"> <a href="#" class="main_item"> 과일 </a> </li>
                                        	<li class="current"> <a href="#" class="main_item"> 견과 </a> </li>
                                        	<li class="current"> <a href="#" class="main_item"> 쌀 </a> </li>
                                        </ol>
                                    </li>
                                    <li>
                                        <a href="#" class="main_item">
                                            <span class="ico">
                                                <img src="https://img-cf.kurly.com/shop/data/category/icon_veggies_inactive_pc@2x.1586324570.png" alt="" class="ico off">
                                                <img src="https://img-cf.kurly.com/shop/data/category/icon_veggies_active_pc@2x.1586324570.png" alt="" class="ico on">
                                                <!--카테고리 별 아이콘은 직관적이게 img src로 바로 삽입 
                                                                                        클릭X(off): 기본, 클릭(on): 보라색 아이콘-->
                                            </span>
                                            <span class="tit">
                                                <span class="txt">블라블라블라</span>
                                            </span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li class="list">
                            <a href="#" class="link">
                                <span class="txt">신상품</span>
                            </a>
                        </li>
                        <li class="list">
                            <a href="#" class="link">
                                <span class="txt">베스트</span>
                            </a>
                        </li>
                        <li class="list">
                            <a href="#" class="link">
                                <span class="txt">알뜰쇼핑</span>
                            </a>
                        </li>
                        <li class="list">
                            <a href="#" class="link">
                                <span class="txt">금주혜택</span>
                            </a>
                        </li>
    
                       <!--  <div class="gnb_search">
                            <form action="search_Product">
                                <input type="text" id="keyword" title="검색어입력" class="inp_search" placeholder="검색어 입력">
                                <input type="image" src="https://res.kurly.com/pc/service/common/1908/ico_search_x2.png" class="btn_search">
                                <div class="init">
                                    <button type="button" id="search_init" class="btn_delete">검색어 삭제하기</button>
                                </div>
                            </form>
                        </div> -->
                            
    
                        <div class="cart_count">
                            <!-- bg url 아이콘 추가 -->
                            <a href="../cart/cart.jsp" class="btn_cart">
                                <span class="blind">장바구니</span>
                            </a>
                        </div>    
                    </ul>
            </div>
        </div>
        </div>
        <!-- header 부분 끝 -->


	<form action="../pay/payment.jsp" method="post">
		<div id="wrap">
			<div id="container">
				<div id="main">
					<div id="content">
						<div class="user_form">
							<h1 class="h1_tit">주문서</h1>


							<h2 class="tit_section fst">주문상품</h2>

							<div id="itemList" class="page_aticle order_goodslist">
								<ul class="list_product">
									<c:forEach var="vo" items="${list}">
										<li>
											<div class="thumb">
												<img src="../resource/image/${vo.image}" alt="${vo.productName} 상품 이미지">
											</div>

											<div class="name">
												<div class="inner_name">${vo.productName}</div>
											</div>

											<div class="ea">${vo.cCount}개</div>

											<div class="info_price">
												
											</div>
											
										</li>
										
										<input type="hidden" name="oNum" value="${vo.oNum }">
										<input type="hidden" name="oCount" value="${vo.cCount }">
									</c:forEach>
								</ul>
							</div>
					
								<h2 class="tit_section" id="titFocusOrderer">주문자 정보</h2>

								<div class="order_section data_orderer">
									<table class="goodsinfo_table">
										<tbody>
											<tr class="fst">
												<th>보내는 분</th>
												<td><input type="text" name="receiver"
													placeholder="성함을 입력해주세요"></td>
											</tr>

											<tr>
												<th>연락처</th>
												<td><input type="text" name="oPhone"
													placeholder="연락처를 입력해주세요"></td>
											</tr>

										</tbody>
									</table>
								</div>

								<h2 class="tit_section" id="divAddressWrapper">
									배송정보 <span class="desc">배송 휴무일: 샛별배송(휴무없음), 택배배송(일요일)</span>
								</h2>
									<input type="radio" name="addrType" id="existingAddr" value="existing" checked> 
        							<label for="existingAddr" class="radio-label">기존 배송지</label>
        							<input type="radio" name="addrType" id="newAddr" value="new">
        							<label for "newAddr" class="radio-label">새로운 배송지</label>
								<div class="order_section order_address" id="dataDelivery">

									<h3 href="#" class="section_crux">배송지</h3>
									<div class="section_full">
										<span class="address" id="divDesination">
											<div class="address" id="existingAddress">
												<!-- db에 있는 addr=주소를 불러와 pay-info테이블에 oAddr로 값을 넣어줌 -->
												<input type="hidden" name="oAddr" id="oAddrField">
												<h3 id="zip" style="margin-bottom: 10px;"></h3>
												<h3 id="addr" style="margin-bottom: 10px;"></h3>
												<h3 id="addr2"></h3>
											</div>
											<div class="address" id="newAddress" style="display: none;">
												<input type="text" name="oAddr" id="oAddrField"
													placeholder="새로운 배송지를 입력해주세요">
											</div>

										</span>
									</div>
								</div>



								<div class="tax_absolute">
									<div class="inner_sticky" id="sticky" style="top: 0px;">
										<h2 class="tit_section">결제금액</h2>
										<div id="orderitem_money_info">
											<dl class="amount fst">
												<dt class="tit">주문금액</dt>
												<dd class="price">
													<input type="text" id="priceInput" name="price" value="" hidden="hidden"><span id="won"></span>
												</dd>
											</dl>

											<dl class="amount">
												<dt class="tit">배송비</dt>
												<dd class="price delivery_area">
													<div id="paper_delivery_msg1" style="display: block;">
														<span class="pm_sign" style="display: inline;"></span> <span
															id="paper_delivery" class="">무료배송</span>

													</div>
												</dd>
											</dl>

											<dl class="amount lst">
												<dt class="tit">최종결제금액</dt>
												<dd class="price">
													<!-- 상품가격 받아오면 나올예정 -->
													<input type="text" id="paypriceInput" name="payprice" value="" hidden="hidden">
													<span id="won2"></span>
												</dd>
											</dl>
											<script>
												document.getElementById('won').textContent = totalPriceSpan + '원';
									        	document.getElementById('won2').textContent = totalPriceSpan + '원';
											
												document.getElementById('priceInput').value = totalPrice;
										        document.getElementById('paypriceInput').value = totalPrice;
											</script>

										</div>
									</div>
								</div>


								<div class="data_method">
									<h2 class="tit_section" id="titFocusMethod">결제수단</h2>


									<table class="goodsinfo_table tbl_left">
										<tbody>
											<tr>
												<th>카카오페이 결제</th>
												<td><label class="label_radio" id="cardBenefit_kakaopay"> 
													<input type="radio" name="oPayment" value="카카오페이"> <span id="kakaopay">카카오페이</span>
														<div class="info_benefit"></div>
												</label></td>
											</tr>
										</tbody>
									</table>
								</div>
								<div class="tit_section"><br>
									<input type="submit" value="결제하기" class="btn_payment"> 
								</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
</body>
</body>
</html>