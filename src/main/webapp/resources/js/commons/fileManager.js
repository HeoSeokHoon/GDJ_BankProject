const fileAdd = document.querySelector("#fileAdd");
const filelist = document.querySelector("#filelist");
const del = document.querySelector(".del");

//event 위임
filelist.addEventListener("click",(e)=>{
  if(e.target.classList.contains("del")){
    //e.target.parentNode.remove();
    let id = e.target.getAttribute("data-file-id");
    document.getElementById(id).remove();
  };
});

let idx=0;

fileAdd.addEventListener("click",function(){
  idx++;
  const fileSize = document.querySelector("#filelist").children.length;
  if(fileSize == 5){
    alert("파일은 5개까지 추가 가능합니다");
    return;
  }
  let div = document.createElement("div");
    let a = document.createAttribute("class");
    a.value = "input-group mb-1";
    div.setAttributeNode(a);

    a = document.createAttribute("id");
    a.value="file"+idx;

    div.setAttributeNode(a);
  
    let input = document.createElement("input");
    a = document.createAttribute("class");
    let b = document.createAttribute("type");
    let c = document.createAttribute("name");
    a.value = "form-control";
    b.value = "file";
    c.value = "attachs";
    input.setAttributeNode(a);
    input.setAttributeNode(b);
    input.setAttributeNode(c);
  
    let span = document.createElement("span");
    let d = document.createAttribute("data-file-id");
    let e = document.createTextNode("X");
    a = document.createAttribute("class");
    a.value = "input-group-text btn btn-warning del";
    d.value = "file"+idx;
    span.setAttributeNode(d);
    span.setAttributeNode(a);
    span.appendChild(e);
  
    filelist.appendChild(div);
    div.appendChild(input);
    div.appendChild(span);
});



