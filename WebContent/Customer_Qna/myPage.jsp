<%@page import="com.mystudy.project.DAO.CustomerDAO"%>
<%@page import="com.mystudy.project.VO.CustomerVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	CustomerVO vo = (CustomerVO) session.getAttribute("vo");	
	//System.out.println("session vo : " + vo);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="../resource/css/myPageTest.css" />
<link rel="stylesheet" href="../resource/css/commonEx.css" />
<link rel="stylesheet" href="../resource/css/resetEx.css" />

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="../resource/js/addrAPI.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<script type="text/javascript" src="../resource/js/myPage.js"></script>
	
	
<style>
   .subOl{display:none;}
</style>

<script>
    $(document).ready(function() {
        $(".txt").click(function() {
            // 현재 클릭한 요소의 하위 "subOl" 클래스 요소를 슬라이드 토글합니다.
            $(this).closest("li").find(".subOl").slideToggle();
        });
    });
    
    function insert_search() {
		location.href = "product/insert_Product.jsp";
	}
	function search() {
		location.href = "product/search_Product";
	}
	
	document.addEventListener('DOMContentLoaded', function() {
        document.getElementById('myForm').addEventListener('submit', function(event) {
            event.preventDefault();

            var password = document.getElementById('submit_check_pw').value;
            var passwordConfirmation = document.getElementById('submit_check_pw2').value;
            if (password != passwordConfirmation) {
                alert('비밀번호 확인란이 비밀번호와 일치하지 않습니다.');
            } else {
                event.target.submit();
            }
        });
    });
</script>

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
                        <p class="item service">문의/주문</p>
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
                        <h3 class="main_title">회원정보</h3>
                        <p class="sub">
                            <span id="ico">*</span>
                            필수입력사항
                        </p>


                        <form id="myForm" action="updateCustomer" method="POST">
                            <div class="row mb-3" id="font_size">
                              <label for="loginId" class="col-sm-2 col-form-label" id="fst" style="padding-top:29px; ">아이디(변경불가)<span id=ico>*</span></label>
                              <div class="col-sm-6 id_bell_f" id="sst" style="padding-top: 19px;">
                                <input type="text" name="id" class="form-control inpt_id" id="id" value="<%=vo.getId() %>" readonly="readonly">
                              </div>
                            </div>



                            <div class="row mb-3" id="font_size">
                              <label for="userpw" class="col-sm-2 col-form-label" id="fst">비밀번호<span id=ico>*</span></label>
                              <div class="col-sm-6 pw_bell_f" id="sst">
                                <input type="password" name="pwd" class="form-control inpt_pw check_pw"  id="submit_check_pw" value="<%=vo.getPwd() %>" placeholder="비밀번호를 입력해주세요">
                              </div>
                            </div>



                             <div class="row mb-3" id="font_size">
                                <label for="userpw2" class="col-sm-2 col-form-label" id="fst">비밀번호확인<span id=ico>*</span></label>
                                <div class="col-sm-6 pw2_bell_f" id="sst">
                                  <input type="password" name="pwd_chk" class="form-control inpt_pw2 check_pw"  id="submit_check_pw2" placeholder="비밀번호를 한번 더 입력해주세요">
                                </div>
                                  <div id="msg_pw" class="span"> </div>
                              </div>


                              <div class="row mb-3" id="font_size">
                                <label for="name" class="col-sm-2 col-form-label" id="fst">이름<span id=ico>*</span></label>
                                <div class="col-sm-6" id="sst">
                                  <input type="text" name="name" class="form-control"  id="submit_check_name" value="<%=vo.getName() %>" placeholder="이름을 입력해주세요">
                                </div>
                                <div id="name_chk" class="span"> </div>
                              </div>


                              <div class="row mb-3" id="font_size">
                                <label for="useremail" class="col-sm-2 col-form-label" id="fst">이메일(변경불가)<span id=ico>*</span></label>
                                <div class="col-sm-6" id="sst">
                                <input type="email" name="email" class="form-control inpt_email"  id="submit_check_email" value="<%=vo.getEmail() %>" readonly="readonly">
                                <!-- <button type="button" id="emailjungbok" onclick="checkedEmail()" class="btn btn-outline-primary">중복확인</button> -->
                                </div>
                                <div id="msg_email" class="span"> </div>
                              </div>


                              <div class="row mb-3" id="font_size">
                                <label for="phonenumber" class="col-sm-2 col-form-label" id="fst">휴대폰</label>
                                <div class="col-sm-6" id="sst">
                                  <input type="text" name="phone" class="form-control"  id="submit_check_phone" value="<%= (vo.getPhone() != null) ? vo.getPhone() : "미기재" %>">
                                </div>
                                <div id="phone_chk" class="span"> </div>
                              </div>

							  <div class="row mb-3" id="font_size">
                              <label for="loginId" class="col-sm-2 col-form-label" id="fst" style="padding-top:29px; ">우편번호</label>
                              <div class="col-sm-6 id_bell_f" id="sst" style="padding-top: 19px;">
                              	<div class="col-sm-6" id="sst">
                                	<input type="text" id="zip" name="zip" class="form-control" value="<%= (vo.getZip() != null) ? vo.getZip() : "미기재" %>">
                                	<button type="button" id="addr_btn" onclick="sample6_execDaumPostcode()" class="btn btn-outline-primary">주소검색</button>
                              	</div>
                            	</div>
                              </div>
                              
                              <div class="row mb-3" id="font_size">
                              <label for="phonenumber" class="col-sm-2 col-form-label" id="fst">주소</label>
                                <div class="col-sm-6" id="sst">
                                <input type="text" id="addr" name="addr" class="form-control" value="<%= (vo.getAddr() != null) ? vo.getAddr() : "미기재" %>">
                                <!--  <input type="text" id="addr2" name="addr2"  placeholder="상세주소"> -->
                                </div>
                              </div>
                              
                              <div class="row mb-3" id="font_size">
                              <label for="phonenumber" class="col-sm-2 col-form-label" id="fst">상세주소</label>
                                <div class="col-sm-6" id="sst">
                                <input type="text" id="addr2" name="addr2" class="form-control" value="<%= (vo.getAddr2() != null) ? vo.getAddr2() : "미기재" %>">
                                </div>
                              </div>


                              <div class="boder_btom"></div>
                              <div id="formSubmit" class="form_footer">
                                <button type="submit" class="btn active btn_join">수정하기</button>
                                <button type="button" onclick="delete_btn()" class="btn active btn_join">탈퇴하기</button>
                                <button type="button" onclick="btn_back()" class="btn active btn_join">뒤로가기</button>
                              </div>
                          </form>


                    </div>
                </div>
            </div>
        </div>
       </div>
</body>
</html>