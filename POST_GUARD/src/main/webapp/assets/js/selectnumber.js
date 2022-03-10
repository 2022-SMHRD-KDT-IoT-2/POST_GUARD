const receiptBtns = document.querySelectorAll(".receiptBtn"); // NodeList
let isConfirm;

const requestXhr = (seq) => {
  let xhr = new XMLHttpRequest();

  const Obj = {
    seq: seq,
  };

  xhr.open("post", "DeleteTrackingNumCon");
  xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");

  xhr.send(JSON.stringify(Obj));

  xhr.onreadystatechange = function () {
    if (xhr.readyState === XMLHttpRequest.DONE) {
      //요청성공
      if (xhr.status === 200) {
        //응답성공
        if (xhr.responseText === "NumberEnrollSuccess") {
          alert("수령 완료!");
          location.reload();
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

const handleReceipt = (e) => {
  isConfirm = confirm("수령 완료 하시겠습니까?");
  e.preventDefault();
  let seq = e.target.id;
  if (isConfirm) {
    requestXhr(seq);
  }
};

for (let i = 0; i < receiptBtns.length; i++) {
  receiptBtns[i].addEventListener("click", handleReceipt);
}
