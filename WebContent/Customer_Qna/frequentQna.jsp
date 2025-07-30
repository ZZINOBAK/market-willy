<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주하는 질문</title>
<link rel="stylesheet" href="../resource/css/commonEx.css" />
<link rel="stylesheet" href="../resource/css/resetEx.css" />
<link rel="stylesheet" href="../resource/css/list.css">
<link rel="stylesheet" href="../resource/css/frequentQna.css">
<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="../resource/js/frequentQna.js"></script>
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
        
<div class="main">
	<div class="category">
		<div width="70" class="css-hyfxhw e16adls20">번호</div>
		<div width="135" class="css-1cn1979 e16adls20">카테고리</div>
		<div class="css-1ym8aqm e16adls20">제목</div>
	</div>
	<ul class="qnaList">
		<li class="qnali"><div
				class="qnali2">
				<div class="css-dx3647 e1cfowvj2">30</div>
				<div class="css-1tixomb e1cfowvj2">취소/교환/환불</div>
				<div class="css-fzefrb e1cfowvj2">
					<div>교환(반품) 진행 시, 배송비가 부과 되나요?</div>
				</div>
			</div></li>
		<li class="css-d3v9zr e1cfowvj0" style="opacity: 1; height: auto;"><div
				class="css-1kj0ddz eec36oi0">
				<div>
					<p>
						<span data-tomark-pass="" style="color: #000000"><strong>■
								교환(반품) 진행 시, 배송비 안내</strong></span>
					</p>
					<p>
						- 단순변심에 의한 교환/반품 시 배송비 6,000원 (주문건 배송비를 낸 경우 3,000원)을 고객님께서
						부담하셔야합니다.<br> - 파트너사 판매상품의 경우, 상품의 상세페이지 내 안내 정책을 참고 부탁드립니다.
					</p>
					<p>
						<strong>▶신선/냉장/냉동 식품</strong><br> 재판매가 불가한 상품의 특성상, 단순변심/주문
						착오 시 교환 및 반품이 어려운 점 양해 부탁드립니다.<br> 상품에 따라 조금씩 맛이 다를 수 있으며,
						개인의 기호에 따라 같은 상품도 다르게 느끼실 수 있습니다.
					</p>
					<p>
						<strong>▶유통기한 30일 이상 식품 (신선/냉장/냉동 제외)&amp;기타 상품</strong><br>
						상품을 받은 날부터 7일 이내에 고객행복센터로 문의 부탁드립니다.
					</p>
					<p>
						<br data-tomark-pass="">
						<br> <strong>[참고]</strong>&nbsp;※ 다음에 해당하는 교환/환불 신청은 어려울 수
						있으니 양해 부탁드립니다.<br> ▣ 고객님의 책임 있는 사유로 상품이 멸실되거나 훼손 된 경우<br>
						( 단, 상품의 내용을 확인하기 위해 포장 등을 훼손한 경우는 제외 )<br> ▣ 고객님의 사용 또는 일부
						소비로 상품의 가치가 감소한 경우<br> ▣ 시간이 지나 다시 판매하기 곤란할 정도로 상품의 가치가 감소한
						경우<br> ▣ 복제가 가능한 상품의 포장이 훼손 된 경우<br> ▣ 고객님의 주문에 따라 개별적으로
						생산되는 상품의 제작이 이미 진행 된 경우
					</p>
				</div>
			</div></li>
			
		<li class="qnali"><div
				class="qnali2">
				<div class="css-dx3647 e1cfowvj2">29</div>
				<div class="css-1tixomb e1cfowvj2">선물하기</div>
				<div class="css-fzefrb e1cfowvj2">
					<div>선물하기 주문을 취소하고 싶어요</div>
				</div>
			</div></li>
			<li class="css-d3v9zr e1cfowvj0" style="opacity: 1; height: auto;"><div
					class="css-1kj0ddz eec36oi0">
					<div>
						<p>■ 선물하기 주문 취소 방법</p>
						<ul>
							<li>선물 수락대기 : 주문자 직접 취소 가능 ( 경로 : 마이컬리-선물내역 )</li>
						</ul>
						<p>[참고]</p>
						<p>▣ 배송지 입력 후 주문 취소가 필요하시다면 컬리 고객행복센터 카카오톡으로 문의해주세요.</p>
						<p>다만, 상품 포장이 시작되었다면 취소가 어려울 수 있는 점 양해 바랍니다</p>
					</div>
				</div></li>

			<li class="qnali"><div
				class="qnali2">
				<div class="css-dx3647 e1cfowvj2">28</div>
				<div class="css-1tixomb e1cfowvj2">포장</div>
				<div class="css-fzefrb e1cfowvj2">
					<div>포장재를 회수하기도 하나요?</div>
				</div>
			</div></li>
			<li class="css-d3v9zr e1cfowvj0" style="opacity: 1; height: auto;"><div
					class="css-1kj0ddz eec36oi0">
					<div>■ 포장재 회수 안내 컬리에서는 아래와 같이 수도권 샛별배송지역에 한해서 일부 포장재의 회수 서비스를
						진행하고 있습니다. <br>- 대상지역 : 수도권 샛별배송 지역 + 컬리 퍼플 박스 주문 건 <br>- 회수대상 : 컬리 퍼플
						박스포장 방법으로 주문 시, 발생한 냉장/냉동 포장한 비닐 * 1회 최대 2장 * 기타 종이소재 포장재( 완충재,
						종이봉투, 종이테이프등) 및 아이스팩은 미회수 <br>- 회수방법 : <br>① 상품 수령 후 비닐에서 송장을 제거해주세요 <br>② 다음
						주문 시 컬리 퍼플 박스 안에 비닐을 넣어두세요 <br>③ 새로운 주문이 배송 됨과 동시에 배송 기사님께서 퍼플박스 안의
						비닐을 회수합니다 <br>[참고] <br>▣ 간혹, 배송매니저님들께서 깜빡하고 회수를 잊으시거나 부득이 회수가 어려운 경우로 누락될
						수 있습니다. 고객님의 너그러운 양해 부탁드리며 고객센터 문의 남겨주시면 배송 매니저님께 잊지 않으시도록 꼭 전달
						드리겠습니다.<br> ▣ 상세 내용은 컬리홈&gt;공지사항 게시판에서 확인 할 수 있습니다. <br>▣ 종이박스 회수는 2023년
						11월 1일부로 종료되었습니다.</div>
				</div></li>

			<li class="qnali"><div
				class="qnali2">
				<div class="css-dx3647 e1cfowvj2">27</div>
				<div class="css-1tixomb e1cfowvj2">회원</div>
				<div class="css-fzefrb e1cfowvj2">
					<div>아이디, 비밀번호를 잊어버렸습니다.</div>
				</div>
			</div></li>
			<li class="css-d3v9zr e1cfowvj0" style="opacity: 1; height: auto;"><div
					class="css-1kj0ddz eec36oi0">
					<div>
						안알려줍니다.
					</div>
				</div></li>
			
		<li class="qnali"><div
				class="qnali2">
				<div class="css-dx3647 e1cfowvj2">26</div>
				<div class="css-1tixomb e1cfowvj2">이벤트/쿠폰/적립금</div>
				<div class="css-fzefrb e1cfowvj2">
					<div>적립금은 언제 지급 되나요?</div>
				</div>
			</div></li>
			<li class="css-d3v9zr e1cfowvj0" style="opacity: 1; height: auto;"><div
					class="css-1kj0ddz eec36oi0">
					<div>
						아직 없어요.
					</div>
				</div></li>
				
		<li class="qnali"><div
				class="qnali2">
				<div class="css-dx3647 e1cfowvj2">25</div>
				<div class="css-1tixomb e1cfowvj2">시스템오류</div>
				<div class="css-fzefrb e1cfowvj2">
					<div>컬리앱이 켜지지 않아요</div>
				</div>
			</div></li>
			<li class="css-d3v9zr e1cfowvj0" style="opacity: 1; height: auto;"><div
					class="css-1kj0ddz eec36oi0">
					<div>
						앱은 없는데..?
					</div>
				</div></li>
				
		<li class="qnali"><div
				class="qnali2">
				<div class="css-dx3647 e1cfowvj2">24</div>
				<div class="css-1tixomb e1cfowvj2">서비스 이용</div>
				<div class="css-fzefrb e1cfowvj2">
					<div>이벤트 문자는 오는데, 배송완료문자만 오지 않습니다.</div>
				</div>
			</div></li>
			<li class="css-d3v9zr e1cfowvj0" style="opacity: 1; height: auto;"><div
					class="css-1kj0ddz eec36oi0">
					<div>
						이벤트 많이 봐주세요
					</div>
				</div></li>
			
		<li class="qnali"><div
				class="qnali2">
				<div class="css-dx3647 e1cfowvj2">23</div>
				<div class="css-1tixomb e1cfowvj2">취소/교환/환불</div>
				<div class="css-fzefrb e1cfowvj2">
					<div>상품불량인 경우, 교환(반품) 기준이 궁금합니다.</div>
				</div>
			</div></li>
			<li class="css-d3v9zr e1cfowvj0" style="opacity: 1; height: auto;"><div
					class="css-1kj0ddz eec36oi0">
					<div>
						안바꿔줍니다.
					</div>
				</div></li>
			
		<li class="qnali"><div
				class="qnali2">
				<div class="css-dx3647 e1cfowvj2">22</div>
				<div class="css-1tixomb e1cfowvj2">배송</div>
				<div class="css-fzefrb e1cfowvj2">
					<div>(샛별배송) 집 앞이 아니라 공동현관/경비실 앞에 배송되었어요.</div>
				</div>
			</div></li>
			<li class="css-d3v9zr e1cfowvj0" style="opacity: 1; height: auto;"><div
					class="css-1kj0ddz eec36oi0">
					<div>
						아쉽네요ㅜ
					</div>
				</div></li>
			
		<li class="qnali"><div
				class="qnali2">
				<div class="css-dx3647 e1cfowvj2">21</div>
				<div class="css-1tixomb e1cfowvj2">시스템오류</div>
				<div class="css-fzefrb e1cfowvj2">
					<div>IOS 환경에서 컬리APP의 주문내역이 확인되지 않습니다</div>
				</div>
			</div></li>
			
			
		<li class="qnali"><div
				class="qnali2">
				<div class="css-dx3647 e1cfowvj2">20</div>
				<div class="css-1tixomb e1cfowvj2">회원</div>
				<div class="css-fzefrb e1cfowvj2">
					<div>(카카오간편 로그인) 카카오톡으로 기존 아이디 연동했는데, 회원정보를 바꾸고 싶어요</div>
				</div>
			</div></li>
		<li class="qnali"><div
				class="qnali2">
				<div class="css-dx3647 e1cfowvj2">19</div>
				<div class="css-1tixomb e1cfowvj2">셀프픽업</div>
				<div class="css-fzefrb e1cfowvj2">
					<div>셀프픽업 상품 구매 후 교환권은 어떤 방식으로 받나요?</div>
				</div>
			</div></li>
		<li class="qnali"><div
				class="qnali2">
				<div class="css-dx3647 e1cfowvj2">18</div>
				<div class="css-1tixomb e1cfowvj2">상품</div>
				<div class="css-fzefrb e1cfowvj2">
					<div>(주류) 성인인증이 자꾸 실패합니다.</div>
				</div>
			</div></li>
		<li class="qnali"><div
				class="qnali2">
				<div class="css-dx3647 e1cfowvj2">17</div>
				<div class="css-1tixomb e1cfowvj2">주문/결제/대량주문</div>
				<div class="css-fzefrb e1cfowvj2">
					<div>
						<p>
							<span data-tomark-pass="" style="color: #000000;">구매한 주문건의
								영수증은 어떻게 발급 받나요?</span>
						</p>
					</div>
				</div>
			</div></li>
		<li class="qnali"><div
				class="qnali2">
				<div class="css-dx3647 e1cfowvj2">16</div>
				<div class="css-1tixomb e1cfowvj2">시스템오류</div>
				<div class="css-fzefrb e1cfowvj2">
					<div>최종 결제처리 후, [결제완료] 창으로 넘어가지 않습니다.</div>
				</div>
			</div></li>
	</ul>
	<div class="css-1kbzkwh e14yho7m0">
		<div class="css-sxxs1g eytury60">
			<button type="button" class="css-rzcdhr e1hbwyso0" disabled="">
				<div class="css-7qb0sc e1ilyb3p0">이전</div>
			</button>
			<button type="button" class="css-1jwilit e1pk9060" id="next1">
				<div class="css-7qb0sc e1ilyb3p0">다음</div>
			</button>
		</div>
	</div>
