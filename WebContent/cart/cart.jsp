<%@page import="com.mystudy.project.VO.CustomerVO"%>
<%@page import="java.util.List"%>
<%@page import="com.mystudy.project.VO.CartVO"%>
<%@page import="com.mystudy.project.DAO.CartDAO"%>
<%@page import="com.mystudy.project.VO.ProductsVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        

<%
	CustomerVO cusVO = (CustomerVO) session.getAttribute("vo");
	//System.out.println("id : " + cusVO.getId());

	List<CartVO> list = CartDAO.getListById(cusVO.getId());
	//System.out.println("list : " + list);
	session.setAttribute("list", list);	

	//ProductsVO vo = (ProductsVO) session.getAttribute("ProductsVO");
	//System.out.println("vo : " + vo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	function go_main() {
		window.location.href = "../main_login.jsp";
	}

	function go_login() {
		location.href = "../Customer_Qna/login.jsp";
	}
	
	function go_before() {
	    window.history.back(); // 이전 페이지로 이동
	}
	
	function go_purchase(newAction) {
		// 폼의 action 속성을 변경하는 함수
	    var form = document.getElementById("cartForm");
/* 	    var checkboxes = document.querySelectorAll('input[type="checkbox"].del-chk');
 */	    var checkboxes = document.querySelectorAll('.del-chk');

	    var checkedItems = [];
	    console.log(checkboxes.length);

	    
		var confirmMessage = "주문하시겠습니까?";
			    
	    if (confirm(confirmMessage)) {
            // 사용자가 확인을 눌렀을 때 폼을 제출
           
		    // 체크된 체크박스를 확인
		    /* if (checkedItems.length !== 0) { */
			    for (var i = 0; i < checkboxes.length; i++) {
			        if (checkboxes[i].checked) {
			            checkedItems.push(checkboxes[i].value);
			        }
			    }
		    /* } */

		    // 체크된 아이템이 없을 경우, 전체 아이템을 선택
		    if (checkedItems.length === 0) {
		        for (var i = 0; i < checkboxes.length; i++) {
		            checkedItems.push(checkboxes[i].value);
		            checkboxes[i].checked = true;	    

		        }
	            console.log(checkedItems);

		    }

		    // 선택된 아이템들을 폼 데이터에 추가
/* 		    for (var i = 0; i < checkedItems.length; i++) {
	            console.log(checkedItems[i]);

		        var input = document.createElement("input");
		        input.type = "hidden";
		        input.name = "selectedItems";
		        input.value = checkedItems[i];
		        form.appendChild(input);
		    } */
		    // 배열 두번씩 되던거 이유가 저 selectedItems 라는이름의데이터가 바디에도 있고 해서아무튼 그러한 이유로 두번실행되서 넘어갔더거임
		    // 바디 안에 name=selectedItems를 지움. 이게 차분히 봐야 보이지 시간에 쫓기면 안보임 ㅋ
/*             console.log(input);
 */
		    form.action = newAction;
		    
		    form.submit();
	    } else {
            // 사용자가 취소를 눌렀을 때 아무 작업도 하지 않음
        }
	}
	
	function go_update(newAction) {
     // 사용자가 입력한 수정된 값을 가져옵니다.
        var updatedValue = document.getElementById("cCountInput").value;

        // 폼 데이터를 업데이트합니다.
        document.getElementById("cCountInput").value = updatedValue;
        
        var form = document.getElementById("cartForm");

        var aInput = document.createElement("input");
        aInput.type = "hidden"; // 숨겨진 입력 필드로 만듭니다.
        aInput.name = "type"; // 이름 설정
        aInput.value = "update"; // 값을 설정
	
	    form.appendChild(aInput);
	      
	    form.action = newAction;
	      
	    form.submit();
	}
	
	function go_delete(newAction) {
        // 폼을 가져옴
        var form = document.getElementById("cartForm");
                
        // 추가 데이터를 생성
        var aInput = document.createElement("input");
        aInput.type = "hidden"; // 숨겨진 입력 필드로 만듭니다.
        aInput.name = "type"; // 이름 설정
        aInput.value = "delete"; // 값을 설정

        // 폼에 추가 데이터를 추가
        form.appendChild(aInput);
        
        form.action = newAction;

        // 폼을 서버로 제출
        form.submit();
	}
	
	$(document).on('click','#selectAll',function(){
	    if($('#selectAll').is(':checked')){
	       $('.del-chk').prop('checked',true);
	    }else{
	       $('.del-chk').prop('checked',false);
	    }
	});
	
	$(document).on('click','.del-chk',function(){
	    if($('input[class=del-chk]:checked').length==$('.del-chk').length){
	        $('#selectAll').prop('checked',true);
	    }else{
	       $('#selectAll').prop('checked',false);
	    }
	});
	
	// cart.jsp 페이지가 로드될 때 서버로부터 전달된 알림 메시지를 확인하고 알림창을 띄웁니다.
    var alertMessage = "${alertMessage}"; // 서버에서 전달된 알림 메시지

    if (alertMessage) {
        alert(alertMessage);
    }
    
    
