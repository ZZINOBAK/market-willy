<%@page import="com.mystudy.project.DAO.ProductsDAO"%>
<%@page import="com.mystudy.project.VO.ProductsVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        

<%
	String productname = request.getParameter("productname");
	List<ProductsVO> list = ProductsDAO.getListone(productname);
	//System.out.println(list);
%>   

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품</title>
<link rel="stylesheet" type="text/css" href="resource/css/list.css">
<link rel="stylesheet" type="text/css" href="resource/css/commonEx.css">
<link rel="stylesheet" type="text/css" href="resource/css/resetEx.css">
<script>
	function all_search() {
		location.href = "list";
	}
</script>
</head>
<body>

<div id="container" class="container">
<div id="header">
            <div class="user_menu">
                <ul class="sign_menu">
                    <li class="link">
                        <a href="Customer_Qna/logout.jsp" class="item after join">로그아웃</a>
                    </li>
                    <li class="link">
                        <a href="Customer_Qna/myPage.jsp" class="item after join">내정보</a>
                    </li>
                    <li class="link">
                        <p class="item service">문의/주문</p>
                        <!-- 고객센터 hover 시 sub_menu 등장 -->
                        <ul class="sub_menu">
                            <li class="list">
                                <a href="Customer_Qna/frequentQna.jsp" class="list_item">자주하는 질문</a>
                            </li>
                            <li class="list">
                                <a href="Customer_Qna/writeQna.jsp" class="list_item">1:1 문의하기</a>
                            </li>
                            <li class="list">
                                <a href="Customer_Qna/myQnA.jsp" class="list_item">나의 문의내역</a>
                            </li>
                            <li class="list">
                                <a href="admin/selectOrderlist" class="list_item">나의 주문내역</a>
                            </li>
                        </ul>
                    </li> 
                    
                </ul>
                <!-- .sign_menu -->
			</div>
            <div class="header_logo">
                <h1 class="logo">
                    <a href="main_login.jsp" class="link_main">
                        <span class="gnb_logo_container"></span>
                        <img src="resource/image/logo.png" alt="4조 - 윌리마켓" class="logo_img">
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
                            <form action="search_Product" method="POST">
                                <input type="text" id="keyword" title="검색어입력" class="inp_search" placeholder="검색어 입력">
                                <input type="image" src="https://res.kurly.com/pc/service/common/1908/ico_search_x2.png" class="btn_search">
                                <div class="init">
                                    <button type="button" id="search_init" class="btn_delete">검색어 삭제하기</button>
                                </div>
                            </form>
                        </div>
                            
    
                    </ul>
            </div>
        </div>
        </div>
        <!-- header 부분 끝 -->      
		
