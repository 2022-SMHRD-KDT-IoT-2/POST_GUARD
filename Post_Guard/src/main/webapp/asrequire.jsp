<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.dao.MemberDAO" %>
<%@ page import="com.vo.MemberVO" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    
    <script src="https://kit.fontawesome.com/44ebe7b134.js" crossorigin="anonymous"></script>
    
    <link rel="stylesheet" href="assets/css/main.css" />
    <link type="text/css" rel="stylesheet" href="./plugin/fontawesome-free-6.0.0-web/css/all.min.css">
    <link rel="stylesheet" href="assets/css/sidebar.css" />
    <link rel="stylesheet" href="service/css/style.css">
    <link rel="stylesheet" href="service/fonts/material-design-iconic-font/css/material-design-iconic-font.css">
	<link rel="stylesheet" href="service/vendor/date-picker/css/datepicker.min.css">
	
    <title>POST-GUARD | AS신청</title>
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
					<!-- <li><a href="#">택배 예약</a></li>
		            <li><a href="#">고객 정보 수정</a></li>
		            <li><a href="#">고객 정보 수정</a></li>
		            <li><a href="#">운송장</a></li> -->
				</ul>
			</nav>
		</div>
		
	</section>
	
	<div class="wrapper" style="margin-right: -50px">
			
			<%if(userInfo != null) {%>
            <form action="" method = "post">
            	<div class="form-header">
            		<br>
            		<a href="index.jsp">메인으로 돌아가기</a>
            		
            	</div>
            	<br>
            	<div id="wizard">
            			<h3>AS 신청이 완료되었습니다</h3>
	              </div>
            </form>
            <%} 
			else { %>
            	<div class="wrapper">
					<div class="image-holder">
						<a href = "login.jsp">로그인을 해주세요</a>
					</div>
				</div>
            <%} %>
		</div>
		<script>
			
		</script>
		
		
	<!-- Footer -->
	<footer id="footer" style ="color : rgb(9, 41, 97)">
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
  </body>
  	<script src="assets/js/join.js"></script>
	  
</html>
