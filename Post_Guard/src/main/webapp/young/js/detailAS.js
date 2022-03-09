const as_title = document.querySelector("#title");
const as_content = document.querySelector("#content");
const as_category = document.querySelector("#category");
const mem_id = document.querySelector("#mem_id");
const as_date = document.querySelector("#as_date");

const submitBtn = document.querySelector("#submitBtn");

const handleXMLHTTPRequest = (as_title, as_content, as_category, mem_id, as_date) => {
  let xhr = new XMLHttpRequest();

  const Obj = {
    as_title: as_title,
    as_content: as_content,
    as_category: as_category,
	mem_id=mem_id, 
	as_date=as_date
  };

  xhr.open("post", "ASDetailCon");
  xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");

  xhr.send(JSON.stringify(Obj));

  xhr.onreadystatechange = function () {
    if (xhr.readyState === XMLHttpRequest.DONE) {
      console.log("request");
      //요청성공
    } else {
      //요청실패
      console.log("request fail");
    }
  };
};

const handleSubmit = (e) => {
  e.preventDefault();
  handleXMLHTTPRequest(as_title.value, as_content.value, as_category.value, mem_id.value, as_date.value);
};

submitBtn.addEventListener("click", handleSubmit);
