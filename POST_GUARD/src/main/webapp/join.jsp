<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, user-scalable=no"
    />
    <link rel="stylesheet" href="assets/css/main.css" />
    <title>POST-GUARD | 회원가입</title>
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
          <div class="join__container">
            <section>
              <form method="post" action="#">
                <div class="fields">
                  <div class="field">
                    <h2>회원가입</h2>
                  </div>
                  <div class="field">
                    <label for="name">이름</label>
                    <input type="text" name="name" id="name" required />
                  </div>
                  <div class="field">
                    <label for="id">아이디</label>
                    <input type="text" name="id" id="id" required />
                  </div>
                  <div class="field">
                    <label for="pw">비밀번호</label>
                    <input type="password" name="pw" id="pw" required />
                  </div>
                  <div class="field">
                    <label for="pwcheck">비밀번호 확인</label>
                    <input
                      type="password"
                      name="pwcheck"
                      id="pwcheck"
                      required
                    />
                  </div>
                  <div class="field">
                    <label for="email">메일 주소</label>
                    <input type="email" name="email" id="email" required />
                  </div>
                  <div class="field">
                    <label for="tel">전화번호</label>
                    <input type="text" name="tel" id="tel" required />
                  </div>
                  <div class="field">
                    <label for="address">주소</label>
                    <input type="text" name="address" id="address" required />
                    <div class="addr__container">
                      <input
                        type="button"
                        class="button addr addr--search"
                        value="주소검색"
                      />
                    </div>
                  </div>
                </div>
                <ul class="actions">
                  <li class="joinbtn">
                    <!-- 자바스크립트로 페이지 이동할 예정~! -->
                    <button>회원가입</button>
                  </li>
                </ul>
              </form>
            </section>
          </div>
        </div>
      </section>
    </div>
    <script src="assets/js/join.js"></script>
  </body>
</html>

