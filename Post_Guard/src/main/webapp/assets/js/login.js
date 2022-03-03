const id = document.querySelector("#id");
const pw = document.querySelector("#pw");
const loginBtn = document.querySelector(".login");
const AlertMessage = document.querySelector("#loginAlertId");

// 비동기 통신
const handleXhr = (id, pw) => {
  let xhr = new XMLHttpRequest();
  const userObj = { id: id, pw: pw};

  xhr.open("post", "LoginCon");
  xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");

  xhr.send(JSON.stringify(userObj)); // 문자열로 보내기

  xhr.onreadystatechange = function () {
    if (xhr.readyState === XMLHttpRequest.DONE) {
      //요청성공
      if (xhr.status === 200) {
        //응답성공
        console.log(xhr.responseText);
        if (xhr.responseText === "loginSuccess") {
          // 로그인 성공
          location.href = "index.jsp";
        } else {
          // 로그인 실패
          AlertMessage.classList.remove("hide");
        }
      } else {
        console.log("response fail");
      }
    } else {
      //요청실패
      console.log("request fail");
    }
  };
};

const handleLogin = (e) => {
  e.preventDefault();
  handleXhr(id.value, pw.value);
};

loginBtn.addEventListener("click", handleLogin);
