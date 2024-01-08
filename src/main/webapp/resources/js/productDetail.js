/**
 * 
 */
 
 //const del = document.getElementById("del");
 const frm = document.getElementById("frm");
 const up = document.getElementById("up");
 
 	up.addEventListener("click", function(){
 		frm.submit();
 	});
 	
 	del.addEventListener("click", function(){
 		let result = confirm("정말 삭제하시겠습니까?");
 		if(result){
 		frm.setAttribute("action","delete");
 		frm.setAttribute("method","post");
 		frm.submit(); 		
 		}
 	});