<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.dao.MemberDAO" %>
<%@ page import="com.vo.MemberVO" %>
<%@ page import="com.vo.CompanyVO" %>
<%@ page import="com.dao.CompanyDAO" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/44ebe7b134.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/sidebar.css" />
<link rel="stylesheet" href="assets/css/mypage.css" />
<link type="text/css" rel="stylesheet" href="./plugin/fontawesome-free-6.0.0-web/css/all.min.css">
<title>POST-GUARD | 운송장 번호 등록</title>
</head>
<body>
<%
	MemberVO userInfo = (MemberVO)session.getAttribute("userInfo");
%>
	<section id="sidebar">
		<div class="inner">
			<nav>
				<ul>
					<li><a href="index.jsp"><img
							class="mainlogo" src="./images/logo.png" /></a></li>
					<div class="box_container">
						<div class="box1">
							<li><a href="product.jsp">상품 소개</a></li>
							<li><a href="service.jsp">서비스 신청</a></li>
							<li><a href="as.jsp">AS 신청</a></li>
							<li><a href="faq.jsp">FAQ</a></li>
						</div>
						<div class="box2">
						<%if(userInfo == null) {%>
							<li><a href="join.jsp">회원가입</a></li>
							<li><a href="login.jsp">로그인</a></li>
						<%} else { %>
							<li><a href="mypage.jsp"><%=userInfo.getMem_name() %></a></li>
							<li><a href="LogoutCon">로그아웃</a>
						<%} %>
						</div>
					</div>
				</ul>
			</nav>
		</div>
	</section>


		<div class="mypage__container">
			<div class="mypage__section1">
				<ul>
					<li><a href="enrollnumber.jsp">운송장 번호 등록</a></li>
					<li><a href="mytrackingnum.jsp">등록한 운송장 번호</a></li>
					<%if(!userInfo.isSocial()) { %>
					<li><a class="editLink" href="edit.jsp">회원 정보 수정</a></li>
					<%} %>
					<%if(userInfo.getMem_id().equals("admin")) { %>
					<li><a href="enrollcompany.jsp">택배사 등록 - 관리자 전용</a></li>
					<%} %>
				</ul>
			</div>
			<div class="mypage__section2">
				<div class="company__enroll-container">
					<span class="company__enroll-text">운송장 번호 등록</span>
					<div class="company__enroll">
						<span class="company__enroll--notifi">받을 택배의 운송장 번호를 등록합니다.(- 제외)</span>
						<div class="company_enroll--input">
							<span>운송장 번호</span>
							<input class="trackingNumber" type="text" required/>
						</div>
					</div>
					<button class="enrollBtn">등록하기</button>
				</div>
			</div>
		</div>
	
		<!-- Footer -->
	<footer id="footer">
		<div class="footer__inner">
			<div class="footer__up">
				<img class="footerlogo" src="./images/footerlogo.png" />
				<div class="footer__up-textrow1">
					<a href="product.jsp"><span>상품 소개</span></a>
				</div>
				<div class="footer__up-textrow2">
					<a href="service.jsp"><span>서비스 신청</span></a>
				</div>
				<div class="footer__up-textrow3">
					<a href="#"><span>회사 소개</span></a>
				</div>
				<div class="footer__up-textrow4">
					<a href="#"><span>채용</span></a>
				</div>
			</div>
			<hr>
			<div class="footer__down">
				<span>광주 동구 예술길 31-15 광주아트센터 4층 (POST-GUARD)
 사업자 등록번호 : 375-87-00088 직업정보제공사업 신고번호 : J1200020200016</span>
				<div class="footer__icons">
					<a href="https://www.instagram.com/"><i class="fa-brands fa-instagram fa-2xl"></i></a>
					<a href="https://twitter.com/"><i class="fa-brands fa-twitter fa-2xl"></i></a>
					<a href="https://ko-kr.facebook.com/"><i class="fa-brands fa-facebook-square fa-2xl"></i></a>
				</div>
				<span>&copy; POST GUARD; All rights reserved.</span>
			</div>
		</div>
	</footer>
	<script src="assets/js/auth.js"></script>
	<script src="assets/js/enrollnumber.js"></script>
</body>
</html>