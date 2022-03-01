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
    <title>POST-GUARD | 로그인</title>
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
              <form method="post" action="index.jsp">
                <div class="fields">
                  <div class="field">
                    <h2>로그인</h2>
                  </div>
                  <div class="field">
                    <label for="id">아이디</label>
                    <input type="text" name="mem_id" id="id" required />
                  </div>
                  <div class="field">
                    <label for="pw">비밀번호</label>
                    <input type="password" name="mem_pw" id="pw" required />
                  </div>
                </div>
                <div class="loginAlertBox">
                	<span id = "loginAlertId"class="loginAlert hide">아이디 또는 비밀번호가 틀렸습니다.</span>
                </div>
                <ul class="actions">
                  <li class="loginbtn">
                    <button class="login">로그인</button>
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
    	
    	// 비동기 통신
    	const handleXhr = (id, pw) => {
			let xhr = new XMLHttpRequest();
			
			const userObj = {"id" : id, "pw" : pw};

		    xhr.open('post', 'LoginCon');
		      xhr.setRequestHeader('Content-Type', 'application/json;charset=UTF-8');
		      
		      xhr.send(JSON.stringify(userObj)); // 문자열로 보내기
		      
		      xhr.onreadystatechange = function(){
		         if(xhr.readyState===XMLHttpRequest.DONE){  //요청성공
		            if(xhr.status===200){ //응답성공
		               console.log(xhr.responseText)
		            	if(xhr.responseText === "true") {
		            		// 로그인 성공
		            		location.herf = "index.jsp";
		            	} else {
		            		// 로그인 실패
		            		AlertMessage.classList.remove('hide');
		            	}
		            
		            }else{
		               console.log("응답실패");
		            }
		         }else{  //요청실패
		            console.log("요청실패");
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
