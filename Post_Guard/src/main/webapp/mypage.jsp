<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="EUC-KR"%>
<%@ page import="com.dao.MemberDAO" %>
<%@ page import="com.vo.MemberVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/44ebe7b134.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/sidebar.css" />
<title>POST-GUARD | EDIT</title>
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
							<li><a href="product.jsp">��ǰ �Ұ�</a></li>
							<li><a href="service.jsp">���� ��û</a></li>
							<li><a href="as.jsp">AS ��û</a></li>
							<li><a href="faq.jsp">FAQ</a></li>
						</div>
						<div class="box2">
						<%if(userInfo == null) {%>
							<li><a href="join.jsp">ȸ������</a></li>
							<li><a href="login.jsp">�α���</a></li>
						<%} else { %>
							<li><a href="mypage.jsp"><%=userInfo.getMem_name() %></a></li>
							<li><a href="LogoutCon">�α׾ƿ�</a>
						<%} %>
						</div>
					</div>
					<!-- <li><a href="#">�ù� ����</a></li>
		            <li><a href="#">�� ���� ����</a></li>
		            <li><a href="#">�� ���� ����</a></li>
		            <li><a href="#">�����</a></li> -->
				</ul>
			</nav>
		</div>
	</section>
	
		<!-- Footer -->
	<footer id="footer">
		<div class="footer__inner">
			<div class="footer__up">
				<img class="footerlogo" src="./images/footerlogo.png" />
				<div class="footer__up-textrow1">
					<a href="product.jsp"><span>��ǰ �Ұ�</span></a>
				</div>
				<div class="footer__up-textrow2">
					<a href="service.jsp"><span>���� ��û</span></a>
				</div>
				<div class="footer__up-textrow3">
					<a href="#"><span>ȸ�� �Ұ�</span></a>
				</div>
				<div class="footer__up-textrow4">
					<a href="#"><span>ä��</span></a>
				</div>
			</div>
			<hr>
			<div class="footer__down">
				<span>���� ���� ������ 31-15 ���־�Ʈ���� 4�� (POST-GUARD)
 ����� ��Ϲ�ȣ : 375-87-00088 ��������������� �Ű��ȣ : J1200020200016</span>
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
</html>