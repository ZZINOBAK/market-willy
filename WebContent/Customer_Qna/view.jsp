<%@page import="com.mystudy.project.DAO.QnaAnswerDAO"%>
<%@page import="com.mystudy.project.VO.QnaAnswerVO"%>
<%@page import="com.mystudy.project.VO.CustomerVO"%>
<%@page import="com.mystudy.project.VO.QnaVO"%>
<%@page import="com.mystudy.project.DAO.QnaDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	int qnaNum = Integer.parseInt(request.getParameter("qnaNum"));
	QnaVO vo = QnaDAO.viewQna(qnaNum);
	CustomerVO customervo = (CustomerVO) session.getAttribute("vo");
	
	String id = (String) request.getParameter("id");
	//System.out.println("id : " + id);
	session.setAttribute("qnaVO", vo);
	//System.out.println("qnaVO : " + vo);
	
	//답변받아오기
	QnaAnswerVO answerVO = QnaAnswerDAO.findAnswer(qnaNum);
	//System.out.println("answerVO : " + answerVO);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>
<link rel="stylesheet" href="../resource/css/commonEx.css" />
<link rel="stylesheet" href="../resource/css/resetEx.css" />
<link rel="stylesheet" href="../resource/css/view.css" />

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
document.addEventListener("DOMContentLoaded", function() {
    var customerId = "<%=customervo.getId() %>";

    var id = "<%= vo.getId() %>"; // JSP에서 문자열로 받기

    // 버튼을 찾고 클릭 이벤트 리스너를 추가
    var btnUpdate = document.getElementById("btn_update");
    var btnDelete = document.getElementById("btn_delete");

    console.log("customerId, id : " + customerId + ", " + id + "\n btnUpdate, Delete" + btnUpdate + ", " + btnDelete);
    console.log(customerId === id);
    	
    if (customerId  === id ) {
        // vo.getId()와 id가 같을 때 버튼을 활성화
        btnUpdate.style.display = "inline";
        btnDelete.style.display = "inline";
    } else {
        // 다른 경우 버튼을 비활성화
        btnUpdate.style.display = "none";
        btnDelete.style.display = "none";
    }
});


function btn_back(){
	history.back();
}

function btnUpdate(){
	location.href = "updateQna.jsp";
}

	 function btnDelete() {
	        if (confirm("게시글을 삭제하시겠습니까?")) {
	            $.ajax({
	                url: 'qnaDeleteController',
	                type: 'POST',
	                data: { qnaNum: <%= vo.getQnaNum() %> },
	                dataType: 'text',
	                success: function (response) {
	                	console.log(response);
	                    if (response === "success") {
	                        alert('게시글이 삭제되었습니다.');
	                        location.href = "qnA.jsp";
	                    } else {
	                        alert('게시글 삭제에 실패했습니다.');
	                        location.href = "qnA.jsp";
	                    }
	                },
	                error: function (error) {
	                    alert('게시글 삭제에 실패했습니다.');
	                    console.log(error);
	                }
	            });
	        }
	    }
	 function btn_back(){
			history.back();
		}
	 
		$(document).ready(function() {
	        $(".txt").click(function() {
	            // 현재 클릭한 요소의 하위 "subOl" 클래스 요소를 슬라이드 토글합니다.
	            $(this).closest("li").find(".subOl").slideToggle();
	        });
	    });
</script>
<style>
	input, textarea{ border: none; outline: none;}
	.subOl{display:none;}
	
	#fst{
		border-right: 1px solid silver;
	}
	#qnaContent{
		border: 1px solid silver;
	}
	
	.answer{
		width: 500px;
		height: 500px;
		text-align: left;
		margin: auto;
		padding: 2%;
	}
	
	#pWrite{
	line-height: 12px; 
}
</style>
</head>
<body>
<div id="container" class="container">
<div id="header">
            <div class="user_menu">
                <ul class="sign_menu">
                    <li class="link">
                        <a href="logout.jsp" class="item after join">로그아웃</a>
                    </li>
                    <li class="link">
                        <a href="myPage.jsp" class="item after">내정보</a>
                    </li>
                    <li class="link">
                        <p class="item service" id="pWrite">문의/주문</p>
                        <!-- 고객센터 hover 시 sub_menu 등장 -->
                        <ul class="sub_menu">
                            <li class="list">
                                <a href="frequentQna.jsp" class="list_item">자주하는 질문</a>
                            </li>
                            <li class="list">
                                <a href="writeQna.jsp" class="list_item">1:1 문의하기</a>
                            </li>
                            <li class="list">
                                <a href="myQnA.jsp" class="list_item">나의 문의내역</a>
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
                	<!-- 로고 -->
                    <a href="../main_login.jsp" class="link_main">
                        <span class="gnb_logo_container"></span>
                        <img src="../resource/image/logo.png" alt="윌리마켓" class="logo_img">
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
    
                        <!-- <div class="gnb_search">
                            <form action="">
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
        
	<div id="main" >
            <div id="content" >
                <div class="main_page_aticle">
                    <div class="form">
                    <p class="sub"></p>
                        <form>
                         	<div class="row mb-3" id="font_size">
                              <label for="loginId" class="col-sm-2 col-form-label" id="fst" style="padding-top:29px; ">작성자</label>
                              <div class="col-sm-6 id_bell_f" id="sst" style="padding-top: 19px;">
                                <input type="text" name="id" class="form-control" id="id"  value="<%=vo.getId() %>" readonly="readonly">
                              </div>
                            </div>
                     <p class="sub"></p>       
                            <div class="row mb-3" id="font_size">
                              <label for="loginId" class="col-sm-2 col-form-label" id="fst" style="padding-top:29px; ">제목</label>
                              <div class="col-sm-6 id_bell_f" id="sst" style="padding-top: 19px;">
                                <input type="text" name="qnaTitle" class="form-control" id="qnaTitle" value="<%=vo.getQnaTitle() %>" readonly="readonly">
                              </div>
                            </div>

					<p class="sub"></p>
                            <!-- <div class="row mb-3" id="font_size">
                              <label for="userpw" class="col-sm-2 col-form-label" id="fst">문의내용</label>
                            </div> -->
                              <div class="col-sm-6 pw_bell_f" id="sst">
                                <textarea name="qnaContent" class="form-control"  id="qnaContent" readonly="readonly"> <%=vo.getQnaContent()%> </textarea>
                              </div>

                            
                              <div class="boder_btom"></div>
                              <div id="formSubmit" class="form_footer">
                                <button type="button" onclick="btn_back()" class="btn active btn_join">뒤로가기</button>
                                <button type="button" id="btn_update" class="btn active btn_join" onclick="btnUpdate()">수정하기</button>
                                <button type="button" id="btn_delete" class="btn active btn_join" onclick="btnDelete()">삭제하기</button>
                              </div>
                          </form>
                    </div>
                </div>
            </div>

		<%
		if (answerVO != null) {
		%>
		<div class="answer">
			<hr>
			<h2>문의하신 내용의 답변입니다.</h2>
			<h3>
				-- <%=answerVO.getAnsContent()%></h3>
			<br>
			<br>
			<br>
		</div>
		<%
		}
		%>
	</div>
        
        
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