# Market Willy (마켓윌리)

JSP/Servlet 기반의 중고거래 웹 애플리케이션입니다.  
사용자는 회원가입 후 상품을 등록하거나 구매할 수 있으며, 관리자는 사용자 및 상품을 관리할 수 있습니다.

## 🛠 주요 기능

### 사용자
- 회원가입 / 로그인 / 로그아웃
- 상품 목록 조회
- 상품 등록 / 수정 / 삭제
- 상품 검색 및 상세 보기
- 장바구니 담기 및 주문 기능

### 관리자
- 회원 관리 (목록 조회, 상세 조회, 강제 탈퇴 등)
- 상품 관리 (상품 검수 및 삭제 등)

## ⚙ 사용 기술

- Language: Java (JDK 1.8)
- Web: JSP, Servlet, JSTL
- DB: Oracle 11g
- WAS: Apache Tomcat 9
- Build Tool: 수동 빌드
- Versioning: Git / GitHub
- IDE: Eclipse
- UI/UX: HTML5, CSS3

## 🗂 프로젝트 구조

Market-Willy  
   src/com/mystudy       # Java 클래스 및 Servlet  
   WebContent/           # JSP, HTML, CSS 등 정적/동적 자원  

## 🔧 설치 및 실행 방법

1. 프로젝트 클론  
   git clone https://github.com/zzinobak/market-willy.git

2. Eclipse에서 "Existing Projects into Workspace"로 import

3. Oracle DB 연동
   - DB 생성 및 테이블 스크립트 실행 (※ SQL 파일은 별도 제공 필요)

4. Tomcat 9 서버 등록 후 실행  
   - WebContent 폴더를 Web root로 설정

## 🧩 향후 개선 예정

- MySQL 기반 DB로 마이그레이션

## 📸 시연 이미지 / GIF

> 📌 실제 화면 캡처 또는 동작 GIF 추가 예정

## 🙋🏻 프로젝트 소개

- 구현 기간: 2023.09 ~ 2023.09  
- 참여 인원: 4명 (본인은 장바구니, 주문내역 기능 구현 담당)  