</div>

<div class="main2" style="display: none">
<div class="category">
		<div width="70" class="css-hyfxhw e16adls20">번호</div>
		<div width="135" class="css-1cn1979 e16adls20">카테고리</div>
		<div class="css-1ym8aqm e16adls20">제목</div>
	</div>
	<ul class="qnaList">
		<li class="qnali"><div 
				class="qnali2"> 
				<div class="css-dx3647 e1cfowvj2">15</div>
				<div class="css-1tixomb e1cfowvj2">회원</div>
				<div class="css-fzefrb e1cfowvj2">
					<div>개명을 하여 회원정보의 이름을 바꾸고 싶습니다.</div>
				</div>
			</div></li>
			<li class="css-d3v9zr e1cfowvj0" style="opacity: 1; height: auto;"><div
					class="css-1kj0ddz eec36oi0">
					<div>
						로그인 후 우측상단 마이페이지에서 변경하세요
					</div>
				</div></li>
				
		<li class="qnali"><div
				class="qnali2">
				<div class="css-dx3647 e1cfowvj2">14</div>
				<div class="css-1tixomb e1cfowvj2">셀프픽업</div>
				<div class="css-fzefrb e1cfowvj2">
					<div>셀프픽업 서비스는 무엇인가요?</div>
				</div>
			</div></li>
			<li class="css-d3v9zr e1cfowvj0" style="opacity: 1; height: auto;"><div
					class="css-1kj0ddz eec36oi0">
					<div>
						스스로 가져가기
					</div>
				</div></li>
			
		<li class="qnali"><div
				class="qnali2">
				<div class="css-dx3647 e1cfowvj2">13</div>
				<div class="css-1tixomb e1cfowvj2">이벤트/쿠폰/적립금</div>
				<div class="css-fzefrb e1cfowvj2">
					<div>제세공과금이 무엇인가요?</div>
				</div>
			</div></li>
			<li class="css-d3v9zr e1cfowvj0" style="opacity: 1; height: auto;"><div
					class="css-1kj0ddz eec36oi0">
					<div>
						제세공과금은 경품 수령 시 발생되는 소득에 따라 납부하는 세금을 의미합니다.<br> ​ 소득세법에 의거하여 경품의
						단가가 50,000원이 초과할 경우 단가의 22%가 제세공과금으로 발생됩니다.<br> ​ 경품 제공자가
						제세공과금을 대리 납부할 경우, 원천세 신고 처리의 의무가 있으며, 당첨자의 주민번호가 필수 정보로 사용됩니다.<br>
						​ 수집된 주민번호는 원천세 신고가 완료된 후, 안전하게 삭제됩니다.<br>
					</div>
				</div></li>
			
		<li class="qnali"><div
				class="qnali2">
				<div class="css-dx3647 e1cfowvj2">12</div>
				<div class="css-1tixomb e1cfowvj2">퍼플박스</div>
				<div class="css-fzefrb e1cfowvj2">
					<div>
						<p>퍼플박스는 어떻게 이용하나요?</p>
					</div>
				</div>
			</div></li>
		<li class="qnali"><div
				class="qnali2">
				<div class="css-dx3647 e1cfowvj2">11</div>
				<div class="css-1tixomb e1cfowvj2">배송</div>
				<div class="css-fzefrb e1cfowvj2">
					<div>
						<p>샛별/낮배송(택배)이 무엇인가요?</p>
					</div>
				</div>
			</div></li>
		<li class="qnali"><div
				class="qnali2">
				<div class="css-dx3647 e1cfowvj2">10</div>
				<div class="css-1tixomb e1cfowvj2">선물하기</div>
				<div class="css-fzefrb e1cfowvj2">
					<div>PC에서 선물하기 주문을 할 수는 없나요?</div>
				</div>
			</div></li>
		<li class="qnali"><div
				class="qnali2">
				<div class="css-dx3647 e1cfowvj2">9</div>
				<div class="css-1tixomb e1cfowvj2">포장</div>
				<div class="css-fzefrb e1cfowvj2">
					<div>상품은 어떻게 포장되나요?</div>
				</div>
			</div></li>
		<li class="qnali"><div
				class="qnali2">
				<div class="css-dx3647 e1cfowvj2">8</div>
				<div class="css-1tixomb e1cfowvj2">서비스 이용</div>
				<div class="css-fzefrb e1cfowvj2">
					<div>
						<p>컬리는 어떤 회사인가요?</p>
					</div>
				</div>
			</div></li>
		<li class="qnali"><div
				class="qnali2">
				<div class="css-dx3647 e1cfowvj2">7</div>
				<div class="css-1tixomb e1cfowvj2">시스템오류</div>
				<div class="css-fzefrb e1cfowvj2">
					<div>휴대폰 간편결제 중에 "결제가 종료되었습니다"라는 문구가 발생합니다.</div>
				</div>
			</div></li>
		<li class="qnali"><div
				class="qnali2">
				<div class="css-dx3647 e1cfowvj2">6</div>
				<div class="css-1tixomb e1cfowvj2">컬리패스/멤버스</div>
				<div class="css-fzefrb e1cfowvj2">
					<div>
						<p>(컬리패스) 컬리패스 주문내역은 어디서 확인하나요?</p>
					</div>
				</div>
			</div></li>
		<li class="qnali"><div
				class="qnali2">
				<div class="css-dx3647 e1cfowvj2">5</div>
				<div class="css-1tixomb e1cfowvj2">주문/결제/대량주문</div>
				<div class="css-fzefrb e1cfowvj2">
					<div>주문 시 배송비가 부과되나요?</div>
				</div>
			</div></li>
		<li class="qnali"><div
				class="qnali2">
				<div class="css-dx3647 e1cfowvj2">4</div>
				<div class="css-1tixomb e1cfowvj2">셀프픽업</div>
				<div class="css-fzefrb e1cfowvj2">
					<div>셀프픽업 서비스는 어떻게 주문하나요?</div>
				</div>
			</div></li>
		<li class="qnali"><div
				class="qnali2">
				<div class="css-dx3647 e1cfowvj2">3</div>
				<div class="css-1tixomb e1cfowvj2">퍼플박스</div>
				<div class="css-fzefrb e1cfowvj2">
					<div>
						<p>퍼플박스는 따로 구매해야 하나요?</p>
					</div>
				</div>
			</div></li>
		<li class="qnali"><div
				class="qnali2">
				<div class="css-dx3647 e1cfowvj2">2</div>
				<div class="css-1tixomb e1cfowvj2">취소/교환/환불</div>
				<div class="css-fzefrb e1cfowvj2">
					<div>교환(반품) 어떻게 진행 되나요?</div>
				</div>
			</div></li>
		<li class="qnali"><div
				class="qnali2">
				<div class="css-dx3647 e1cfowvj2">1</div>
				<div class="css-1tixomb e1cfowvj2">상품</div>
				<div class="css-fzefrb e1cfowvj2">
					<div>친환경/유기농/무농약이 어떻게 다른가요?</div>
				</div>
			</div></li>
	</ul>
		<div class="css-1kbzkwh e14yho7m0">
		<div class="css-sxxs1g eytury60">
			<button type="button" class="css-rzcdhr e1hbwyso0" id="prev">
				<div class="css-7qb0sc e1ilyb3p0">이전</div>
			</button>
			<button type="button" class="css-1jwilit e1pk9060" disabled="">
				<div class="css-7qb0sc e1ilyb3p0">다음</div>
			</button>
		</div>
	</div>
	</div>
	
	<!-- css footer부분 -->
         <div id="footer">
         <hr>
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