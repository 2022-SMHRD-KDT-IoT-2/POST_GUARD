<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.vo.MemberVO" %>
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,700,900&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="young/fonts/icomoon/style.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="young/css/bootstrap.min.css">
    
    <!-- Style -->
    <link rel="stylesheet" href="young/css/style.css">
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/sidebar.css" />

    <title>AS 게시글 등록 페이지</title>
  </head>
  <body>
  <% MemberVO userInfo = (MemberVO)session.getAttribute("userInfo");%>
  
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
	
<!--   <div class="content"> -->
    <div class="container">
      <div class="row">
        <div class="col-md-5 mr-auto">
          <h3 class="mb-3">AS 요청</h3>
          
        </div>
        </div>

        <div class="col-md-6">
          <div class="box">
<!--             <h3 class="heading">AS신청서를 작성해주세요.</h3> -->
            <form class="mb-5" method="post" id="contactForm" name="contactForm">
              <div class="row">
               <div class="col-md-6 form-group">
                  <label for="budget" class="col-form-label">카테고리</label>
                  <!--  select -->
                  <select class="custom-select" id="category">
				    <option value="수리요청">수거 요청</option>
  				  </select>
<!--   				  <label for="date" class="col-form-label">방문 요청 날짜</label>
  				  <input type = "date" class="date" name ="date"/> -->
                </div>

              </div>
              <div class="row">
                <div class="col-md-12 form-group">
                  <label for="astitle" class="col-form-label">글 제목</label>
                  <!--  input -->
                  <input type="text" class="form-control" name="astitle" id="title" placeholder="글 제목을 입력하세요. ">
                </div>
              </div>

              <div class="row">
                <div class="col-md-12 form-group">
                  <label for="message" class="col-form-label">글 내용</label>
                  <!--  textarea -->
                  <textarea class="form-control" name="message" id="content" cols="30" rows="7"></textarea>
                </div>
              </div>
              <div class="row mb-3">
              
                <div class="col-md-6 form-group">
                  <label for="name" class="col-form-label">작성자 아이디</label>
                  
                  <!--  input -->
                  <input type="text" class="form-control" name="name" id="id" value="<%=userInfo.getMem_id()%>" disabled>
                </div>


                </div>
              </div>

              <div class="row">
                <div class="col-md-12">
                <!--  input -->
                  <input type="submit" value="AS신청서 접수하기" class="btn btn-block btn-primary rounded-0 py-2 px-4" id="submitBtn">
                  <span class="submitting"></span>
                </div>
              </div>

            <div id="form-message-warning mt-4"></div> 
            <div id="form-message-success">
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
    

    <script src="young/js/jquery-3.3.1.min.js"></script>
    <script src="young/js/popper.min.js"></script>
    <script src="young/js/bootstrap.min.js"></script>
    <script src="young/js/jquery.validate.min.js"></script>
    <script src="young/js/main.js"></script>
    <script src="young/js/enrollas.js"></script>
  </body>
</html>