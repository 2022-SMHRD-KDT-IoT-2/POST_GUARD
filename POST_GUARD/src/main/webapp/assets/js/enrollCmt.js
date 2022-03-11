const submitBtn = document.querySelector(".eorollCommentBtn");
const textarea = document.querySelector(".comment_enroll");
const as_seq = document.querySelector(".as__seq").textContent;

const handleXMLHTTPRequest = (comment, as_seq) => {
  let xhr = new XMLHttpRequest();

  const Obj = {
    as_seq: as_seq,
    comment: comment,
  };

  xhr.open("post", "ASReplyCon");
  xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");

  xhr.send(JSON.stringify(Obj));

  xhr.onreadystatechange = function () {
    if (xhr.readyState === XMLHttpRequest.DONE) {
      //요청성공
      if (xhr.status === 200) {
        if (xhr.responseText === "CommentEnrollSuccess") {
          location.reload();
        } else {
          console.log("댓글 등록 오류");
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

const handleSubmit = () => {
  if (textarea.value !== "") {
    handleXMLHTTPRequest(textarea.value, as_seq);
  } else {
    alert("댓글을 입력해주세요.");
  }
};

submitBtn.addEventListener("click", handleSubmit);
