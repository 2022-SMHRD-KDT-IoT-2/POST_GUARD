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
    <title>POST-GUARD | �α���</title>
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
                <li><a href="product.jsp">��ǰ �Ұ�</a></li>
                <li><a href="service.jsp">���� ��û</a></li>
                <li><a href="as.jsp">AS ��û</a></li>
                <li><a href="faq.jsp">FAQ</a></li>
              </div>
              <div class="box2">
                <li><a href="join.jsp">ȸ������</a></li>
                <li><a href="login.jsp">�α���</a></li>
              </div>
            </div>

            <!-- <li><a href="#">�ù� ����</a></li>
                <li><a href="#">�� ���� ����</a></li>
                <li><a href="#">�� ���� ����</a></li>
                <li><a href="#">�����</a></li> -->
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
                    <h2>�α���</h2>
                  </div>
                  <div class="field">
                    <label for="id">���̵�</label>
                    <input type="text" name="id" id="id" required />
                  </div>
                  <div class="field">
                    <label for="pw">��й�ȣ</label>
                    <input type="password" name="pw" id="pw" required />
                  </div>
                </div>
                <ul class="actions">
                  <li class="loginbtn">
                    <!-- �ڹٽ�ũ��Ʈ�� ������ �̵��� ����~! -->
                    <button>�α���</button>
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
