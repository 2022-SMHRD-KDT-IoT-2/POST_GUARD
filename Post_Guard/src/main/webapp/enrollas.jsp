<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

    <title>Contact Form #4</title>
  </head>
  <body>
  

  <div class="content">
    
    <div class="container">
      <div class="row">
        <div class="col-md-5 mr-auto">
          <h3 class="mb-3">Let's work together</h3>
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Recusandae sequi, ipsa hic alias officia facilis eveniet, neque laborum cumque maxime soluta. Neque atque necessitatibus ipsam sequi soluta magni, iste vero fuga inventore, explicabo totam quis quia nemo possimus cupiditate doloribus?</p>
          <p>Quasi optio numquam pariatur amet laudantium, dicta ullam obcaecati nihil eveniet et aperiam beatae illum vitae in asperiores, a ex. Voluptates accusantium, beatae dolorem natus delectus nostrum, iusto nemo optio quas eum, quis a in reprehenderit totam, sequi distinctio impedit.</p>
          <p>Dolor aliquid, commodi vitae dolorum veniam amet error! Nemo nam quibusdam delectus dolore eveniet officia harum eum sit magnam possimus. Eum optio dolores repellat ea impedit, in unde, rem ipsam rerum autem iusto vero facilis blanditiis explicabo sapiente consequatur provident? <a href="#">info@mywebsite.com</a></p>
          
        </div>

        <div class="col-md-6">
          <div class="box">
            <h3 class="heading">How Can We Help?</h3>
            <form class="mb-5" method="post" id="contactForm" name="contactForm">
              <div class="row">
                
                <div class="col-md-6 form-group">
                  <label for="name" class="col-form-label">작성자 아이디</label>
                  
                  <!--  input -->
                  <input type="text" class="form-control" name="name" id="id" placeholder="Your name">
                </div>
                <div class="col-md-6 form-group">
                  <label for="name" class="col-form-label">Organization</label>
                  <!--  input -->
                  <input type="text" class="form-control" name="organization" id="organization" placeholder="Your organization">
                </div>
              </div>
              <div class="row">
                <div class="col-md-12 form-group">
                  <label for="email" class="col-form-label">글 제목</label>
                  <!--  input -->
                  <input type="text" class="form-control" name="email" id="title" placeholder="Your email address">
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
                  <label for="budget" class="col-form-label">카테고리</label>
                  <!--  select -->
                  <select class="custom-select" id="category">
				    <option value="수거요청">수거 요청</option>
				    <option value="수리요청">수리 요청</option>
<!-- 				    <option value="">$5,000 - $15,000</option>
				    <option value="">$15,000 - $25,000</option> -->
  				  </select>
                </div>
                <div class="col-md-6 form-group">
                  <label for="message" class="col-form-label">Target Lunch</label>
                  <!--  input -->
                  <input type="text" class="form-control" name="date" id="date" placeholder="Example: January 15th">

               
                </div>
              </div>

              <div class="row">
                <div class="col-md-12">
                <!--  input -->
                  <input type="submit" value="Send Message" class="btn btn-block btn-primary rounded-0 py-2 px-4" id="submitBtn">
                  <span class="submitting"></span>
                </div>
              </div>
            </form>

            <div id="form-message-warning mt-4"></div> 
            <div id="form-message-success">
              Your message was sent, thank you!
            </div>
          </div>
        </div>
      </div>
  </div>
    
    

    <script src="young/js/jquery-3.3.1.min.js"></script>
    <script src="young/js/popper.min.js"></script>
    <script src="young/js/bootstrap.min.js"></script>
    <script src="young/js/jquery.validate.min.js"></script>
    <script src="young/js/main.js"></script>
    <script src="young/js/enrollas.js"></script>
  </body>
</html>