const deleteMemberBtn = document.querySelector(".deleteMember");
const hiddenId = document.querySelector(".hiddenId").textContent;

const requestDeleteXhr = (id) => {
  let xhr = new XMLHttpRequest();

  const Obj = {
    userId: id,
  };

  xhr.open("post", "DeleteMemberCon");
  xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");

  xhr.send(JSON.stringify(Obj));

  xhr.onreadystatechange = function () {
    if (xhr.readyState === XMLHttpRequest.DONE) {
      //요청성공
      if (xhr.status === 200) {
        //응답성공
        if (xhr.responseText === "DeleteSuccess") {
          alert("그 동안 이용해주셔서 감사합니다.");
          location.href = "index.jsp";
        } else {
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

const handleDelete = (e) => {
  e.preventDefault();
  let isConfirm = confirm("정말 탈퇴하시겠습니까?");
  if (isConfirm) {
    requestDeleteXhr(hiddenId);
  }
};

deleteMemberBtn.addEventListener("click", handleDelete);
