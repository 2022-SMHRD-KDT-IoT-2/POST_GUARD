<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.dao.MemberDAO" %>
<%@ page import="com.vo.MemberVO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<script src="https://kit.fontawesome.com/44ebe7b134.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/sidebar.css" />
<link type="text/css" rel="stylesheet" href="./plugin/fontawesome-free-6.0.0-web/css/all.min.css">
<title>POST-GUARD | 회원가입</title>
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
<body>
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

	<div id="wrapper">
		<section id="three" class="wrapper style1 fade-up">
			<div class="inner">
				<div class="join__container">
					<section>
						<form method="post" action="#">
							<div class="fields">
								<div class="field">
									<h2>회원가입</h2>
								</div>
								<div class="field">
									<label for="name">이름</label> <input type="text" name="mem_name"
										id="name" required maxlength="30" />
									<div class="nameCheckMessageBox">
										<span id="nameCheckMessageId" class="nameCheckMessage hide">×
											이름을 입력해주세요.</span>
									</div>
								</div>
								<div class="field">
									<label for="id">아이디</label> <input type="text" name="mem_id"
										id="id" required maxlength="30" />
									<div class="idCheckMessageBox">
										<span id="idCheckMessageId" class="idCheckMessage hide">×
											중복된 ID 입니다.</span> <span id="idEmptyMessageId"
											class="idEmptyMessage hide">× ID를 입력해주세요.</span>
									</div>
								</div>
								<div class="field">
									<label for="pw">비밀번호</label> <input type="password"
										name="mem_pw" id="pw" required maxlength="30" />
								</div>
								<div class="field">
									<label for="pwcheck">비밀번호 확인</label> <input type="password"
										name="pwcheck" id="pwcheck" required maxlength="30" />
									<div class="pwCheckMessageBox">
										<span id="pwInputMessageId" class="pwInputMessage hide">×
											확인을 위해 비밀번호를 다시 입력해주세요.</span> <span id="pwCheckMessageId"
											class="pwCheckMessage hide">× 비밀번호를 확인해주세요.</span>
									</div>
								</div>
								<div class="field">
									<label for="email">메일 주소</label> <input type="email"
										name="mem_email" id="email" required maxlength="50" />
									<div class="emailCheckMessageBox">
										<span id="emailCheckMessageId" class="emailCheckMessage hide">×
											이메일을 입력해주세요.</span>
									</div>
								</div>
								<div class="field">
									<label for="tel">전화번호</label> <input type="text"
										name="mem_phone" id="tel" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" required maxlength="11" />
									<div class="phoneCheckMessageBox">
										<span id="phoneCheckMessageId" class="phoneCheckMessage hide">×
											전화번호를 입력해주세요.</span>
									</div>
								</div>
								<div class="field">
									<label for="address">주소</label> <input type="text"
										id="sample6_postcode" placeholder="우편번호" readonly> <input
										type="text" id="sample6_address" placeholder="주소" readonly> <input
										type="text" id="sample6_detailAddress" placeholder="상세주소">
									<div class="addr__container">
										<input type="button" class="daumBtn"
											value="우편번호 찾기"
											onclick="openDaumPostCode()">
									</div>
								</div>
							</div>
							<ul class="actions">
								<li class="joinbtn">
									<!-- 자바스크립트로 페이지 이동할 예정~! -->
									<button class="join joinBtn" style="font-size: 15px;">회원가입</button>
								</li>
							</ul>
						</form>
					</section>
				</div>
			</div>
		</section>
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
	<script src="assets/js/join.js"></script>
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
							document.getElementById("sample6_detailAddress").focus();
						},
					}).open();
		}
	</script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>
</html>

