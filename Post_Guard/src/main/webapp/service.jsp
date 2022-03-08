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
	
    <title>POST-GUARD | 서비스신청</title>
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
.wrapper {
margin-right: -280px;
margin-bottom: 50px;
margin-top: 50px; 
}




</style>
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
	
	
				
				
			<div class="wrapper" >
            	
            	
            	<div id="wizard">
            		<h4></h4>
            		 <section>
	                 	                  
	                    <div class="form-row">
	                    	<label for="id">
	                    		아이디 :
	                    	</label>
	                    	<div class="form-holder">
	                    		<input type="text" class="form-control" style = "color : black" id = "id">
	                    	</div>
	                    </div>	
	                    <div class="form-row">
	                    	<label for="phone">
	                    		전화번호 :
	                    	</label>
	                    	<div class="form-holder">
	                    		<input type="text" class="form-control" style = "color : black" id = "tel">
	                    	</div>
	                    </div>	
	                   <div class="field">
									<label for="address">주소</label> 
									<p></p>	
									<input type="text" id="sample6_postcode" placeholder="우편번호" readonly style = "color : black"  >
									<input type="text" id="sample6_address" placeholder="주소" readonly style = "color : black"> 
									<input type="text" id="sample6_detailAddress" placeholder="상세주소" style = "color : black">
									<div class="addr__container">
										<input type="button" class="daumBtn"
											value="우편번호 찾기"
											onclick="openDaumPostCode()">
									</div>
						</div>
	                </section>
            	
            		<!-- SECTION 1 -->
	                <h4></h4>
	                <section>
	                    <div class="form-row" style="margin-bottom: 26px;">
	                    	<label for="Subscribe_path">
	                    		가입경로 :
	                    	</label>
	                    	<div class="form-holder">
	                    		<select name="Subpath" id="path" class="form-control">
									<option value="Internet" class="option">인터넷</option>
									<option value="Advertise" class="option">광고</option>
									<option value="SNS" class="option">SNS</option>
									<option value="Recommend Acquaintance"class="option">지인 추천</option>
								</select>
								
	                    	</div>
	                    </div>	
	                   
	                    
							<label for = "payment">
								결제수단 :
							</label>
								<div class = "form-holder">
									<select name = "payment1" id = "pay" class = "form-control">
										<option id = "c"  style = "color : grey">신용카드</option>
										<option id = "n"  style = "color : grey">네이버 PAY</option>
										<option id = "t"  style = "color : grey">계좌이체</option>
									</select>							
								</div>
					 </section>
	             </div>
            </div>
        
        
        <div class="submit" style = "margin-left: 600px">
        <%if(userInfo != null) {%>
            <form action="" method = "post">
            	<div class="form-header">
            		<a href="servicesuccess.jsp">Post-Guard 서비스 신청</a>
            		<h3>서비스 신청</h3>
            	</div>
            	</form>
        <%} 
        else { %>
            	<div class="login" style =  "margin-left: 280px">
					<div class="image-holder">
						<a href = "login.jsp">로그인을 해주세요</a>
					</div>
				</div>
            <%} %>
		</div>
	
		
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
  
</html>
