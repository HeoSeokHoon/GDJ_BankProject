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