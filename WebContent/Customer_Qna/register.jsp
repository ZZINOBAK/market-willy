<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="../resource/css/registerTest.css" />
<link rel="stylesheet" href="../resource/css/commonEx.css" />
<link rel="stylesheet" href="../resource/css/resetEx.css" />

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="../resource/js/addrAPI.js"></script>
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<script type="text/javascript" src="../resource/js/register.js"></script>

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
</script>
<style>
    .subOl{display:none;}
</style>

</head>
<body>
<div id="container" class="container">
<div id="header">
            <div class="user_menu">
                <ul class="sign_menu">
                    <li class="link">
                        <a href="register.jsp" class="item after join">회원가입</a>
                    </li>
                    <li class="link">
                        <a href="login.jsp" class="item after">로그인</a>
                    </li>
                </ul>
                <!-- .sign_menu -->
            </div>
            <div class="header_logo">
                <h1 class="logo">
                    <a href="../main.jsp" class="link_main">
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
                        </div>
                            
    
                        <div class="cart_count">
                            bg url 아이콘 추가
                            <a href="#" class="btn_cart">
                                <span class="blind">장바구니</span>
                            </a>
                        </div>  -->   
                    </ul>
            </div>
        </div>
<!-- 헤더 끝 -->

	<div id="main" >
            <div id="content" >
                <div class="main_page_aticle">
                    <div class="form">
                        <h3 class="main_title">회원가입</h3>
                        <p class="sub">
                            <span id="ico">*</span>
                            필수입력사항
                        </p>


                        <form action="register" method="POST" onsubmit="return validateForm();">
                            <div class="row mb-3" id="font_size">
                              <label for="loginId" class="col-sm-2 col-form-label" id="fst" style="padding-top:29px; ">아이디<span id=ico>*</span></label>
                              <div class="col-sm-6 id_bell_f" id="sst" style="padding-top: 19px;">
                                <input type="text" name="id" class="form-control inpt_id" id="id" placeholder="중복체크 필수">
                                <button type="button" id="idjungbok" onclick="checkedId()" class="btn btn-outline-primary">중복확인</button>
                              </div>
                              <div id="msg" class="span"> </div>
                            </div>



                            <div class="row mb-3" id="font_size">
                              <label for="userpw" class="col-sm-2 col-form-label" id="fst">비밀번호<span id=ico>*</span></label>
                              <div class="col-sm-6 pw_bell_f" id="sst">
                                <input type="password" name="pwd" class="form-control inpt_pw check_pw"  id="submit_check_pw"  placeholder="비밀번호를 입력해주세요">
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
                                  <input type="text" name="name" class="form-control"  id="submit_check_name" placeholder="이름을 입력해주세요">
                                </div>
                                <div id="name_chk" class="span"> </div>
                              </div>


                              <div class="row mb-3" id="font_size">
                                <label for="useremail" class="col-sm-2 col-form-label" id="fst">이메일<span id=ico>*</span></label>
                                <div class="col-sm-6" id="sst">
                                <input type="email" name="email" class="form-control inpt_email"  id="submit_check_email" placeholder="예:itwill@naver.com">
                                <button type="button" id="emailjungbok" onclick="checkedEmail()" class="btn btn-outline-primary">중복확인</button>
                                </div>
                                <div id="msg_email" class="span"> </div>
                              </div>


                              <div class="row mb-3" id="font_size">
                                <label for="phonenumber" class="col-sm-2 col-form-label" id="fst">휴대폰</label>
                                <div class="col-sm-6" id="sst">
                                  <input type="text" name="phone" class="form-control"  id="submit_check_phone" placeholder="' - ' 포함 13자리">
                                </div>
                                <div id="phone_chk" class="span"> </div>
                              </div>

							  <div class="row mb-3" id="font_size">
                              <label for="loginId" class="col-sm-2 col-form-label" id="fst" style="padding-top:29px; ">우편번호</label>
                              <div class="col-sm-6 id_bell_f" id="sst" style="padding-top: 19px;">
                              	<div class="col-sm-6" id="sst">
                                	<input type="text" id="zip" name="zip" class="form-control" placeholder="우편번호">
                                	<button type="button" id="addr_btn" onclick="sample6_execDaumPostcode()" class="btn btn-outline-primary">주소검색</button>
                              	</div>
                            	</div>
                              </div>
                              
                              <div class="row mb-3" id="font_size">
                              <label for="phonenumber" class="col-sm-2 col-form-label" id="fst">주소</label>
                                <div class="col-sm-6" id="sst">
                                <input type="text" id="addr" name="addr" class="form-control" placeholder="주소">
                                <!--  <input type="text" id="addr2" name="addr2"  placeholder="상세주소"> -->
                                </div>
                              </div>
                              
                              <div class="row mb-3" id="font_size">
                              <label for="phonenumber" class="col-sm-2 col-form-label" id="fst">상세주소</label>
                                <div class="col-sm-6" id="sst">
                                <input type="text" id="addr2" name="addr2" class="form-control" placeholder="상세주소">
                                </div>
                              </div>


                              <div class="boder_btom"></div>
                              <div id="formSubmit" class="form_footer">
                                <button type="submit" class="btn active btn_join">가입하기</button>
                                <button type="button" onclick="btn_back()" class="btn active btn_join">뒤로가기</button>
                              </div>
                          </form>
                    </div>
                </div>
            </div>
        </div>
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
                            <a href="#" class="tit">카카오톡 문의</a>
                        </h3>
                        <dl class="list">
                            <dt>365고객센터</dt>
                            <dd>오전 7시 - 오후 7시</dd>
                        </dl>
                    </div>
                    <div class="cc_view cc_qna">
                        <h3>
                            <a href="#" class="tit">1:1 문의</a>
                        </h3>
                        <dl class="list">
                            <dt>24시간 접수 가능</dt>
                            <dd>고객센터 운영시간에 순차적으로 답변해드리겠습니다.</dd>
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
                        입점문의 : <a href="#" class="link">입점문의하기</a>
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