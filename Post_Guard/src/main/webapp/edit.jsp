<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.dao.MemberDAO" %>
<%@ page import="com.vo.MemberVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://kit.fontawesome.com/44ebe7b134.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/sidebar.css" />
<link rel="stylesheet" href="assets/css/mypage.css" />
<link type="text/css" rel="stylesheet" href="./plugin/fontawesome-free-6.0.0-web/css/all.min.css">
<title>POST-GUARD | MYPAGE</title>
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
					<!-- <li><a href="#">택배 예약</a></li>
		            <li><a href="#">고객 정보 수정</a></li>
		            <li><a href="#">고객 정보 수정</a></li>
		            <li><a href="#">운송장</a></li> -->
				</ul>
			</nav>
		</div>
	</section>
	
	<!-- 자스에서 리다이렉트 시키기 -->
<form class="mypage__edit" action="#" method="post">
	<div class="mypage__container">
		<div class="mypage__section1">
			<ul>
				<li><a href="enrollnumber.jsp">운송장 번호 등록</a></li>
				<li><a href="mytrackingnum.jsp">등록한 운송장 번호</a></li>
				<li><a href="edit.jsp">회원 정보 수정</a></li>
				<%if(userInfo.getMem_id().equals("admin")) { %>
				<li><a href="enrollcompany.jsp">택배사 등록 - 관리자 전용</a></li>
				<%} %>
				<li><span class="deleteMember">회원 탈퇴</span></li>
			</ul>
			<span class="hiddenId"><%=userInfo.getMem_id() %></span>
		</div>
		<div class="mypage__section2">
			<div class="mypage__section2--inner">
				<span><%=userInfo.getMem_name() %>님의 계정 정보</span>
				<div class="mypage__info-user">
					<span class="mypage__info-user-font">기본정보</span>
					<div class="mypage__info-userDetail">
						<div class="mypage__info-userDetail-id">
							<span style="font-weight : 600;">ID</span>
							<span class="mypage__info-userinfo"><%=userInfo.getMem_id() %></span>
						</div>
						<div class="mypage__info-userDetail-pw">
							<span style="font-weight : 600;">PASSWORD</span>
							<input class="edit_pw" type="text" value=<%=userInfo.getMem_pw() %> required >
						</div>
						<div class="mypage__info-userDetail-name">
							<span style="font-weight : 600;">이름</span>
							<!-- 수정 하게 -->
							<input class="edit_name" type="text" value=<%=userInfo.getMem_name() %> required >
						</div>
						<div class="mypage__info-userDetail-addr">
							<div class="field">
								<span style="font-weight : 600;">주소</span>
								<input type="text" id="sample6_postcode" placeholder="우편번호" readonly> 
								<input type="text" id="sample6_address" placeholder="주소" readonly> 
								<input type="text" id="sample6_detailAddress" placeholder="상세주소">
								<div class="addr__container">
									<input type="button" class="daumBtn"
										value="우편번호 찾기"
										onclick="openDaumPostCode()">
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="mypage__info-contact">
					<span class="mypage__info-phone-font">연락처정보</span>		
					<div class="mypage__info-phoneDetail">
						<div class="mypage__info-phoneDetail-email">
							<span style="font-weight : 600;">E-MAIL</span>
							<!-- 수정 하게 -->
							<input class="edit_email" type="text" value=<%=userInfo.getMem_email() %> required >
						</div>
						<div class="mypage__info-phoneDetail-phone">
							<span style="font-weight : 600;">PHONE</span>
							<!-- 수정 하게 -->
							<input class="edit_phone" type="text" value=<%=userInfo.getMem_phone() %> required >
						</div>
					</div>			
				</div>
				<button class="editdoneBtn">정보 수정</button>
			</div>
		</div>
	</div>
	</form>
	
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
	<script src="assets/js/edit.js"></script>
	<script>
		function openDaumPostCode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							var addr = "";
							var extraAddr = "";
							if (data.userSelectedType === "R") {
								addr = data.roadAddress;
							} else {
								addr = data.jibunAddress;
							}
							if (data.userSelectedType === "R") {
								if (data.bname !== ""
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								if (data.buildingName !== ""
										&& data.apartment === "Y") {
									extraAddr += extraAddr !== "" ? ", "
											+ data.buildingName
											: data.buildingName;
								}
								if (extraAddr !== "") {
									extraAddr = " (" + extraAddr + ")";
								}
								document
										.getElementById("sample6_detailAddress").value = extraAddr;
							} else {
								document
										.getElementById("sample6_detailAddress").value = "";
							}
							document.getElementById("sample6_postcode").value = data.zonecode;
							document.getElementById("sample6_address").value = addr;
							document.getElementById("sample6_detailAddress")
									.focus();
						},
					}).open();
		}
	</script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="assets/js/deleteMember.js"></script>
</body>
</html>