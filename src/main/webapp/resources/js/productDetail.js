/**
 * 
 */
 const frm = document.getElementById("frm");
 const up = document.getElementById("up");
 const del = document.getElementById("delete");
 const create = document.getElementById("create");
 
 	up.addEventListener("click", function(){
 		frm.submit();
 	});
 	
 	create.addEventListener("click", function(){
 		frm.setAttribute("action","../account/add");
 		frm.setAttribute("method","get");
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