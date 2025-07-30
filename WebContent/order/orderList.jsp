<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	function go_review(productNum, productName, oNum) {
	    var form = document.getElementById('cartForm');
	    
	    form.action = '../review/review.jsp'; // 또는 원하는 URL로 변경
	
	    // 필요한 데이터를 hidden input으로 추가
	    var productNumInput = document.createElement('input');
	    productNumInput.type = 'hidden';
	    productNumInput.name = 'productNum';
	    productNumInput.value = productNum;
	    form.appendChild(productNumInput);
	
	    var productNameInput = document.createElement('input');
	    productNameInput.type = 'hidden';
	    productNameInput.name = 'productName';
	    productNameInput.value = productName;
	    form.appendChild(productNameInput);
	
	    var oNumInput = document.createElement('input');
	    oNumInput.type = 'hidden';
	    oNumInput.name = 'oNum';
	    oNumInput.value = oNum;
	    form.appendChild(oNumInput);
	
	    // Form을 서버로 전송
	    form.submit();
	}
	
	/* function go_reviewdelete(oNum) {
	       var form = document.getElementById('cartForm');
	       
	       form.action = '../review/review_delete.jsp'; // 또는 원하는 URL로 변경
	   
	       var oNumInput = document.createElement('input');
	       oNumInput.type = 'hidden';
	       oNumInput.name = 'oNum';
	       oNumInput.value = oNum;
	       form.appendChild(oNumInput);
	   
	       // Form을 서버로 전송
	       form.submit();
	   } */

	function go_main() {
		window.location.href = "../main_login.jsp";
	}
	
	/* function go_review(productNum) {
	    location.href = "../product/one_Product.jsp?productnum=" + productNum;
	} */
	
	function go_bestSeller() {
	    location.href = "../main_login.jsp";
	}
	
	function go_orderDetail(payNum, oDate) {
	    // 이벤트 핸들러에서 form의 action 값을 변경
	    var form = document.getElementById('cartForm');
	    form.action = '../order/orderDetail'; // 또는 원하는 URL로 변경

	    // 필요한 경우, oNum을 form에 추가 데이터로 전송
	    var oNumInput = document.createElement('input');
	    oNumInput.type = 'hidden';
	    oNumInput.name = 'payNum';
	    oNumInput.value = payNum;
	    form.appendChild(oNumInput);

	    // 필요한 경우, oDate를 form에 추가 데이터로 전송
	    var oDateInput = document.createElement('input');
	    oDateInput.type = 'hidden';
	    oDateInput.name = 'oDate';
	    oDateInput.value = oDate;
	    form.appendChild(oDateInput);

	    // form을 submit하여 새로운 페이지로 이동
	    form.submit();
	}
	
	// 알러트창
	var alertMessage = "${alertMessage}"; // 서버에서 전달된 알림 메시지
	var hasDisplayedAlert = sessionStorage.getItem("hasDisplayedAlert");

	if (alertMessage && !hasDisplayedAlert) {
	    alert(alertMessage);
	    sessionStorage.setItem("hasDisplayedAlert", "true");
	}
	
	$(document).ready(function() {
        $(".txt").click(function() {
            // 현재 클릭한 요소의 하위 "subOl" 클래스 요소를 슬라이드 토글합니다.
            $(this).closest("li").find(".subOl").slideToggle();
        });
    });
</script>

<script src="https://kit.fontawesome.com/20962f3e4b.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link rel="stylesheet" href="../resource/css/product.css">
<link rel="stylesheet" href="../resource/css/commonEx.css" />
<link rel="stylesheet" href="../resource/css/resetEx.css" />
<link rel="stylesheet" href="../resource/css/order-list.css" />

<style>
button.right-align-button {
    float: right;
}

.css-haeun {
    -webkit-text-size-adjust: 100%;
    --swiper-theme-color: #007aff;
    user-select: none;
    font: inherit;
    -webkit-tap-highlight-color: transparent;
    text-transform: none;
    cursor: pointer;
    font-family: "Noto Sans", "malgun gothic", AppleGothic, dotum, sans-serif;
    text-align: center;
    color: rgb(255, 255, 255);
    padding: 0;
    box-sizing: border-box;
    margin: 0;
    display: inline-block;
    font-weight: 500;
    font-size: 14px;
}

