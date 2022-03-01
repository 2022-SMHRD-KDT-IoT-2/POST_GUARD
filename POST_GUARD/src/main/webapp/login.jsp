<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="com.dao.MemberDAO" %>
<%@ page import="com.vo.MemberVO" %>

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
  <%
  	MemberDAO dao = new MemberDAO();
  %>
  
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
              <form method="post" action="index.jsp">
                <div class="fields">
                  <div class="field">
                    <h2>�α���</h2>
                  </div>
                  <div class="field">
                    <label for="id">���̵�</label>
                    <input type="text" name="mem_id" id="id" required />
                  </div>
                  <div class="field">
                    <label for="pw">��й�ȣ</label>
                    <input type="password" name="mem_pw" id="pw" required />
                  </div>
                </div>
                <div class="loginAlertBox">
                	<span id = "loginAlertId"class="loginAlert hide">���̵� �Ǵ� ��й�ȣ�� Ʋ�Ƚ��ϴ�.</span>
                </div>
                <ul class="actions">
                  <li class="loginbtn">
                    <button class="login">�α���</button>
                  </li>
                </ul>
              </form>
            </section>
          </div>
        </div>
      </section>
    </div>
    <script>
    	const id = document.querySelector("#id");
    	const pw = document.querySelector("#pw");
    	const loginBtn = document.querySelector(".login");
    	const AlertMessage = document.querySelector("#loginAlertId");
    	
    	// �񵿱� ���
    	const handleXhr = (id, pw) => {
			let xhr = new XMLHttpRequest();
			
			const userObj = {"id" : id, "pw" : pw};

		    xhr.open('post', 'LoginCon');
		      xhr.setRequestHeader('Content-Type', 'application/json;charset=UTF-8');
		      
		      xhr.send(JSON.stringify(userObj)); // ���ڿ��� ������
		      
		      xhr.onreadystatechange = function(){
		         if(xhr.readyState===XMLHttpRequest.DONE){  //��û����
		            if(xhr.status===200){ //���伺��
		               console.log(xhr.responseText)
		            	if(xhr.responseText === "true") {
		            		// �α��� ����
		            		location.herf = "index.jsp";
		            	} else {
		            		// �α��� ����
		            		AlertMessage.classList.remove('hide');
		            	}
		            
		            }else{
		               console.log("�������");
		            }
		         }else{  //��û����
		            console.log("��û����");
		         }
		      }
    	}
    	
    	const handleLogin = (e) => {
    		e.preventDefault();
    		handleXhr(id.value, pw.value);
    	};

    	loginBtn.addEventListener("click", handleLogin);
</script>
  </body>
</html>
