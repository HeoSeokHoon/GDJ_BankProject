const password = document.querySelector("#password");
const sp = document.querySelector("#sp");
const sp2 = document.querySelector("#sp2");
const check = document.querySelector("#passwordCheck");
const signUp = document.querySelector("#signUp");
const sp3 = document.querySelector("#sp3");

let flag = false;
let flagCheck = false;
let idCheck = false;

$("#userName").blur(function(){
  // fetch("./idCheck?userName="+$("#userName").val(),{
  //   method:"GET"
  // })
  // .then(response=>response.text())
  // .then(response=>{
  //   if(response.trim()=='0'){
  //     sp3.innerHTML="중복된 아이디 입니다";
  //     idCheck=false;
  //   }else{
  //     sp3.innerHTML="가입가능한 아이디 입니다";
  //     idCheck=true;
  //   }
  // })

  // $.get("./idCheck?userName="+$("#userName").val(),function(response){
  //   console.log(response);
  // })
  let userName = $("#userName").val()
  $.ajax({
    url:"./idCheck",
    method:"GET",
    data:{
      userName:userName
    },
    success:function(response){
      if(response.trim()=='0'){
            sp3.innerHTML="중복된 아이디 입니다";
          }else{
            sp3.innerHTML="가입가능한 아이디 입니다";
          }
    },
    error:function(){
      alert("ID에 검증 실패");
    }
  });
});

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
    $("#frm").submit();
  }else{
    signUp.setAttribute("type","button");
    alert("비밀번호를 확인 하세요");
  }
});