<%@page import="com.mystudy.project.paging.Paging"%>
<%@page import="com.mystudy.project.VO.ReviewVO"%>
<%@page import="com.mystudy.project.VO.ProductsVO"%>
<%@page import="java.util.List"%>
<%@page import="com.mystudy.project.DAO.ProductsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체보기</title>
<%
	//0. 페이징 처리를 위한 객체(Paging) 생성
	Paging p = new Paging();

	//1. 전체 게시물 수량 구하기
	p.setTotalRecord(ProductsDAO.getTotalCount());
	p.setTotalPage();
	System.out.println("> 전체 게시글 수 : " + p.getTotalRecord());
	System.out.println("> 전체 페이지 수 : " + p.getTotalPage());
	
	//2. 현재 페이지 구하기
	String cPage = request.getParameter("cPage");
	if (cPage != null) {
		p.setNowPage(Integer.parseInt(cPage));
	}
	System.out.println("> cPage : " + cPage);
	System.out.println("> paging nowPage : " + p.getNowPage());
	
	//3. 현재 페이지에 표시할 게시글 시작번호(begin), 끝번호 구하지
	p.setEnd(p.getNowPage() * p.getNumPerPage());
	p.setBegin(p.getEnd() - p.getNumPerPage() + 1);
	
	//3-1. (선택적) 끝 번호가 데이터 건수보다 많아지면 데이터 건수와 동일하게 설정
	if (p.getEnd() > p.getTotalRecord()) {
		p.setEnd(p.getTotalRecord());
	}
	
	System.out.println(">> 시작번호(begin) : " + p.getBegin());
	System.out.println(">> 끝번호(end) : " + p.getEnd());
	
	//------ 블록(block) 게산하기 -----------------
	//4. 블록 시작페이지, 끝페이지 구하기
	//4-1. 시작페이지 구하기
	int beginPage = (p.getNowPage() - 1) / p.getPagePerBlock() * p.getPagePerBlock() + 1;
	p.setBeginPage(beginPage);
	p.setEndPage(beginPage + p.getPagePerBlock() -1);
	
	//4-2. 끝페이지(endPage)가 전체 페이지 수(totalPage) 보다 크면
	// 끝페이지를 전체 페이지 수로 변경처리(설정)
	if (p.getEndPage() > p.getTotalPage()) {
		p.setEndPage(p.getTotalPage());
	}
	
	System.out.println(">> 시작페이지(beginPage) : " + p.getBeginPage());
	System.out.println(">> 끝페이지(endPage) : " + p.getEndPage());
	
	System.out.println("p : " + p);
%>
<%
	//================================
	//현재 페이지 기준으로 DB데이터(게시글) 가져오기
	//시작번호(begin), 끝번호(end) 사용해서
	List<ProductsVO> list = ProductsDAO.getList(p.getBegin(), p.getEnd());
	System.out.println(">> 현재 페이지 글목록(list) : " + list);
	
	//--------------------------
	//JSTL, EL 사용을 위해 scope에 데이터 등록(page 영역)
	pageContext.setAttribute("list", list);
	pageContext.setAttribute("pvo", p);
	
	//현재 페이지번호 사용 블록번호 구하고, 블록번호로 시작/끝 페이지 구하기
	System.out.println("p : " + p);	
	
    
%>
<link rel="stylesheet" type="text/css" href="CSS/list.css">
<link rel="stylesheet" type="text/css" href="CSS/commonEx.css">
<link rel="stylesheet" type="text/css" href="CSS/resetEx.css">
<script>
	function insert_search() {
		location.href = "insert_Product.jsp";
	}
	function search() {
		location.href = "search_Product";
	}
	document.getElementById('fruitLink').addEventListener('click', function() {
	    // "과일" 값을 URL 파라미터로 전달
	    window.location.href = "categorysearch_Product.jsp?categorySub=과일";
	});
</script>	
</head>


<body>
	 
