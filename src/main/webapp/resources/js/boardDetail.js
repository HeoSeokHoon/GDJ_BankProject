/**
 * 
 */
 const update = document.getElementById("update");
 const del = document.getElementById("delete");
 const frm = document.getElementById("frm");
 	
 	update.addEventListener("click", (e)=>{
 		e.preventDefault();
 		frm.submit();
 	});
 	
 	del.addEventListener("click", (e)=>{
 		e.preventDefault();
 		let result = confirm("정말 삭제하시겠습니까?");
 		if(result){
 		frm.setAttribute("action","./delete");
 		frm.setAttribute("method","post");
 		frm.submit(); 		
 		}
 	});