</script>

<script src="https://kit.fontawesome.com/20962f3e4b.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link rel="stylesheet" href="../resource/css/product.css">
<link rel="stylesheet" href="../resource/css/commonEx.css" />
<link rel="stylesheet" href="../resource/css/resetEx.css" />

<style>
	.common-button {
	    background-color: rgb(95, 0, 128); /* 배경색을 원하는 색상으로 변경 */
	    color: #fff; /* 텍스트 색상을 흰색으로 변경 */
	    border: none; /* 테두리 제거 */
	    padding: 5px 8px; /* 내부 여백 설정 */
	    cursor: pointer; /* 커서 스타일 변경 (예: 손가락 커서) */
	}
	
    .cart-total-price {
	    clear: both;
	    border: 4px solid #c8c8c8;
	    text-align: center;
	}
	
	.cart-total-price__inner {
	    display: inline-block;
	    margin: 0 auto;
	    vertical-align: top;
	}
	.cart-total-price .price-area {
	    padding: 20px 15px 18px;
	    font-size: 14px;
	    line-height: 17px;
	    color: #555;
	    text-align: center;
	}
	
	.cart-total-price em {
	    padding: 0 4px 0 5px;
	    font: 700 17px/17px tahoma;
	    color: #111;
	}
	.cart-total-price .final-sale-area {
	    font-size: 14px;
	}
	
	.cart-total-price .final-order-price {
	    color: #ea0000;
	    font-size: 20px;
	}
	
	.sr-only {
	    position: absolute;
	    height: 1px;
	    width: 1px;
	    overflow: hidden;
	    clip: rect(1px 1px 1px 1px);
	    clip: rect(1px,1px,1px,1px);
	}
	
	.symbol-plus1 {
	    margin: 0 11px 0 10px;
	    vertical-align: -4px;
	    background: url(//img1a.coupangcdn.com/image/www/newBuy/img_plus_2.gif) no-repeat;
	}
	.symbol-equal1 {
	    background: url(//img1a.coupangcdn.com/image/www/newBuy/img_equals_2.gif) no-repeat;
	}
	
	.order-buttons, .summary-area {
	    margin-top: 30px;
	    text-align: center;
	    position: relative;
	}
	
	.order-buttons .item-disabled, .summary-area .item-disabled {
	    position: absolute;
	    display: none;
	    height: 100%;
	    width: 220px;
	    top: 0;
	    left: 50%;
	    opacity: .3;
	    background: #fff;
	    margin-left: 5px;
	}
	
	.goPayment, .goShopping {
	    font-size: 22px;
	    font-weight: 700;
	    display: inline-block;
	    position: relative;
	    width: 216px;
	    line-height: 18px;
	    border: 2px solid rgb(95, 0, 128);
	    border-radius: 4px;
	    padding: 22px 0 19px;
	    text-align: center;
	}
	.goShopping {
	    background: #fff;
	    color: rgb(95, 0, 128);
	    margin-right: 5px;
	}
	.goPayment {
	    background: rgb(95, 0, 128);
	    color: #fff;
	}
	
</style>

</head>
<body>
<div id="container" class="container">
<div id="header">
            <div class="user_menu">
                <ul class="sign_menu">
                    <li class="link">
                        <a href="../Customer_Qna/logout.jsp" class="item after join">로그아웃</a>
                    </li>
                    <li class="link">
                        <a href="../Customer_Qna/myPage.jsp" class="item after">내정보</a>
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
    
                        <div class="gnb_search">
                            <form action="">
                                <input type="text" id="keyword" title="검색어입력" class="inp_search" placeholder="검색어 입력">
                                <input type="image" src="https://res.kurly.com/pc/service/common/1908/ico_search_x2.png" class="btn_search">
                                <div class="init">
                                    <button type="button" id="search_init" class="btn_delete">검색어 삭제하기</button>
                                </div>
                            </form>
                        </div>
                            
    
                        <div class="cart_count">
                            <!-- bg url 아이콘 추가 -->
                            <a href="cart.jsp" class="btn_cart">
                                <span class="blind">장바구니</span>
                            </a>
                        </div>    
                    </ul>
            </div>
        </div>
        </div>
        <!-- header 부분 끝 -->
   
   <main id="product">
     <section class="cart">
    	<nav>
            <h1>장바구니</h1>
            <p>
                HOME > 
                <strong>장바구니</strong>
            </p>
        </nav>    
        <form action="cart" method="get" id="cartForm" >
    		<table border="0">
		        <thead>
		            <tr>
		            	<th><input type="checkbox" name="all" id="selectAll"></th>
		            	<th>상품번호</th>
		                <th>상품명</th>
		                <th>수량</th>
		                <th>가격</th>
		                <th>할인가</th>
		            </tr>
		        </thead>
		        <tbody>
		        	<tr class="empty">
                          	<td colspan="7">장바구니에 상품이 없습니다.</td>
                          	<!-- { display: none ;} -->
                      	</tr>
		            <c:forEach var="vo" items="${list}">
		            <c:set var="totalPrice" value="${vo.cCount * vo.price}" />
		            <c:set var="totalSalePrice" value="${vo.cCount * vo.saleprice}" />
		                <tr>
		                    <td>
		                        <input type="checkbox" name="selectedItems" class="del-chk"  value="${vo.productNum}">
		                        <!-- <input type="checkbox" name="1"> -->
		                        <input type="hidden" name="productNum" value="${vo.productNum}"> 
		                    </td>
		                    <td>${vo.productNum}
		                    <input type="hidden" name="productName" value="${vo.productName}">
		                    </td>
		                    <td><article>
		                    	<a href="../product/one_Product.jsp?productnum=${vo.productNum }">
                                  		<img src="../resource/image/${vo.image }" alt="1">
                              		</a>
                              		<div>
                                 			<h2><a href="../product/one_Product.jsp?productnum=${vo.productNum }">${vo.productName}</a></h2>
                                  		<p>${vo.content }</p>
                              		</div>
                          		</article></td>
		                    <td>
		                        <input type="number" name="cCount" id="cCountInput" value="${vo.cCount}" style="width: 50px;">
		                        <input type="hidden" name="cNum" value="${vo.cNum}"><br><br>
		                        <button type="button" onclick="go_update('updateCart')" class="common-button">수량 변경</button>
		                    </td>
		                    <td>${totalPrice}
		                    <input type="hidden" name="price" value="${totalPrice}">
		                    </td>
		                    <td>${totalSalePrice}
		                    <input type="hidden" name="saleprice" value="${totalSaleprice}">
		                    </td>
		                </tr>
				    </c:forEach>
		        </tbody>
		    </table>
		    <br>
		    <button type="button" onclick="go_delete('deleteCart')" name="del" value="선택삭제"  class="common-button">선택삭제</button>
		    <br><br>
		    <div class="cart-total-price" data-total-price="15900" data-discount-price="0">
                <div class="cart-total-price__inner">
                    <div class="price-area">
                        <h2 class="sr-only" id="cart-total-price">
                            장바구니 총 주문금액 정보
                        </h2>

                        총 상품가격
                        <em class="final-product-price">
	                        <c:set var="totalPrice" value="0" /> <!-- totalPrice 초기화 -->
							<c:forEach var="vo" items="${list}">
							    <c:set var="totalPrice" value="${totalPrice + (vo.price * vo.cCount)}" /> <!-- totalPrice 누적 -->
							</c:forEach>
	                        ${totalPrice}
                        </em>원
                        <span class="final-sale-area">
                        </span>

                        <span class="symbol-plus1"><span class="sr-only">더하기</span></span>
                        
                        총 할인금액
                        <em class="final-delivery-charge">
                        	<c:set var="totalSalePrice" value="0" /> <!-- totalPrice 초기화 -->
							<c:forEach var="vo" items="${list}">
							    <%-- <c:set var="totalSalePrice" value="${totalSalePrice + (vo.saleprice * vo.cCount)}" /> --%> <!-- totalPrice 누적 -->
							    <c:set var="totalSalePrice" value="${(vo.price - vo.saleprice) * vo.cCount}" /> <!-- totalPrice 누적 -->
							</c:forEach>
							${totalSalePrice}
						</em>원
						
                        <span class="symbol-equal1"><span class="sr-only">결과는</span></span>
                        
                        총 주문금액
                        <em class="final-order-price">
                        	<c:set var="totalOrderPrice" value="0" /> <!-- totalPrice 초기화 -->
							<c:forEach var="vo" items="${list}">
							    <%-- <c:set var="totalOrderPrice" value="${totalOrderPrice + ((vo.price  * vo.cCount) - (vo.saleprice * vo.cCount))}" /> --%> <!-- totalPrice 누적 -->
							    <c:set var="totalOrderPrice" value="${totalPrice - totalSalePrice}" /> <!-- totalPrice 누적 -->
							</c:forEach>
							${totalOrderPrice}
                        </em>
                    </div>
                </div>
            </div>
            <div class="order-buttons">
                <button type="button" onclick="go_before()" class="goShopping logging">계속 쇼핑하기</button>
                <button type="button" onclick="go_purchase('purchase')" name="order" value="주문하기" class="goPayment">구매하기</button>
                <div class="item-disabled" style="display: none;"></div>
            </div>
		</form>
  	</section>	
</main>	
				
        <!-- footer 시작 -->
        <div id="footer">
            <div class="inner_footer">
                <div class="cc_footer">
                <!-- cc = company calls --> 
                    <div class="cc_view cc_call">
                        <h3>
                            <span class="tit">1234-5678</span>
                        </h3>
                        <dl class="list">
                            <dt>고객센터</dt>
                            <dd>휴무</dd>
                        </dl>
                    </div>
                    <div class="cc_view cc_kakao">
                        <h3>
                            <a href="#" class="tit">근무시간</a>
                        </h3>
                        <dl class="list">
                            <dt>평일</dt>
                            <dd>오전 9시 30분 - 오후 6시 20분</dd>
                        </dl>
                    </div>
                </div>

                <div class="company_info">
                    <div class="spec_info">
                        법인명 (상호) : 윌리
                        <span class="bar">I</span>
                        사업자등록번호 : 000-00-0000 
                        <a href="#" class="link">사업자정보확인</a><br>
                        판매업 : 제 2018-서울강남-00000 호
                        <span class="bar">I</span>
                        개인정보보호책임자 : 000 <br>
                        주소 : 삼원타워 4층
                        <span class="bar">I</span>
                        대표이사 : 김하은천재만재 <br>
                        제휴문의 : <a href="#" class="link">@naver.com</a><br>
                        채용문의 : <a href="#" class="link">@naver.com</a><br>
                        이메일 : <a href="#" class="link">@naver.com</a><br>
                        <br>
                        <strong class="copy">© Willy CORP. ALL RIGHTS RESERVED</strong>
                        <ul class="sns">
                            <li>
                                <a href="#" class="link_sns insta" target="_blank">
                                    <img src="https://res.kurly.com/pc/ico/1810/ico_instagram.png" alt="인스타그램">
                                </a>
                                <!-- bg url 넣기 -->
                            </li>
                            <li>
                                <a href="#" class="link_sns fb" target="_blank">
                                    <img src="https://res.kurly.com/pc/ico/1810/ico_fb.png" alt="페이스북">
                                </a>
                            </li>
                            <li>
                                <a href="#" class="link_sns naver_blog" target="_blank">
                                    <img src="https://res.kurly.com/pc/ico/1810/ico_blog.png" alt="네이버블로그">
                                </a>
                            </li>
                            <li>
                                <a href="#" class="link_sns naver_post" target="_blank">
                                    <img src="https://res.kurly.com/pc/ico/1810/ico_naverpost.png" alt="포스트">
                                </a>
                            </li>
                            <li>
                                <a href="#" class="link_sns yt" target="_blank">
                                    <img src="https://res.kurly.com/pc/ico/1810/ico_youtube.png" alt="유튜브">
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="link_footer">
                <div class="authentication">
                    <a href="#" class="mark" target="_blank">
                        <img src="https://res.kurly.com/pc/ico/2001/logo_isms.png" alt="isms 로고" class="logo">
                        <p class="txt">
                            [인증범위] 쇼핑몰 서비스 개발 · 운영<br>
                            [유효기간] 2023.10.18 ~ 2023.10.31
                        </p>
                    </a>
                    <a href="#" class="mark" target="_blank">
                        <img src="https://res.kurly.com/pc/ico/2001/logo_eprivacyplus.png" alt="eprivacy plus 로고" class="logo">
                        <p class="txt">
                            개인정보보호 웹사이트 ·<br>
                            개인정보처리시스템 인증 (ePRIVACY PLUS)
                        </p>
                    </a>
                </div>
            </div>
        </div>
        <!-- footer 끝 -->
</body>
</html>