<div id="__next" data-reactroot>
<div id="header">
            <div class="user_menu">
                <ul class="sign_menu">
                    <li class="link">
                        <a href="register.jsp" class="item after join">회원가입</a>
                    </li>
                    <li class="link">
                        <a href="login.jsp" class="item after">로그인</a>
                    </li>
                    <li class="link">
                        <a href="#" class="item service">고객센터</a>
                        <!-- 고객센터 hover 시 sub_menu 등장 -->
                        <ul class="sub_menu">
                            <li class="list">
                                <a href="QnA.jsp" class="list_item">문의사항</a>
                            </li>
                            <!-- <li class="list">
                                <a href="#" class="list_item">자주하는 질문</a>
                            </li>
                            <li class="list">
                                <a href="#" class="list_item">1:1 문의</a>
                            </li> -->
                        </ul>
                    </li> 
                </ul>
                <!-- .sign_menu -->
            </div>
            <div class="header_logo">
                <h1 class="logo">
                    <a href="list_Product" class="link_main">
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
                                <span class="txt">전체 카테고리</span>
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
                                                <span class="txt">과일.견과.쌀</span>
                                                <span class="ico_new" alt="new"></span>
                                                <!-- ico_nex: bg url로 처리 -->
                                            </span>
                                            <!-- tit: text + ico -->
                                        </a>
                                        <ol class="subOl">
                                        	<li class="current"> <a href="#" class="main_item"> 과일 </a> </li>
                                        	<li class="current"> <a href="#" class="main_item"> 서브 2 </a> </li>
                                        	<li class="current"> <a href="#" class="main_item"> 서브 3 </a> </li>
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
                                    <li>
                                        <a href="#" class="main_item">
                                            <span class="ico">
                                                <img src="https://img-cf.kurly.com/shop/data/category/icon_veggies_inactive_pc@2x.1586324570.png" alt=""
                                                    class="ico off">
                                                <img src="https://img-cf.kurly.com/shop/data/category/icon_veggies_active_pc@2x.1586324570.png" alt=""
                                                    class="ico on">
                                                <!--카테고리 별 아이콘은 직관적이게 img src로 바로 삽입 
                                                                                                                            클릭X(off): 기본, 클릭(on): 보라색 아이콘-->
                                            </span>
                                            <span class="tit">
                                                <span class="txt">블라블라블라</span>
                                            </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#" class="main_item">
                                            <span class="ico">
                                                <img src="https://img-cf.kurly.com/shop/data/category/icon_veggies_inactive_pc@2x.1586324570.png" alt=""
                                                    class="ico off">
                                                <img src="https://img-cf.kurly.com/shop/data/category/icon_veggies_active_pc@2x.1586324570.png" alt=""
                                                    class="ico on">
                                                <!--카테고리 별 아이콘은 직관적이게 img src로 바로 삽입 
                                                                                                                            클릭X(off): 기본, 클릭(on): 보라색 아이콘-->
                                            </span>
                                            <span class="tit">
                                                <span class="txt">블라블라블라</span>
                                            </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#" class="main_item">
                                            <span class="ico">
                                                <img src="https://img-cf.kurly.com/shop/data/category/icon_veggies_inactive_pc@2x.1586324570.png" alt=""
                                                    class="ico off">
                                                <img src="https://img-cf.kurly.com/shop/data/category/icon_veggies_active_pc@2x.1586324570.png" alt=""
                                                    class="ico on">
                                                <!--카테고리 별 아이콘은 직관적이게 img src로 바로 삽입 
                                                                                                                            클릭X(off): 기본, 클릭(on): 보라색 아이콘-->
                                            </span>
                                            <span class="tit">
                                                <span class="txt">블라블라블라</span>
                                            </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#" class="main_item">
                                            <span class="ico">
                                                <img src="https://img-cf.kurly.com/shop/data/category/icon_veggies_inactive_pc@2x.1586324570.png" alt=""
                                                    class="ico off">
                                                <img src="https://img-cf.kurly.com/shop/data/category/icon_veggies_active_pc@2x.1586324570.png" alt=""
                                                    class="ico on">
                                                <!--카테고리 별 아이콘은 직관적이게 img src로 바로 삽입 
                                                                                                                            클릭X(off): 기본, 클릭(on): 보라색 아이콘-->
                                            </span>
                                            <span class="tit">
                                                <span class="txt">블라블라블라</span>
                                            </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#" class="main_item">
                                            <span class="ico">
                                                <img src="https://img-cf.kurly.com/shop/data/category/icon_veggies_inactive_pc@2x.1586324570.png" alt=""
                                                    class="ico off">
                                                <img src="https://img-cf.kurly.com/shop/data/category/icon_veggies_active_pc@2x.1586324570.png" alt=""
                                                    class="ico on">
                                                <!--카테고리 별 아이콘은 직관적이게 img src로 바로 삽입 
                                                                                                                            클릭X(off): 기본, 클릭(on): 보라색 아이콘-->
                                            </span>
                                            <span class="tit">
                                                <span class="txt">블라블라블라</span>
                                            </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#" class="main_item">
                                            <span class="ico">
                                                <img src="https://img-cf.kurly.com/shop/data/category/icon_veggies_inactive_pc@2x.1586324570.png" alt=""
                                                    class="ico off">
                                                <img src="https://img-cf.kurly.com/shop/data/category/icon_veggies_active_pc@2x.1586324570.png" alt=""
                                                    class="ico on">
                                                <!--카테고리 별 아이콘은 직관적이게 img src로 바로 삽입 
                                                                                                                            클릭X(off): 기본, 클릭(on): 보라색 아이콘-->
                                            </span>
                                            <span class="tit">
                                                <span class="txt">블라블라블라</span>
                                            </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#" class="main_item">
                                            <span class="ico">
                                                <img src="https://img-cf.kurly.com/shop/data/category/icon_veggies_inactive_pc@2x.1586324570.png" alt=""
                                                    class="ico off">
                                                <img src="https://img-cf.kurly.com/shop/data/category/icon_veggies_active_pc@2x.1586324570.png" alt=""
                                                    class="ico on">
                                                <!--카테고리 별 아이콘은 직관적이게 img src로 바로 삽입 
                                                                                                                            클릭X(off): 기본, 클릭(on): 보라색 아이콘-->
                                            </span>
                                            <span class="tit">
                                                <span class="txt">블라블라블라</span>
                                            </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#" class="main_item">
                                            <span class="ico">
                                                <img src="https://img-cf.kurly.com/shop/data/category/icon_veggies_inactive_pc@2x.1586324570.png" alt=""
                                                    class="ico off">
                                                <img src="https://img-cf.kurly.com/shop/data/category/icon_veggies_active_pc@2x.1586324570.png" alt=""
                                                    class="ico on">
                                                <!--카테고리 별 아이콘은 직관적이게 img src로 바로 삽입 
                                                                                                                            클릭X(off): 기본, 클릭(on): 보라색 아이콘-->
                                            </span>
                                            <span class="tit">
                                                <span class="txt">블라블라블라</span>
                                            </span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#" class="main_item">
                                            <span class="ico">
                                                <img src="https://img-cf.kurly.com/shop/data/category/icon_veggies_inactive_pc@2x.1586324570.png" alt=""
                                                    class="ico off">
                                                <img src="https://img-cf.kurly.com/shop/data/category/icon_veggies_active_pc@2x.1586324570.png" alt=""
                                                    class="ico on">
                                                <!--카테고리 별 아이콘은 직관적이게 img src로 바로 삽입, 클릭X(off): 기본, 클릭(on): 보라색 아이콘-->
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
                            <form action="search_Product" method="post" >
                                <input type="text" id="keyword" title="검색어입력" class="inp_search" placeholder="검색어 입력" name="productname">                     
                                <input type="image" src="https://res.kurly.com/pc/service/common/1908/ico_search_x2.png" class="btn_search">
                                <div class="init">
                                    <button type="button" id="search_init" class="btn_delete">검색어 삭제하기</button>
                                </div>
                            </form>
                        </div>
                            
    
                        <div class="cart_count">
                            <!-- bg url 아이콘 추가 -->
                            <a href="#" class="btn_cart">
                                <span class="blind">장바구니</span>
                            </a>
                        </div>    
                    </ul>
            </div>
        </div>
      
		
