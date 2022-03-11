<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.vo.MemberVO" %>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->

    <!-- Style -->
<link rel="stylesheet" href="young/css/style.css"/>
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/button.css" />
<link rel="stylesheet" href="assets/css/sidebar.css" />
<link type="text/css" rel="stylesheet" href="./plugin/fontawesome-free-6.0.0-web/css/all.min.css">
   
    <title>POST-GUARD | AS 게시글 등록</title>
  </head>
  <body>
  
  <% MemberVO userInfo = (MemberVO)session.getAttribute("userInfo");%>
  
	<!-- 네비게이터 -->
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
	

	<!-- 접수신청서 -->
	<form action ="asrequire.jsp">
		<div class="ASWrapper">
			<div class="ASContainer">
				<div class="aspath">
					<div class="aspath_">
               		<div class="enrollas">
               		<p>AS신청서를 접수해주세요.</p>
               		</div>
               		
                  <!--  select category -->
		<div class="category__container">
                <div class="title_category">
				  <span style="white-space: nowrap;">접수 구분</span>
				</div>
				<div class="as_select_category">
				  <div class="select_fix">
				     <p>수리 요청</p>
				     <input type="radio" name ="asselect" class="asselcet" value="수리요청"/>
  				  </div>
  				  <div class="select_return">  
  				  <p>수거 요청</p>
  				  <input type="radio" name="asselect" class="asselcet" value="수거요청" />
  				</div>
  				</div>
  			</div>
  		</div>
  			<hr>

                  <!--  title -->
				<div class = "title_title">
				  <span>접수 제목</span>
				</div>
				<div class="as_input_title">
                  <input type="text" class="as_title" id="title">
				</div>

                  <!--  content -->
				<div class="as_content">
				<div class="title_content">
				  <span>접수 내용</span>
				  </div>
				  <div class="as_input_content"> 
                  <textarea style="resize:none; width:685px; height:100px; overflow:hidden;" 
                  class="as_content_textarea" id="content"></textarea>
                  <div class="sub_">
                  <table class="sub__">
                  <thead>
                  <tr>
                  <td class="as__comment"> 
                  <span> * 문의 내용을 구체적으로 작성해 주세요. 정확하고 빠른 답변에 도움이 됩니다. </span>
                  <br>
                  <span> * 주민등록번호를 포함한 고객님의 소중한 개인정보는 사이트에 노출되지 않으나 꼭 필요한 경우가 아닌 경우 기재를 삼가시길 바랍니다.</span>
                  </td>
				  </tr>
				  </thead>
				  </table>
				  </div>
				  </div>
				  <hr>
				</div>
				
				
				<!-- 답변알림 -->
			<div class="as_arlrm_select">
				<div class="title_arlam">
					<span>답변 알림</span>
					  <div class="as_select_email">
					   <input type="text" class="emailInfoInput" name="userInfoEmail" value="<%=userInfo.getMem_email() %>" disabled>
					   <input type="text" class="phoneInfoInput" name="userInfoPhone" value="<%=userInfo.getMem_phone() %>" disabled>				   
				      </div>
				   	<div class="as_radio_container">
					   <div class="select_email">
					     <input type="radio" name = "selectarlam" value="email"/>			
					     <p>이메일로 알람 받기</p>
					   </div>
					  <div class="select_phone">
						   <input type="radio" name = "selectarlam" value="phone"/>
						   <p>SMS로 알람 받기</p>
					  </div>
				   </div>				   
				  </div>
			</div>
				  <hr>

                <!--  submit-->
                <div class="submit">
                  <input type="button" id="submitBtn" value="AS접수신청" />
                </div>
					</div>
				</div>
			</div>
	</form>

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
		
	<script src="young/js/jquery-3.3.1.min.js"></script>
    <script src="young/js/popper.min.js"></script>
    <script src="young/js/bootstrap.min.js"></script>
    <script src="young/js/jquery.validate.min.js"></script>
    <script src="young/js/main.js"></script>
    <script src="young/js/enrollas.js"></script>
  </body>
</html>