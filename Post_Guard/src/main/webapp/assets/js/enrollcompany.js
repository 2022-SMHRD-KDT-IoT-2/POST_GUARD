const companyName = document.querySelector(".companyName");
const companyAddr = document.querySelector(".companyAddr");
const companyTel = document.querySelector(".companyTel");
const companyCEO = document.querySelector(".companyCEO");
const companyPage = document.querySelector(".companyPage");

const enrollBtn = document.querySelector(".enrollBtn");

const handleXhr = (
  companyName,
  companyAddr,
  companyTel,
  companyCEO,
  companyPage
) => {
  let xhr = new XMLHttpRequest();

  const Obj = {
    companyName: companyName,
    companyAddr: companyAddr,
    companyTel: companyTel,
    companyCEO: companyCEO,
    companyPage: companyPage,
  };

  xhr.open("post", "CompanyCon");
  xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");

  xhr.send(JSON.stringify(Obj));

  xhr.onreadystatechange = function () {
    if (xhr.readyState === XMLHttpRequest.DONE) {
      //요청성공
      if (xhr.status === 200) {
        //응답성공
        if (xhr.responseText === "EnrollSuccess") {
          alert("등록이 완료되었습니다!");
          companyName.value = "";
          companyAddr.value = "";
          companyTel.value = "";
          companyCEO.value = "";
          companyPage.value = "";
        } else if (xhr.responseText === "AccessDeny") {
          alert("당신은 관리자가 아닙니다.");
        } else {
          alert("등록에 실패하였습니다.");
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

const handleEnroll = (e) => {
  e.preventDefault();
  handleXhr(
    companyName.value,
    companyAddr.value,
    companyTel.value,
    companyCEO.value,
    companyPage.value
  );
};

enrollBtn.addEventListener("click", handleEnroll);
