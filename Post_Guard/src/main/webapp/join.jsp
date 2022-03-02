<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<title>POST-GUARD | 회원가입</title>
</head>
<body>
	<section id="sidebar">
		<div class="inner">
			<nav>
				<ul>
					<li><a href="index.jsp"><img class="mainlogo"
							src="./images/logo.png" /></a></li>
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
										name="mem_phone" id="tel" required />
									<div class="phoneCheckMessageBox">
										<span id="phoneCheckMessageId" class="phoneCheckMessage hide">×
											전화번호를 입력해주세요.</span>
									</div>
								</div>
								<div class="field">
									<label for="address">주소</label> <input type="text"
										id="sample6_postcode" placeholder="우편번호"> <input
										type="text" id="sample6_address" placeholder="주소"> <input
										type="text" id="sample6_detailAddress" placeholder="상세주소">
									<div class="addr__container">
										<input type="button" class="button addr addr-search"
											style="font-size: 13px;" value="우편번호 찾기"
											onclick="openDaumPostCode()">
									</div>
								</div>
							</div>
							<ul class="actions">
								<li class="joinbtn">
									<!-- 자바스크립트로 페이지 이동할 예정~! -->
									<button class="join" style="font-size: 20px;">회원가입</button>
								</li>
							</ul>
						</form>
					</section>
				</div>
			</div>
		</section>
	</div>

	<footer id="footer" class="wrapper">
		<div class="footer__inner">
			<ul class="menu">
				<li style="font-size: 20px">&copy; POST GUARD; All rights
					reserved.</li>
				<li style="font-size: 20px">회사 소개</li>
				<li style="font-size: 20px">고객 센터</li>
			</ul>
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
							document.getElementById("sample6_detailAddress")
									.focus();
						},
					}).open();
		}
	</script>
</body>
</html>

