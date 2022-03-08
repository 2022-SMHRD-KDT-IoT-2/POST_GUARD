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
<link rel="stylesheet" href="assets/css/button.css" />
<link rel="stylesheet" href="assets/css/sidebar.css" />
<link type="text/css" rel="stylesheet" href="./plugin/fontawesome-free-6.0.0-web/css/all.min.css">
</head>

<style>

.mainlogo {
 width: 180px;
 height: 200px;
}

.box1 li {

font-size:40px;

}

.box2 li {

font-size:35px;
}


.main__container{

  margin-right: -20px;
  margin-bottom: -20px; !important
}


.footerlogo{
    
    width: 150px;
    height: 150px;
   
    
}
.footer__up-textrow1{
font-size:25px;
}

.footer__up-textrow2{
font-size:25px;
}
.footer__up-textrow3{
font-size:25px;
}
.footer__up-textrow4{
font-size:25px;
}

.footer__down{
font-size:13px;
}


</style>

<body class="is-preload">
<%
	MemberVO userInfo = (MemberVO)session.getAttribute("userInfo");
%>
	<section id="sidebar">
		<div class="inner">
			<nav>
				<ul>
					<li><a href="index.jsp"><img
							class="mainlogo" src="./images/logo(white).png" /></a></li>
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
	    <div class="main__container">
	    <div class="main__image">
    		<img  style="width : 100%; height : 100%;" src="./images/main.png"/>
    	</div>
    </div>

	<!-- <div id="wrapper">
		Intro
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
 -->


	<!-- Footer -->
	<footer id="footer">
		<div class="footer__inner">
			<div class="footer__up">
				<img class="footerlogo" src="./images/logo(navy).png" />
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

