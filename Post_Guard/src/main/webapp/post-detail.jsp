<%@page import="com.vo.ASVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dao.ASDAO"%>
<%@page import="com.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta charset="utf-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="assets/css/main.css" />
    <link rel="stylesheet" href="assets/css/sidebar.css" />
    <link type="text/css" rel="stylesheet" href="./plugin/fontawesome-free-6.0.0-web/css/all.min.css">

<title>글 내용 보는 페이지</title>

</head>
<body>
	<%
	String as_seq = request.getParameter("as_seq");
	int parsed_seq = Integer.parseInt(as_seq);
	ASDAO dao = new ASDAO();
	MemberVO userInfo = (MemberVO) session.getAttribute("userInfo");
	ASVO vo = dao.getAS_datail(parsed_seq);
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
							<li><a href="join.jsp">회원가입</a></li>
							<li><a href="login.jsp">로그인</a></li>
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

	<div class="container">
		<hr />
		<div class="row">
			<div class="col-md-10">
				<table class="table table-condensed">
					<thead>
						<tr align="center">
							<th width="10%">제목</th>
							<th width="60%"><%= vo.getAs_title() %></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>등록일자</td>
							<td><%= vo.getAs_date() %></td>
						</tr>
						<tr>
							<td>글쓴이</td>
							<td><%=userInfo.getMem_id() %></td>
						</tr>
						<tr>
							<td>카테고리</td>
							<td><%=vo.getAs_category() %></td>
						</tr>
						<tr>
							<td colspan="2">
							<%=vo.getAs_content() %>
							</td>
						</tr>
					</tbody>
				</table>
				<table id="commentTable" class="table table-condensed"></table>
				<table class="table table-condensed">
					<tr>
						<td><div class="form-inline" role="form">
								<p>
<!-- 								<div class="form-group">
									<input type="text" id="commentParentName"
										name="commentParentName" class="form-control col-lg-2"
										data-rule-required="true" placeholder="이름" maxlength="10">
								</div>
								<div class="form-group">
									<input type="password" id="commentParentPassword"
										name="commentParentPassword" class="form-control col-lg-2"
										data-rule-required="true" placeholder="패스워드" maxlength="10">
								</div> -->
								</p> <textarea style="resize:none;" id="commentParentText" class="form-control col-lg-12"
									style="width: 875px; height: 80px;" rows="4" ></textarea>
								<div class="form-group">
									<button type="button" id="submitBtn" value="enrollComment"
										name="commentParentSubmit" class="btn btn-default">댓글 등록</button>
								</div>
						</div></td>
					</tr>
				</table>
				<table class="table table-condensed">
					<thead>
						<tr>
							<td><span style='float: right'> <a href="as.jsp"><button
											type="button" id="list" class="btn btn-default">목록</button></a>
									<button type="button" id="modify" class="btn btn-default">수정</button>
									<button type="button" id="delete" class="btn btn-default">삭제</button>
									<a href="enrollas.jsp"><button type="button" id="write"
											class="btn btn-default">글쓰기</button></a>
							</span></td>
						</tr>
					</thead>
				</table>
			</div>
		</div>
		<hr />
	</div>
	
		<!-- Footer -->
	<footer id="footer" style="position : absolute; bottom : 0;">
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
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
	    <script src="assets/js/login.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>


</html>