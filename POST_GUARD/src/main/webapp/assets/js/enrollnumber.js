const trackingNumber = document.querySelector(".trackingNumber");

const enrollBtn = document.querySelector(".enrollBtn");

const handleXMLHTTPRequest = (trackingNum) => {
  let xhr = new XMLHttpRequest();

  const Obj = {
    trackingNumber: trackingNum,
  };

  xhr.open("post", "EnrollTrackingNumCon");
  xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");

  xhr.send(JSON.stringify(Obj));

  xhr.onreadystatechange = function () {
    if (xhr.readyState === XMLHttpRequest.DONE) {
      //요청성공
      if (xhr.status === 200) {
        if (xhr.responseText === "NumberEnrollSuccess") {
          alert("운송장 번호 등록이 완료되었습니다!");
          trackingNumber.value = "";
        } else {
          alert("운송장 번호 등록이 실패하였습니다.");
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
  handleXMLHTTPRequest(trackingNumber.value);
};

enrollBtn.addEventListener("click", handleEnroll);
