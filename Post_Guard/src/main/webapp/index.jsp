<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.dao.MemberDAO" %>
<%@ page import="com.vo.MemberVO" %>
<!DOCTYPE html>

<html>

<head>

<title>POST-GUARD</title>

<meta charset="utf-8" />

<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />

<link rel="stylesheet" href="assets/css/main.css" />
</head>

<body class="is-preload">
<%
	MemberVO userInfo = (MemberVO)session.getAttribute("userInfo");
%>

	<!-- Sidebar -->

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
							<li><a href="">로그아웃</a>
						<%} %>
							
						</div>
					</div>



					<!-- <li><a href="#">택배 예약</a></li>

            <li><a href="#">고객 정보 수정</a></li>

            <li><a href="#">고객 정보 수정</a></li>

            <li><a href="#">운송장</a></li> -->

				</ul>

			</nav>

		</div>

	</section>



	<!-- Wrapper -->

	<div id="wrapper">
		<!-- Intro -->
		<section id="intro" class="wrapper fullscreen fade-up">
			<div class="inner">
				<h1>Post Guard</h1>
				<p>개인단위의 택배보관함 블라블라</p>
				<ul class="actions">
					<li><a href="product.jsp" class="button scrolly">상품 소개 바로 가기</a>
					</li>
				</ul>
			</div>
		</section>
	</div>



	<!-- Footer -->
	<footer id="footer" class="wrapper">
		<div class="footer__inner">
			<ul class="menu">
				<li style="font-size : 20px">&copy; POST GUARD; All rights reserved.</li>
				<li style="font-size : 20px">회사 소개</li>
				<li style="font-size : 20px">고객 센터</li>
			</ul>
		</div>
	</footer>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
	<script src="assets/js/index.js"></script>
</body>

</html>

