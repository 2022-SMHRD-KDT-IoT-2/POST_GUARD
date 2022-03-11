<%@page import="com.vo.ASVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dao.ASDAO"%>
<%@page import="com.vo.MemberVO"%>
<%@page import="com.vo.ASReplyVO"%>
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
<link rel="stylesheet" href="assets/css/DetailAs.css" />
<link type="text/css" rel="stylesheet"
	href="./plugin/fontawesome-free-6.0.0-web/css/all.min.css">
<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css" />

<title>POST-GUARD | AS 신청</title>

</head>
<body>
	<%
	String as_seq = request.getParameter("as_seq");
	int parsed_seq = Integer.parseInt(as_seq);
	ASDAO dao = new ASDAO();
	MemberVO userInfo = (MemberVO) session.getAttribute("userInfo");
	ASVO vo = dao.getAS_datail(parsed_seq);
	ArrayList<ASReplyVO> al = dao.getAS_cmt_content(parsed_seq);
	%>

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






	<div class="AsDetail__container">
		<div class="asdetail">
			<div class="detail_page">
				<table class="table inner">
					<thead>
						<tr align="center">
							<th width="20%"><span class="title">제목</span></th>
							<th width="20%" class="vo_as_title"><%=vo.getAs_title()%></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><span class="title">등록일자</span></td>
							<td><%=vo.getAs_date()%></td>
						</tr>
						<tr>
							<td><span class="title">글쓴이</span></td>
							<td><%=userInfo.getMem_id()%></td>
						</tr>
						<tr>
							<td><span class="title">카테고리</span></td>
							<td class="vo_as_category"><%=vo.getAs_category()%></td>
						</tr>
						<tr>
							<td colspan="2" class="vo_as_content"><%=vo.getAs_content()%></td>
						</tr>
					</tbody>
				</table>
				<table class="table table-condensed">
					<thead>
						<tr>
							<th> </th>
							<th> </th>
							<th> </th>
						</tr>
					</thead>
					<tbody class="tbody_cmt_list">
						<%
						for (int i = 0; i < al.size(); i++) {
						%>
						<tr>
							<td>[<%=al.get(i).getMem_id()%>]</td>
							<td><%=al.get(i).getAs_cmt_content()%></td>
							<td><%=al.get(i).getAs_cmt_date()%></td>
						</tr>
						<%
						}
						%>

					</tbody>
				</table>
						<tr>
							<td colspan="3">
							<div class="as__comment">
								<div class="comment_as_title" role="form">
								<div class="comment_as_title__inner">
									<span class="commentTitle" >Comments</span>
									<div class="input_comment">
										<textarea placeholder="댓글을 입력해주세요." class="comment_enroll" style="resize: none; overflow:hidden; width:550px; height:60px;"></textarea>
										<button type="button" class="eorollCommentBtn">등록</button>
									</div>
								</div>
								</div>
							</div>
							</td>
						</tr>
				<div class="form-group_content">
						<button type="button" class="listBtn">목록</button>
						<%if(userInfo.getMem_id().equals("admin")) { %>
						<button type="button" class="deleteBtn">글 삭제</button>
						<%} %>
				</div>
			</div>
		</div>
		<hr />
	</div>
	<span class="as__seq"><%= as_seq%></span>






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
	<script src="assets/js/enrollCmt.js"></script>
	<script src="assets/js/ASButtons.js"></script>
</body>
</html>