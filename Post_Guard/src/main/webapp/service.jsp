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
    <link rel="stylesheet" href="assets/css/service.css" />
    <title>POST-GUARD | 서비스신청</title>
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
				</ul>
			</nav>
		</div>
	</section>
			<div class="serviceWrapper">
            		 <div class="service__container">
            		 	<div class="joinpath">
            		 		<div class="joinpath--h">
            		 		<span>가입 경로</span>
            		 		</div>
            		 		<div class="joinpath__inner">
	            		 		<div class="joinpath--internet">
	            		 			<p>인터넷</p>
	            		 			<input type="radio" name="joinpathradio" value=" "/>
	            		 		</div>
	            		 		<div class="joinpath--ad">
	            		 			<p>광고</p>
	            		 			<input type="radio" name="joinpathradio" value=" "/>       		 			
	            		 		</div>
	            		 		<div class="joinpath--friends">
	            		 			<p>지인추천</p>
	            		 			<input type="radio" name="joinpathradio" value=" "/>     		 			
	            		 		</div>
	            		 		<div class="joinpath--SNS">
	            		 			<p>SNS</p>
	            		 			<input type="radio" name="joinpathradio" value=" "/>     		 			
	            		 		</div>
            		 		</div>
            		 	</div>
            		 	<hr class="service__hr">
            		 	<div class="payment">
            		 		<div class="payment--h">
            		 			<span>지불수단</span>
            		 		</div>
            		 		<div class="payment__inner">
	            		 		<div class="payment--card">
	            		 			<p>신용카드</p>
	            		 			<input type="radio" name="paymentradio" value=" "/>
	            		 		</div>
	            		 		<div class="payment--account">
	            		 			<p>계좌이체</p>
	            		 			<input type="radio" name="paymentradio" value=" "/>       		 			
	            		 		</div>
	            		 		<div class="payment--noaccount">
	            		 			<p>무통장입금</p>
	            		 			<input type="radio" name="paymentradio" value=" "/>     		 			
	            		 		</div>
	            		 		<div class="payment--phone">
	            		 			<p>휴대폰소액결제</p>
	            		 			<input type="radio" name="paymentradio" value=" "/>     		 			
	            		 		</div>	            		 		
            		 		</div>            		 		
            		 	</div>
            		 	<hr class="service__hr">
            		 	<div class="user">
            		 		<div class="user--h">
            		 			<span>신청자 정보</span>
            		 		</div>
            		 		<div class="user__inner">
			                    <div class="form-row">
			                    	<label for="id">
			                    		아이디
			                    	</label>
			                    	<div>
			                    		<input type="text" id="id" class="service--idinput">
			                    	</div>
			                    </div>	
			                    <div class="form-row">
			                    	<label for="phone">
			                    		전화번호
			                    	</label>
			                    	<div class="form-holder">
			                    		<input type="text" id = "tel" class="service--phoneinput">
			                    	</div>
			                    </div>	
			                   <div class="field">
											<label for="address">주소</label> 
											<input type="text" id="sample6_postcode" placeholder="우편번호" readonly class="service--addinput1">
											<input type="text" id="sample6_address" placeholder="주소" readonly class="service--addinput2"> 
											<input type="text" id="sample6_detailAddress" placeholder="상세주소" class="service--addinput3">
											<div class="addr__container">
												<input type="button" class="daumBtn"
													value="우편번호 찾기"
													onclick="openDaumPostCode()">
											</div>
								</div>            		 		
            		 		</div>
            		 	</div>
            		 	<hr class="service__hr">
            		 	<div class="personalinfo">
            		 		<div class="personal--h">
            		 			<span>개인정보수집 및 이용동의</span>
            		 		</div>
            		 		<div class="personal__inner">
            		 			<p>개인정보 수집 및 이용에 관한 동의사항</p>
            		 			<table class="personal__table table-bordered">
            		 				<thead>
            		 					<tr>
            		 						<th>수집•이용 목적</th>
            		 						<th>수집하는 개인정보의 항목</th>
            		 						<th>개인정보 보유 및 이용기간</th>
            		 					</tr>
            		 				</thead>
            		 				<tbody>
            		 					<tr>
            		 						<td>
            		 							<span>- 서비스 제공 계약 체결 관련 상담</span>
            		 							<br>
            		 							<span>- 서비스 제공 계약 조건 확인을 위한 본인식별 및 실명확인</span>
            		 							<br>
            		 							<span>- 기존 회원 여부 확인</span>
            		 							</td>
            		 						<td>
            		 							<span>E-Mail</span>
            		 							<br>
            		 							<span>연락처</span>
            		 							<br>
            		 							<span>주소</span>
            		 							<br>
            		 							<span>이름</span>
            		 						</td>
            		 						<td rowspan="6">
            		 							<span>상담 완료 후 6개월</span>
            		 						</td>
            		 					</tr>
            		 				</tbody>
            		 			</table>
            		 			<span style="font-size: 16px;">* 위의 개인정보 수집•이용에 대한 동의를 거부하실 수 있습니다. 다만 동의를 거부하는 경우 문의내용에 대한 상담이 정상적으로 진행 될 수 없음을 안내드립니다.</span>
            		 		</div>
            		 	</div>
            		 		<div class="personal__check">
            		 		<input type="checkbox" id="agreeCheck" required/>
            		 		<label for="agreeCheck" class="checkLabel">
            		 			<span>개인정보 수집 및 이용 내용에 동의합니다.*</span>
            		 		</label>      
            		 		</div>     		 	
						<div>
								<div class="submit">
							        <%if(userInfo != null) {%>
							        <form>
										<div class="service--login">
							            	<div class="service__emptybox"></div>
							            	<div class="applyservice">
							            		<a href="#" class="applyserviceBtn">서비스 신청</a>
							            	</div>
										</div>
									</form>
							        <%} 
							        else { %>
							            	<div class="service--login">
							            		<div class="service__emptybox"></div>
												<div class="service--login__inner">
													<a href = "login.jsp">로그인이 필요한 서비스입니다.</a>
												</div>
											</div>
							            <%} %>
								</div>
					 	</div>
	             	 </div>
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
