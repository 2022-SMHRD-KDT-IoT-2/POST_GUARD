<%@page import="com.vo.ASReplyVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dao.ASDAO"%>
<%@page import="com.vo.ASVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.dao.MemberDAO"%>
<%@ page import="com.vo.MemberVO"%>
<%@ page import="com.vo.ASVO"%>
<%@ page import="com.dao.ASDAO"%>
<%@ page import="com.vo.ASReplyVO"%>

<!DOCTYPE html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<link
	href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap"
	rel="stylesheet" />
<link rel="stylesheet" href="assets/fonts/icomoon/style.css" />
<link rel="stylesheet" href="assets/css/owl.carousel.min.css" />

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css" />
<!-- Style -->
<link rel="stylesheet" href="assets/css/style.css" />

    <title>AS 신청</title>
  </head>
   <body>

<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/sidebar.css" />
<link rel="stylesheet" href="assets/css/button.css" />

<link type="text/css" rel="stylesheet" href="./plugin/fontawesome-free-6.0.0-web/css/all.min.css">
<title>AS 신청</title>
</head>
<body>
	<%
	ASDAO dao = new ASDAO();
	MemberVO userInfo = (MemberVO) session.getAttribute("userInfo");
	ArrayList<ASVO> arr_vo = dao.getAS_list(); 
	%>
	<!-- INDEX -->
<section id="sidebar">
		<div class="inner">
			<nav>
				<ul>
					<li><a href="index.jsp">
					<img class="mainlogo" src="./images/logo.png" /></a></li>
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
	
	<!-- AS게시글 목록 -->
			<div class="content">
				<div class="container">
					<h1 class="mb-5">AS 신청</h1>
						<a href="enrollas.jsp">
						<button name="enrollASList"	value="AS등록">게시글 등록</button></a>
						<div class="table-responsive">
						<table class="table table-striped custom-table">
							<thead>
								<tr>
									<th scope="col">카테고리</th>
									<th scope="col">제목</th>
									<th scope="col">작성자</th>
									<th scope="col">답변 유무</th>
								</tr>
							</thead>

					<tbody>
					<tr scope="row">
					<%
					for (int i = arr_vo.size() - 1; i >= 0; i--) {
					%>
					<tr scope="row">
					<td><%=arr_vo.get(i).getAs_category()%></td>
					<!-- 게시글 보여주는 페이지로 이동시키기! href수정해야함!!  -->
					<td><a href="post-detail.jsp?as_title=<%= arr_vo.get(i).getAs_title()%>"><%= arr_vo.get(i).getAs_title()%></a></td>
					<td><%= arr_vo.get(i).getMem_id()%></td>
					<td>Y/S</td>


					</tr>
					<%}%>
					</tbody>
				</table>
				</div>
			</div>
		</div>
		
		<!-- footer -->
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
					<span>광주 동구 예술길 31-15 광주아트센터 4층 (POST-GUARD) 사업자 등록번호 :
						375-87-00088 직업정보제공사업 신고번호 : J1200020200016</span>
						<div class="footer__icons">
							<a href="https://www.instagram.com/"><i
								class="fa-brands fa-instagram fa-2xl"></i></a> <a
								href="https://twitter.com/"><i
								class="fa-brands fa-twitter fa-2xl"></i></a> <a
								href="https://ko-kr.facebook.com/"><i
								class="fa-brands fa-facebook-square fa-2xl"></i></a>
						</div>
						<span>&copy; POST GUARD; All rights reserved.</span>
						</div>
				</div>
			</footer>

		<script src="assets/js/jquery-3.3.1.min.js"></script>
		<script src="assets/s/popper.min.js"></script>
		<script src="assets/js/bootstrap.min.js"></script>
		<script src="assets/js/main.js"></script>
</body>
</html>
