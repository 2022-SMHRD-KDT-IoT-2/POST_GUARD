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

    <title>AS 게시글 등록 페이지</title>
  </head>
  <body>
  <% MemberVO vo = (MemberVO)session.getAttribute("userInfo");%>
  

<!--   <div class="content"> -->
    
    <div class="container">
      <div class="row">
        <div class="col-md-5 mr-auto">
          <h3 class="mb-3">AS 요청</h3>
          
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
				    <option value="수거요청">수리 요청</option>
<!-- 				    <option value="">$5,000 - $15,000</option>
				    <option value="">$15,000 - $25,000</option> -->
  				  </select>
<!--   				  <label for="date" class="col-form-label">방문 요청 날짜</label>
  				  <input type = "date" class="date" name ="date"/> -->
                </div>
              
<!--                 <div class="col-md-6 form-group">
                  <label for="name" class="col-form-label">Organization</label>
                   input
                  <input type="text" class="form-control" name="organization" id="organization" placeholder="Your organization">
                </div> -->
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
                  <input type="text" class="form-control" name="name" id="id" value="<%=vo.getMem_id()%>" disabled>
                </div>

<!--                 <div class="col-md-6 form-group">
                  <label for="message" class="col-form-label">Target Lunch</label>
                   input
                  <input type="text" class="form-control" name="date" id="date" placeholder="Example: January 15th">

               
                </div> -->
              </div>

              <div class="row">
                <div class="col-md-12">
                <!--  input -->
                  <input type="submit" value="AS신청서 접수하기" class="btn btn-block btn-primary rounded-0 py-2 px-4" id="submitBtn">
                  <span class="submitting"></span>
                </div>
              </div>
            </form>

            <div id="form-message-warning mt-4"></div> 
            <div id="form-message-success">
              AS신청이 완료되었습니다. 감사합니다. 
            </div>
          </div>
        </div>
      </div>
  </div>
<!--     </div> -->
    

    <script src="young/js/jquery-3.3.1.min.js"></script>
    <script src="young/js/popper.min.js"></script>
    <script src="young/js/bootstrap.min.js"></script>
    <script src="young/js/jquery.validate.min.js"></script>
    <script src="young/js/main.js"></script>
    <script src="young/js/enrollas.js"></script>
  </body>
</html>