const progress = document.querySelectorAll(".progress");
const proBtn = document.querySelectorAll(".proBtn");
// 버튼 DOM : 이벤트 click -> 백엔드에 통신

const handleproXhr = (seq, progress) => {
  let xhr = new XMLHttpRequest();

  const userObj = {
    seq: seq,
    progress: progress,
  };

  xhr.open("post", "UpdateASProgressCon");
  xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");

  xhr.send(JSON.stringify(userObj)); // 문자열로 보내기

  xhr.onreadystatechange = function () {
    if (xhr.readyState === XMLHttpRequest.DONE) {
      //요청성공
      if (xhr.status === 200) {
        //응답성공
        console.log(xhr.responseText); // 백엔드에 요청을 보낸 후 응답을 성공하면 JoinSuccess 문자열을 받게 될 것임
        if (xhr.responseText === "updateSuccess") {
          location.href = "as.jsp";
        } else {
          console.log("Fail");
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

for (let i = 0; i < progress.length; i++) {
  proBtn[i].addEventListener("click", (e) => {
    e.preventDefault();
    handleproXhr(e.target.id, progress[i].value)
  });
}
