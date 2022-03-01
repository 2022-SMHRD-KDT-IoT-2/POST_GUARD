<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, user-scalable=no"
    />
    <link rel="stylesheet" href="assets/css/main.css" />
    <title>POST-GUARD | 로그인</title>
  </head>
  <body>
    <section id="sidebar">
      <div class="inner">
        <nav>
          <ul>
            <li>
              <a href="index.jsp"
                ><img class="mainlogo" src="./images/logo.png"
              /></a>
            </li>
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
          <div class="login__container">
            <section>
              <form method="post" action="#">
                <div class="fields">
                  <div class="field">
                    <h2>로그인</h2>
                  </div>
                  <div class="field">
                    <label for="id">아이디</label>
                    <input type="text" name="id" id="id" required />
                  </div>
                  <div class="field">
                    <label for="pw">비밀번호</label>
                    <input type="password" name="pw" id="pw" required />
                  </div>
                </div>
                <ul class="actions">
                  <li class="loginbtn">
                    <!-- 자바스크립트로 페이지 이동할 예정~! -->
                    <button>로그인</button>
                  </li>
                </ul>
              </form>
            </section>
          </div>
        </div>
      </section>
    </div>
  </body>
</html>
