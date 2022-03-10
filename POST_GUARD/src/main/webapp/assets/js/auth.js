const editLink = document.querySelector(".editLink");

const handleXhr = (inputPw) => {
  let xhr = new XMLHttpRequest();

  const userObj = {
    pw: inputPw,
  };

  xhr.open("post", "AuthCon");
  xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");

  xhr.send(JSON.stringify(userObj));

  xhr.onreadystatechange = function () {
    if (xhr.readyState === XMLHttpRequest.DONE) {
      //요청성공
      if (xhr.status === 200) {
        //응답성공
        if (xhr.responseText === "authSuccess") {
          location.href = "edit.jsp";
        } else {
          alert("비밀번호를 다시 확인해주세요.");
        }
      } else {
        // 응답 실패
      }
    } else {
      //요청실패
      console.log("request fail");
    }
  };
};

const handleAuth = (e) => {
  e.preventDefault();
  let inputPw = prompt("비밀번호를 입력하세요");
  handleXhr(inputPw);
};

editLink.addEventListener("click", handleAuth);
