//js
// let checkAll = document.querySelector("#checkAll");
// let checks = document.querySelectorAll(".checks");
// checkAll.addEventListener("click",()=>{
//   let v = checkAll.checked
//   	for(let i=0;i<checks.length;i++){
//       checks[i].checked=v;  
//   	}
// });
// for(let c of checks){
//   c.addEventListener("click",function(){
//     if(!this.checked){
//       checkAll.checked=false;
//     }
//   });
// };
// const signUp = document.querySelector("#signUp");
// const req = document.querySelectorAll(".req");

// signUp.addEventListener("click",()=>{
//   for(let i=0;i<est.length;i++){
//     console.log();
//     if(!req[i].checked){
//       alert("필수약관에 모두 동의 해주세요");
//       return;
//     }
//   }
//   location.href="./signup";
// });

// jquery
$("#checkAll").click(()=>{
  let v = $("#checkAll").prop("checked");
  $(".checks").prop("checked",v);
});
$(".checks").click(function(){
  if(!$(this).prop("checked")){
    $("#checkAll").prop("checked",false);
  }
});


  
$("#signUp").click(function(){
  let t = true;
  $(".req").each(function(idx,item){
    if(!item.checked){
      alert("필수약관에 모두 동의 해주세요");
      t = false;
      return false;
    }
  });
  if(t){
    location.href="./signup";
  }
});
