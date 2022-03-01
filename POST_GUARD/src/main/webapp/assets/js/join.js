const username = document.querySelector("#name");
const id = document.querySelector("#id");
const pw = document.querySelector("#pw");
const pwCheck = document.querySelector("#pwcheck");
const pwCheckMessage = document.querySelector("#pwCheckMessageId");
const pwInputMessage = document.querySelector("#pwInputMessageId");
const idCheckMessage = document.querySelector("#idCheckMessageId");
const idEmptyMessage = document.querySelector("#idEmptyMessageId");
const email = document.querySelector("#email");
const phone = document.querySelector("#tel");
const addr = document.querySelector("#address");
const joinBtn = document.querySelector(".join");

// ✓

let idPass = false; // 아이디 중복 여부를 판단하기 위한 변수
let pwPass = false; // 비밀번호 확인을 판단하는 변수

// 비동기 통신
const handleXhr = (id, pw, username, phone, email, addr) => {
  let xhr = new XMLHttpRequest();

  const userObj = {
    id: id,
    pw: pw,
    username: username,
    phone: phone,
    email: email,
    addr: addr,
  };

  xhr.open("post", "JoinCon");
  xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");

  xhr.send(JSON.stringify(userObj)); // 문자열로 보내기

  xhr.onreadystatechange = function () {
    if (xhr.readyState === XMLHttpRequest.DONE) {
      //요청성공
      if (xhr.status === 200) {
        //응답성공
        console.log(xhr.responseText); // 백엔드에 요청을 보낸 후 응답을 성공하면 JoinSuccess 문자열을 받게 될 것임
        if (xhr.responseText === "joinSuccess") {
          // 회원가입 성공
          idPass = true;
          if (idPass) {
            location.href = "login.jsp";
          }
        } else {
          // 회원가입 실패
          // JoinCon 에서 JoinSuccess가 아닌 다른 응답을 할 때 실행됌
          idPass = false;
          joinFail();
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

const joinFail = () => {
  if (id.value !== "") {
    if (!idPass) {
      idCheckMessage.classList.remove("hide");
    }
    if (!pwPass) {
      pwCheckMessage.classList.remove("hide");
    }
  }
};

const passwordConfirm = () => {
  // 비밀번호 확인을 판단하는 함수
  if (pw.value === pwCheck.value) {
    pwPass = true;
  } else {
    pwPass = false;
  }
};

const idEmptyCheck = (e) => {
  let {
    target: { value },
  } = e;

  if (value === "") {
    idEmptyMessage.classList.remove("hide");
  } else {
    idEmptyMessage.classList.add("hide");
  }
};

const passwordDetect = (e) => {
  // 비밀번호또한 감지하여 비밀번호 확인 칸의 메시지를 변경하기 위한 함수입니다.
  let {
    target: { value },
  } = e;

  if (value !== "") {
    if (value === pwCheck.value) {
      pwInputMessage.innerText = "✓ 비밀번호가 일치합니다.";
      pwInputMessage.style.color = "green";
    } else {
      pwInputMessage.innerText = "× 확인을 위해 비밀번호를 다시 입력해주세요.";
      pwInputMessage.style.color = "red";
    }
  }
};

const pwInputCheck = (e) => {
  let {
    target: { value },
  } = e;

  if (value === "") {
    pwInputMessage.innerText = "× 확인을 위해 비밀번호를 다시 입력해주세요.";
    pwInputMessage.classList.remove("hide");
    pwInputMessage.style.color = "red";
  } else if (value === pw.value) {
    pwInputMessage.innerText = "✓ 비밀번호가 일치합니다.";
    pwInputMessage.style.color = "green";
  } else {
    pwInputMessage.innerText = "× 확인을 위해 비밀번호를 다시 입력해주세요.";
    pwInputMessage.style.color = "red";
  }
};

const handleJoin = (e) => {
  e.preventDefault();
  passwordConfirm();
  if (pwPass) {
    handleXhr(
      id.value,
      pw.value,
      username.value,
      phone.value,
      email.value,
      addr.value
    );
  }
};

joinBtn.addEventListener("click", handleJoin);
id.addEventListener("focus", idEmptyCheck);
id.addEventListener("change", idEmptyCheck);
pw.addEventListener("input", passwordDetect);
pwCheck.addEventListener("focus", pwInputCheck);
pwCheck.addEventListener("input", pwInputCheck);