<div class="css-nu1lw1 e12kjs5e0">
	<div id="container" class="css-1b38o8c eakz2kp1">
	
	<h3 class="css-i804ml eaf14xt0">"<%=productname %>" 검색결과</h3>
	
		<div class="css-pzlq5x e13nsthd1">
			<div class="css-1d3w5wq ef36txc6">
				<div class="css-11kh0cw ef36txc5">
					<c:forEach var="pr" items="${list }">
						<a href="one.jsp?productnum=${pr.productnum}" class="css-9o2zup e1c07x4813">
							<div class="css-0 e1c07x4811">
								<div class="e1c07x4812 css-tou8lf e3um3060">
									<span style="box-sizing: border-box; display: block; overflow: hidden; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 0px; position: absolute; inset: 0px;">
										<img alt="상품 이미지" src="resource/image/${pr.image }" decoding="async" data-nimg="fill" class="css-0" 	style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%; object-fit: 	cover;" sizes="100vw" >
									</span>
								</div>
							</div>
							<div class="button-wrapper">
								<button type="button" class="css-13xu5fn e17x72af0">
									<svg width="18" height="18" viewBox="0 0 18 18" fill="none" xmlns="http://www.w3.org/2000/svg">
										<path d="M1.53516 2.70001H3.93316L5.76816 10.609H13.6482L15.2992 4.35901H4.86916M12.8582 14.933C13.0098 14.9375 13.1609 14.9115 	13.3024 14.8566C13.4438 14.8017 13.5728 14.7189 13.6817 14.6132C13.7906 14.5075 13.8771 	14.381 13.9363 14.2412C13.9954 14.1015 14.0258 13.9513 14.0258 13.7995C14.0258 13.6478 13.9954 13.4975 13.9363 13.3578C13.8771 13.218 13.7906 13.0915 13.6817 12.9858C13.5728 12.8801 13.4438 12.7974 13.3024 12.7424C13.1609 	12.6875 13.0098 12.6615 12.8582 12.666C12.5634 12.6748 12.2836 12.798 12.0782 13.0096C11.8727 13.2213 11.7578 13.5046 11.7578 13.7995C11.7578 14.0944 11.8727 14.3778 12.0782 14.5894C12.2836 14.801 12.5634 14.9243 12.8582 	14.933ZM6.49316 14.933C6.64484 14.9375 6.79589 14.9115 6.93735 14.8566C7.07881 14.8017 7.20781 14.7189 7.31669 14.6132C7.42558 14.5075 7.51214 14.381 7.57126 14.2412C7.63037 14.1015 7.66083 13.9513 7.66083 13.7995C7.66083 	13.6478 7.63037 13.4975 7.57126 13.3578C7.51214 13.218 7.42558 13.0915 7.31669 12.9858C7.20781 12.8801 7.07881 12.7974 6.93735 12.7424C6.79589 12.6875 6.64484 12.6615 6.49316 12.666C6.19836 12.6748 5.91858 12.798 5.71315 	13.0096C5.50773 13.2213 5.39283 13.5046 5.39283 13.7995C5.39283 14.0944 5.50773 14.3778 5.71315 14.5894C5.91858 14.801 6.19836 14.9243 6.49316 14.933Z" stroke="#333333" stroke-linecap="square" stroke-linejoin="round"></path>
									</svg>
							담기</button>
							</div>
							<div class="css-1kpzrna e1c07x489">
								<span class="css-1qd61ut e1ms5t9c1">
									<span class="css-1vdqr5b e1ms5t9c0">샛별배송</span>
								</span>
								<span class="css-1dry2r1 e1c07x488">${pr.productname }</span>
								<p class="css-1wejlc3 e1c07x486">${pr.content }</p>
								<c:choose>
									<c:when test="${pr.saleprice != 0 }">
										<div class="e1c07x487 discount-price css-1tl7659 ei5rudb2">
											<div>
												<span class="dimmed-price css-18tpqqq ei5rudb1">${pr.price}
													<span class="won">원</span>
												</span>
											</div>
											<div class="discount">
												<span class="discount-rate css-19lkxd2 ei5rudb0">7%</span>
												<span class="sales-price css-18tpqqq ei5rudb1">${pr.saleprice}
													<span class="won">원</span>
												</span>
											</div>
										</div>
									</c:when>
									<c:when test="${pr.saleprice eq 0 }">
										<div class="e1c07x487  css-1tl7659 ei5rudb2">
											<div>
												<span class="sales-price css-18tpqqq ei5rudb1">${pr.price }
													<span class="won">원</span>
												</span>
											</div>
										</div>
									</c:when>
								</c:choose>	
								<div class="review-count css-xezqwk e1c07x482">
									<span class="css-mz5g71 e1c07x481">
										<svg width="100%" height="100%" viewBox="0 0 14 14" fill="none" xmlns="http://www.w3.org/2000/svg">
											<mask id="path-1-inside-1_1513_17755" fill="white">
												<path fill-rule="evenodd" clip-rule="evenodd" d="M3 2C1.89543 2 1 2.89543 1 4V8.67201C1 9.77658 1.89543 10.672 3 10.672H5.11212L6.33682 12.7653C6.5299 13.0954 7.00688 13.0954 7.19995 12.7653L8.42465 10.672H10.5C11.6046 10.672 
												12.5 9.77658 12.5 8.67201V4C12.5 2.89543 11.6046 2 10.5 2H3Z"></path>
											</mask>
											<path fill="#999" d="M5.11212 10.672L5.97526 10.167L5.68564 9.67201H5.11212V10.672ZM6.33682 12.7653L5.47369 13.2703L5.47369 13.2703L6.33682 12.7653ZM7.19995 12.7653L6.33682 12.2604L6.33682 12.2604L7.19995 12.7653ZM8.42465 
											10.672V9.67201H7.85113L7.56152 10.167L8.42465 10.672ZM2 4C2 3.44772 2.44772 3 3 3V1C1.34315 1 0 2.34315 0 4H2ZM2 8.67201V4H0V8.67201H2ZM3 9.67201C2.44772 9.67201 2 9.22429 2 8.67201H0C0 10.3289 1.34315 11.672 3 	11.672V9.67201ZM5.11212 9.67201H3V11.672H5.11212V9.67201ZM7.19995 12.2604L5.97526 10.167L4.24899 11.177L5.47369 13.2703L7.19995 12.2604ZM6.33682 12.2604C6.5299 11.9304 7.00688 11.9304 7.19995 12.2604L5.47369 13.2703C6.05291 	14.2604 7.48386 14.2604 8.06309 13.2703L6.33682 12.2604ZM7.56152 10.167L6.33682 12.2604L8.06309 13.2703L9.28779 11.177L7.56152 10.167ZM10.5 9.67201H8.42465V11.672H10.5V9.67201ZM11.5 8.67201C11.5 9.22429 11.0523 9.67201 10.5 	9.67201V11.672C12.1569 11.672 13.5 10.3289 13.5 8.67201H11.5ZM11.5 4V8.67201H13.5V4H11.5ZM10.5 3C11.0523 3 11.5 3.44772 11.5 4H13.5C13.5 2.34315 12.1569 1 10.5 1V3ZM3 3H10.5V1H3V3Z" mask="url(#path-1-inside-1_1513_17755)"></path>
											<circle fill="#999" cx="4.34998" cy="6.17871" r="0.75"></circle>
											<circle fill="#999" cx="6.75" cy="6.17871" r="0.75"></circle>
											<circle fill="#999" cx="9.15002" cy="6.17871" r="0.75"></circle>
										</svg>
									</span>
									<span class="review-number css-l610kl e1c07x480"></span>
								</div>
							</div>
						</a>
					</c:forEach> 
				</div>
			</div>
		</div>
		<div class="css-rdz8z7 e82lnfz1">
			<a class="css-1d20dg7 e82lnfz0">
				<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAkAAAAHCAQAAABwkq/rAAAAHUlEQVR42mNgAIPi/8X/kWkwA8SE0UQIMJAsCKMBBzk27fqtkcYAAAAASUVORK5CYII=" alt="처음 페이지로 이동하기 아이콘">
			</a>
			<a class="css-1d20dg7 e82lnfz0">
				<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAUAAAAHCAQAAABqrk9lAAAAGElEQVR42mNgAIPi/8X/4QwwE5PBQJADAAKSG3cyVhtXAAAAAElFTkSuQmCC" alt="이전 페이지로 이동하기 아이콘">
			</a>
			<a class="css-19yo1fh e82lnfz0">1</a>
			<a class="css-1d20dg7 e82lnfz0">2</a>
			<a class="css-1d20dg7 e82lnfz0">3</a>
			<a class="css-1d20dg7 e82lnfz0">
				<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAUAAAAHCAQAAABqrk9lAAAAGUlEQVR42mMo/l/8nwECQEwCHEwGhAlRBgA2mht3SwgzrwAAAABJRU5ErkJggg==" alt="다음 페이지로 이동하기 아이콘">
			</a>
			<a class="css-1d20dg7 e82lnfz0">
				<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAkAAAAHCAQAAABwkq/rAAAAIElEQVR42mMo/l/8n4GBgQFGQ5kgDowmQZCwAMImhDkAb0k27Zcisn8AAAAASUVORK5CYII=" alt="마지막 페이지로 이동하기 아이콘">
			</a>
		</div>
	</div>
</div>
<div class="css-1qrssc4 e14jm1lg1">
	<a>
		<span class="css-1s8889c e14jm1lg0"></span>
	</a>
</div>
<div class="css-cvd8qc e1tjwjt99">
	<div class="css-18f2sbi e1tjwjt98">
		<div class="css-4bo7sl e1tjwjt97">
			<a href="/shop/event/kurlyEvent.php?htmid=event/delivery_search/delivery_search">
				<span style="box-sizing: border-box; display: inline-block; overflow: hidden; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 0px; position: relative; max-width: 100%;">
					<span style="box-sizing: border-box; display: block; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 0px; max-width: 100%;"><img alt="" aria-hidden="true" src="data:image/svg+xml,%3csvg%20xmlns=%27http://www.w3.org/2000/svg%27%20version=%271.1%27%20width=%2780%27%20height=%27120%27/%3e" style="display: block; max-width: 100%; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 0px;"></span>
					<img alt="샛별, 택배 배송 안내" src="https://res.kurly.com/main/banners/deliveryInfo.png" decoding="async" data-nimg="intrinsic" class="css-0" style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%;" srcset="https://res.kurly.com/main/banners/deliveryInfo.png 1x, https://res.kurly.com/main/banners/deliveryInfo.png 2x">
					<noscript></noscript>
				</span>
			</a>
		</div>
		<!-- <div class="css-7hyi5l e1tjwjt96">
			<a href="/shop/main/html.php?htmid=event/kurly.htm&amp;name=lovers">
				<div class="css-9x337d e1tjwjt95">등급별 혜택</div>
			</a>
			<a href="/shop/board/list.php?id=recipe">
				<div class="css-9x337d e1tjwjt95">레시피</div>
			</a>
		</div> -->
	</div>
</div>
	
	
	










	<!--
	<section class="list">
       
                     
                        	<h3><a href="one.jsp?productnum=${pr.productnum}" class="name">${pr.productname }</h3>

	                    <form action="search" method="post" class="">
							<input type="text" name="productname">
							<input type="submit" value="검색">
						</form>	
						<button onclick="insert_search()">추가</button>	
	                </div>
               
            </section>
        </main>
    </div>
	-->
	
	  <!-- css footer부분 -->
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
                        대표이사 : 000 <br>
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
        <!-- footer끝 -->
</body>
</html>