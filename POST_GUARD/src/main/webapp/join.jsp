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
    <title>POST-GUARD | ȸ������</title>
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
          <div class="join__container">
            <section>
              <form method="post" action="#">
                <div class="fields">
                  <div class="field">
                    <h2>ȸ������</h2>
                  </div>
                  <div class="field">
                    <label for="name">�̸�</label>
                    <input type="text" name="name" id="name" required />
                  </div>
                  <div class="field">
                    <label for="id">���̵�</label>
                    <input type="text" name="id" id="id" required />
                  </div>
                  <div class="field">
                    <label for="pw">��й�ȣ</label>
                    <input type="password" name="pw" id="pw" required />
                  </div>
                  <div class="field">
                    <label for="pwcheck">��й�ȣ Ȯ��</label>
                    <input
                      type="password"
                      name="pwcheck"
                      id="pwcheck"
                      required
                    />
                  </div>
                  <div class="field">
                    <label for="email">���� �ּ�</label>
                    <input type="email" name="email" id="email" required />
                  </div>
                  <div class="field">
                    <label for="tel">��ȭ��ȣ</label>
                    <input type="text" name="tel" id="tel" required />
                  </div>
                  <div class="field">
                    <label for="address">�ּ�</label>
                    <input type="text" name="address" id="address" required />
                    <div class="addr__container">
                      <input
                        type="button"
                        class="button addr addr--search"
                        value="�ּҰ˻�"
                      />
                    </div>
                  </div>
                </div>
                <ul class="actions">
                  <li class="joinbtn">
                    <!-- �ڹٽ�ũ��Ʈ�� ������ �̵��� ����~! -->
                    <button>ȸ������</button>
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

