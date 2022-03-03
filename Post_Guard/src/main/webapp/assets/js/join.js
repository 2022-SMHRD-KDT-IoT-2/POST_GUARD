const username = document.querySelector("#name");
const id = document.querySelector("#id");
const pw = document.querySelector("#pw");
const pwCheck = document.querySelector("#pwcheck");
const pwCheckMessage = document.querySelector("#pwCheckMessageId");
const pwInputMessage = document.querySelector("#pwInputMessageId");
const idCheckMessage = document.querySelector("#idCheckMessageId");
const idEmptyMessage = document.querySelector("#idEmptyMessageId");
const nameCheckMessage = document.querySelector("#nameCheckMessageId");
const email = document.querySelector("#email");
const emailCheckMessage = document.querySelector("#emailCheckMessageId");
const phone = document.querySelector("#tel");
const phoneCheckMessage = document.querySelector("#phoneCheckMessageId");
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

const idInputCheck = (e) => {
  let {
    target: { value },
  } = e;

  if (value === "") {
    idEmptyMessage.classList.remove("hide");
    id.style.borderBottom = "1px solid rgba(0, 0, 0, 0.514)";
  } else {
    idEmptyMessage.classList.add("hide");
    id.style.borderBottom = "1px solid green";
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

const emailInputCheck = (e) => {
  let {
    target: { value },
  } = e;

  if (value === "") {
    emailCheckMessage.classList.remove("hide");
    email.style.borderBottom = "1px solid rgba(0, 0, 0, 0.514)";
  } else {
    emailCheckMessage.classList.add("hide");
    email.style.borderBottom = "1px solid green";
  }
};

const nameInputCheck = (e) => {
  let {
    target: { value },
  } = e;

  if (value === "") {
    nameCheckMessage.classList.remove("hide");
    username.style.borderBottom = "1px solid rgba(0, 0, 0, 0.514)";
  } else {
    nameCheckMessage.classList.add("hide");
    username.style.borderBottom = "1px solid green";
  }
};

const phoneInputCheck = (e) => {
  let {
    target: { value },
  } = e;

  if (value === "") {
    phoneCheckMessage.classList.remove("hide");
    phone.style.borderBottom = "1px solid rgba(0, 0, 0, 0.514)";
  } else {
    phoneCheckMessage.classList.add("hide");
    phone.style.borderBottom = "1px solid green";
  }
};

const handleJoin = (e) => {
  // 회원가입 버튼을 눌렀을 때 주소정보들을 가져와 등록함.
  const postCode = document.querySelector("#sample6_postcode");
  const address = document.querySelector("#sample6_address");
  const detailaddress = document.querySelector("#sample6_detailAddress");
  let addr = postCode.value + address.value + detailaddress;
  e.preventDefault();
  passwordConfirm();
  if (pwPass) {
    handleXhr(
      id.value,
      pw.value,
      username.value,
      phone.value,
      email.value,
      addr
    );
  }
};

joinBtn.addEventListener("click", handleJoin);
id.addEventListener("focus", idInputCheck);
id.addEventListener("input", idInputCheck);
username.addEventListener("focus", nameInputCheck);
username.addEventListener("input", nameInputCheck);
pw.addEventListener("input", passwordDetect);
pwCheck.addEventListener("focus", pwInputCheck);
pwCheck.addEventListener("input", pwInputCheck);
email.addEventListener("focus", emailInputCheck);
email.addEventListener("input", emailInputCheck);
phone.addEventListener("focus", phoneInputCheck);
phone.addEventListener("input", phoneInputCheck);
