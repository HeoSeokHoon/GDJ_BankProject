const password = document.querySelector("#password");
const sp = document.querySelector("#sp");
const check = document.querySelector("#passwordCheck");
const signUp = document.querySelector("#signUp");

let flag = false;
let flagCheck = false;

password.addEventListener("change",()=>{
  if(password.value.length < 8){
    sp.innerHTML="비밀번호는 8글자 이상이어야 합니다";
    flag=false;
  }else{
    sp.innerHTML="OK";
    flag=true;
  }
  if(check.value.length > 0){
    if(password.value==check.value){
      sp2.innerHTML="일치한다";
      flagCheck=true;
    }else{
      sp2.innerHTML="일치하지 않는다";
      flagCheck=false;
    }
  }else{
    return;
  }
});

check.addEventListener("keyup",()=>{
  if(password.value==check.value){
    sp2.innerHTML="일치한다";
    flagCheck=true;
  }else{
    sp2.innerHTML="일치하지 않는다";
    flagCheck=false;
  }
});

signUp.addEventListener("click",function(e){
  e.preventDefault;
  if(flag&&flagCheck){
    signUp.setAttribute("type","button");
    alert("회원가입");
  }else{
    signUp.setAttribute("type","button");
    alert("비밀번호를 확인 하세요");
  }
});