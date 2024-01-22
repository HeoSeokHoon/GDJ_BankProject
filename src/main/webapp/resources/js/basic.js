/**
 * 
 */

//js
 const b1 = document.getElementById("b1");
 const b2 = document.querySelector("#b2");

 b1.addEventListener("click",()=>{

 })
 let v = b1.innerHTML;
 b1.innerHTML = 'test';

 b1.getAttribute("속성명");
 b1.setAttribute("속성명","값");
 //jquery
 $("#b1").click(()=>{

 });

 $("#b2").on("click",()=>{

 });
 $("#b1").html();
 $("#b1").html("test");

 $("#b1").attr("속성명");
 $("#b1").attr("속성명","값");

 $("#b1").prop("속성명");
 $("#b1").prop("속성명","값");

 $("#b1").val("값");