.subOl{display:none;}
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
   
   <main id="product">
	 <section class="cart">
		<nav>
           <h1>주문내역</h1>
       </nav>
				<div class="css-1dmsa3j e1jm6dy15"></div>
				<div class="css-1c8nox e1ykq6gv1"><!-- 여기까지는 css 맞는데 -->
				<form action="deleteOrderlist" method="get" id="cartForm" >
					<!-- css 안됨...ㅋ -->
					<c:choose>
						<c:when test="${empty list}">
							<div data-testid="warning-orders" class="css-79rsko e1ykq6gv0">
								<div class="css-zigog8 e1bmghrs3">
									<p class="css-1w78rrf e1bmghrs1">
									주문내역이 없습니다.
									</p>
									<button onclick="go_bestSeller()" class="e1bmghrs0 css-1roqgte e4nu7ef3" type="button" width="150" height="44" radius="3">
										<span class="css-haeun e4nu7ef1">
										상품 보기
										</span>
									</button>
								</div>
							</div>
					    </c:when>
					    
					    <c:otherwise>
    				    <c:set var="previousDate" value="" />
						<c:forEach var="vo" items="${list}">
						       				    <%--  ${previousDate }
						       				     ${!(vo.oDate == previousDate)} --%>
						<div class="css-4wlxei e1437c6414"><!-- 여기부터 이상할수도...-->
       				     <c:if test="${!(vo.oDate == previousDate)}">
							    <div class="css-1hbtwy0 e1437c6413">
						            <span class="css-asma03 e1437c6412">${vo.oDate}</span>
						           	<button onclick="go_orderDetail('${vo.payNum}', '${vo.oDate}')" class="right-align-button">주문 상세보기</button>
						        </div>
             			   <c:set var="previousDate" value="${vo.oDate}" />
						    </c:if>
							<div class="css-7apail e1437c6410">
								<div class="css-fhxb3m e1437c649">
								<a href="../product/one_Product.jsp?productnum=${vo.productNum }">
									<img src="../resource/image/${vo.image}" alt="${vo.productName}" onerror="this.src='./img/eng.png'" class="css-1oc1pau e1437c648">									
							</a>
										
										<div class="css-1fttcpj e1437c647">
										    <dl class="css-1ccl3pq e1437c646">
										        <dt class="css-dzjp62 e1437c645">
										            상품명
										        </dt>
										        <dd class="css-1o8e829 e1437c643">${vo.productName}</dd>
										    </dl>
										    <dl class="css-1ccl3pq e1437c646">
										        <dt class="css-dzjp62 e1437c645">
										            주문번호
										        </dt>
										        <dd class="css-1i58pf4 e1437c644">${vo.oNum}</dd>
										    </dl>
										    <dl class="css-1ccl3pq e1437c646">
										        <dt class="css-dzjp62 e1437c645">
										            주문수량
										        </dt>
										        <dd class="css-1i58pf4 e1437c644">${vo.cCount}</dd>
										    </dl>
										    <dl class="css-1ccl3pq e1437c646">
										        <dt class="css-dzjp62 e1437c645">
										            결제금액
										        </dt>
										        <dd class="css-1i58pf4 e1437c644">${vo.saleprice}원</dd>
										    </dl>
										</div>
									</div>
									<div class="css-s5xdrg e1437c642">
										<span class="css-1fdt947 e1437c641">${vo.payment }</span>
										<div class="css-1bbz142 e1437c640">
											<button onclick="go_review('${vo.productNum}', '${vo.productName}', '${vo.oNum }')" class="css-oyz24n e4nu7ef3" type="button" height="36" radius="3">
											    <span class="css-nytqmg1 e4nu7ef1">리뷰작성</span>
											</button>
											<%-- <button onclick="go_reviewdelete('${vo.oNum }')" class="css-oyz24n e4nu7ef3" type="button" height="36" radius="3">
                                     		<span class="css-nytqmg1 e4nu7ef1">리뷰삭제</span>
                                     		</button> --%>
										</div>
									</div>
								</div>
							<c:choose>
						        <c:when test="${vo.payment eq 'test'}">
						            <button onclick="go_delete('${vo.oNum}')">주문취소</button>
						        </c:when>
						        <c:otherwise>
						            <!-- 결제가 완료되지 않은 경우 버튼을 표시하지 않음 -->
						        </c:otherwise>
						    </c:choose>
						</div>
						
						<!-- 산 상품 정보 + 결제정보 + 배송정보 -->
						</c:forEach>
							</c:otherwise>
						</c:choose>
						</form>
					<div class="css-bx0kqw e1mkosgq0"></div>
				</div>
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
		
		<button type="button" id="top">상단이동</button>
</body>
</html>