const editDoneBtn = document.querySelector(".editdoneBtn");
const password = document.querySelector(".edit_pw");
const username = document.querySelector(".edit_name");
const address = document.querySelector(".edit_addr");
const email = document.querySelector(".edit_email");
const phone = document.querySelector(".edit_phone");

const handleXhr = (username, password, address, email, phone) => {
  let xhr = new XMLHttpRequest();

  const userObj = {
    username: username,
    password: password,
    phone: phone,
    email: email,
    addr: address,
  };

  xhr.open("post", "EditCon");
  xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");

  xhr.send(JSON.stringify(userObj)); // 문자열로 보내기

  xhr.onreadystatechange = function () {
    if (xhr.readyState === XMLHttpRequest.DONE) {
      //요청성공
      if (xhr.status === 200) {
        //응답성공
        if (xhr.responseText === "updateSuccess") {
          location.href = "mypage.jsp";
        } else {
          console.log("updateFail");
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

const handleEdit = (e) => {
  const postCode = document.querySelector("#sample6_postcode");
  const address = document.querySelector("#sample6_address");
  const detailaddress = document.querySelector("#sample6_detailAddress");
  let addr = postCode.value + address.value + detailaddress.value;
  e.preventDefault();
  handleXhr(
    username.value,
    password.value,
    addr,
    email.value,
    phone.value
  );
};

editDoneBtn.addEventListener("click", handleEdit);