<div class="css-nu1lw1 e12kjs5e0">
	<div id="container" class="css-1b38o8c eakz2kp1">
		<h3 class="css-i804ml eaf14xt0">전체목록</h3>
		<div class="css-pzlq5x e13nsthd1">
			<!-- <div class="css-1jgnig9 ev2ab494">
				<div class="css-0 egeqx0g0">
					<div class="css-146937 e1frj59j10">
						<button class="css-16ixplb e1frj59j9">
							<div class="css-1iwixyn e1frj59j8">카테고리</div>
							<svg width="18" height="18" viewBox="0 0 18 18" fill="none" stroke="#999" xmlns="http://www.w3.org/2000/svg" class="css-innaj4 e1frj59j6" style="transform: rotate(0deg);">
								<path d="M5 11L9 7L13 11" stroke="#999" stroke-width="1.2"></path>
							</svg>
						</button>
						<nav class="css-1kscq9s e1frj59j5" style="max-height: 100vh; opacity: 1;">
							<li class="css-x67gaa e1isxf3i1">
								<a href="/collections/market-best?page=1&amp;filters=category%3A717" class="css-s5xdrg e1isxf3i0">
									<button class="css-17kh8wb ee933650">
										<svg width="18" height="18" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
											<path d="M23.5 12C23.5 18.3513 18.3513 23.5 12 23.5C5.64873 23.5 0.5 18.3513 0.5 12C0.5 5.64873 5.64873 0.5 12 0.5C18.3513 0.5 23.5 5.64873 23.5 12Z" stroke="#ddd" fill="none"></path>
											<path d="M7 12.6667L10.3846 16L18 8.5" stroke="#ddd" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
										</svg>
									</button>
									<span class="css-1buhy1h ee933652">SUPER BIG SALE</span>
									<span class="css-ryw54y ee933651">101</span>
								</a>
							</li>
							<li class="css-x67gaa e1isxf3i1">
								<a href="/collections/market-best?page=1&amp;filters=category%3A912" class="css-s5xdrg e1isxf3i0">
									<button class="css-17kh8wb ee933650">
										<svg width="18" height="18" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
											<path d="M23.5 12C23.5 18.3513 18.3513 23.5 12 23.5C5.64873 23.5 0.5 18.3513 0.5 12C0.5 5.64873 5.64873 0.5 12 0.5C18.3513 0.5 23.5 5.64873 23.5 12Z" stroke="#ddd" fill="none"></path>
											<path d="M7 12.6667L10.3846 16L18 8.5" stroke="#ddd" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
										</svg>
									</button>
									<span class="css-1buhy1h ee933652">샐러드·간편식</span>
									<span class="css-ryw54y ee933651">56</span>
								</a>
							</li>
							<li class="css-x67gaa e1isxf3i1">
								<a href="/collections/market-best?page=1&amp;filters=category%3A911" class="css-s5xdrg e1isxf3i0">
									<button class="css-17kh8wb ee933650">
										<svg width="18" height="18" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
											<path d="M23.5 12C23.5 18.3513 18.3513 23.5 12 23.5C5.64873 23.5 0.5 18.3513 0.5 12C0.5 5.64873 5.64873 0.5 12 0.5C18.3513 0.5 23.5 5.64873 23.5 12Z" stroke="#ddd" fill="none"></path>
											<path d="M7 12.6667L10.3846 16L18 8.5" stroke="#ddd" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
										</svg>
									</button>
									<span class="css-1buhy1h ee933652">국·반찬·메인요리</span>
									<span class="css-ryw54y ee933651">39</span>
								</a>
							</li>
						</nav>
					</div>
				</div>
			</div> -->
			<div class="css-1d3w5wq ef36txc6">
				<div class="css-11kh0cw ef36txc5">
					<c:forEach var="pr" items="${list }">
						<c:choose>	
							<c:when test="${pr.pcount != 0}">
								<a href="one_Product.jsp?productnum=${pr.productnum}" class="css-9o2zup e1c07x4813">
									<div class="css-0 e1c07x4811">
										<div class="e1c07x4812 css-tou8lf e3um3060">
											<span style="box-sizing: border-box; display: block; overflow: hidden; width: initial; height: initial; background: none; opacity: 1; border: 0px; margin: 0px; padding: 0px; position: absolute; inset: 0px;">
												<img alt="상품 이미지" src="resource/image/${pr.image }" decoding="async" data-nimg="fill" class="css-0" 	style="position: absolute; inset: 0px; box-sizing: border-box; padding: 0px; border: none; margin: auto; display: block; width: 0px; height: 0px; min-width: 100%; max-width: 100%; min-height: 100%; max-height: 100%; object-fit: 	cover;" sizes="100vw" >
											</span>
										</div>
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
														<span class="discount-rate css-19lkxd2 ei5rudb0">
															<c:set var="discountPercentage" value="${((pr.price - pr.saleprice) / pr.price) * 100}" />
															<c:set var="discountPercentageInt" value="${discountPercentage * 1}" />
															 ${discountPercentageInt}%		
														</span>
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
											<c:set var="productnum" value="${pr.productnum}" />
					                        <c:set var="rlist" value="${ReviewDAO.getReviewList(productnum)}" />
					                        <c:set var="reviewcnt" value="${fn:length(rlist)}" />
											<span class="review-number css-l610kl e1c07x480">${reviewcnt }</span>
										</div>
									</div>
								</a>
							</c:when>
						</c:choose>
					</c:forEach> 
				</div>
				<div class="css-rdz8z7 e82lnfz1">
					<a href="list_Product?cpage=${pvo.beginPage - 1 }" class="css-1d20dg7 e82lnfz0">
						<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAUAAAAHCAQAAABqrk9lAAAAGElEQVR42mNgAIPi/8X/4QwwE5PBQJADAAKSG3cyVhtXAAAAAElFTkSuQmCC" alt="이전 페이지로 이동하기 아이콘">
					</a>
					<c:forEach var="pageNo" begin="${pvo.beginPage }" end="${pvo.endPage }">
					<c:if test="${pageNo == pvo.nowPage }">
						<a class="css-19yo1fh e82lnfz0">${pageNo }</a>
   						<%-- <span class="css-19yo1fh">${pageNo }</span> --%>
					</c:if>	
					<c:if test="${pageNo != pvo.nowPage }">
						<a href="list_Product?cPage=${pageNo }" class="css-1d20dg7 e82lnfz0">${pageNo }</a>
					</c:if>		
						
					</c:forEach>

					<a href="list_Product?cpage=${pvo.beginPage + 1 }" class="css-1d20dg7 e82lnfz0">
						<img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAAUAAAAHCAQAAABqrk9lAAAAGUlEQVR42mMo/l/8nwECQEwCHEwGhAlRBgA2mht3SwgzrwAAAABJRU5ErkJggg==" alt="다음 페이지로 이동하기 아이콘">
					</a>
				</div>
			</div>
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
		<div class="css-7hyi5l e1tjwjt96">
			<a href="/shop/main/html.php?htmid=event/kurly.htm&amp;name=lovers">
				<div class="css-9x337d e1tjwjt95">등급별 혜택</div>
			</a>
			<a href="/shop/board/list.php?id=recipe">
				<div class="css-9x337d e1tjwjt95">레시피</div>
			</a>
		</div>
	</div>
</div>
	

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
</div>	
</body>
</html>