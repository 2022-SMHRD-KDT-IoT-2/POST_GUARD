const as_title = document.querySelector("#title");
const as_content = document.querySelector("#content");
const as_category = document.getElementsByName("asselect");
const submitBtn = document.querySelector("#submitBtn");
let categoryValue; 

const handleXMLHTTPRequest = (as_title, as_content, as_category) => {
  let xhr = new XMLHttpRequest();

  const Obj = {
    as_title: as_title,
    as_content: as_content,
    as_category: as_category,
  };

  xhr.open("post", "ASListCon");
  xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");

  xhr.send(JSON.stringify(Obj));

  xhr.onreadystatechange = function () {
    if (xhr.readyState === XMLHttpRequest.DONE) {
      console.log("request");
      //요청성공
      if (xhr.status === 200) {
        if (xhr.responseText === "success") {
          alert("등록이 완료되었습니다. ");
           location.href = "as.jsp"
        } else {
          alert("등록을 실패했습니다. ");
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

const handleSubmit = (e) => {
  e.preventDefault();
  handleXMLHTTPRequest(as_title.value, as_content.value, categoryValue);
};

const getCategoryValue = (e) => {
	categoryValue = e.target.value;
	console.log(categoryValue);
}

submitBtn.addEventListener("click", handleSubmit);

function addEventListenerByClass(className, event, fn) {
    var list = document.getElementsByClassName(className);
    for (var i = 0, len = list.length; i < len; i++) {
        list[i].addEventListener(event, fn, false);
    }
}

addEventListenerByClass('asselcet', 'input', getCategoryValue); 
