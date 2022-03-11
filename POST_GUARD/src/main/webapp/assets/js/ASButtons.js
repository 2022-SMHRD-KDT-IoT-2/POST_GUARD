const listBtn = document.querySelector(".listBtn");
const deleteBtn = document.querySelector(".deleteBtn");
const postSeq = document.querySelector(".as__seq").textContent;
const asCategory = document.querySelector(".vo_as_category").textContent;
const asTitle = document.querySelector(".vo_as_title").textContent;
const asContent = document.querySelector(".vo_as_content").textContent;

let isDelete = false;
let isUpdate = false;

const goList = (e) => {
  location.href = "as.jsp";
};

const DeleteRequest = (seq) => {
  let xhr = new XMLHttpRequest();

  const Obj = {
    seq: seq,
  };

  xhr.open("post", "DeleteASCon");
  xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");

  xhr.send(JSON.stringify(Obj));

  xhr.onreadystatechange = function () {
    if (xhr.readyState === XMLHttpRequest.DONE) {
      //요청성공
      if (xhr.status === 200) {
        if (xhr.responseText === "DeleteSuccess") {
          alert("삭제가 완료되었습니다.");
          location.href = "as.jsp";
        } else {
          console.log("글 삭제 오류");
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
  isDelete = confirm("정말 삭제하시겠습니까?");
  if (isDelete) {
    DeleteRequest(postSeq);
  }
};

listBtn.addEventListener("click", goList);
deleteBtn.addEventListener("click", handleDelete);
