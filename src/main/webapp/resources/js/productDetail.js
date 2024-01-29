/**
 * 
 */
 const frm = document.getElementById("frm");
 const up = document.getElementById("up");
 const dele = document.getElementById("del");
 const create = document.getElementById("create");
 const replyForm = document.getElementById("replyForm");
 const replyAdd = document.getElementById("replyAdd");
 const replyList = document.getElementById("replyList");
 const more = document.getElementById("more");

 more.addEventListener("click",()=>{
	console.log("more");
	let p = more.getAttribute("data-replyList-page");
	let a = more.getAttribute("data-replyList-totalPage");
	p=p*1+1;
	if(p>a){
		alert("마지막 페이지 입니다");
	}
	more.setAttribute("data-replyList-page",p);

	fetch("../reply/list?productNum="+up.getAttribute("data-product-num")+"&page="+p,{
		method:"get"
	}).then(r=>r.text()).then(r=>$("#replyList").append(r));

 });

 replyAdd.addEventListener("click",function(){
	addReplyFetch();
	more.setAttribute("data-replyList-page",1);
});

function addReplyFetch(){

	let form = new FormData(replyForm);

	fetch("../reply/add",{
		method:"POST",
		body:form
	})
	.then(respone=> respone.text())
	.then(respone=>{
		console.log(respone);
		replyList.innerHTML=respone;
		replyForm.reset(); 
	})
}

//  replyList.addEventListener("click",(e)=>{
// 	if(e.target.getAttribute("id")=='more'){
// 		let p = e.target.getAttribute("data-replyList-page");
// 		alert(parseInt(p)+1);
// 		p=parseInt(p)+1;

// 		fetch("../reply/list?productNum="+up.getAttribute("data-product-num")+"&page="+p,{
// 			method:"get"
// 		}).then(r=>r.text()).then(r=>replyList.innerHTML=r);
	
// 		replyAdd.addEventListener("click",function(){
// 			addReplyFetch();
// 		});
// 	}
//  });
 
 	up.addEventListener("click", function(){
 		frm.submit();
 	});
 	
 	create.addEventListener("click", function(){
 		frm.setAttribute("action","../account/add");
 		frm.setAttribute("method","get");
 		frm.submit();
 		
 	});

 	dele.addEventListener("click", function(){
 		let result = confirm("정말 삭제하시겠습니까?");
 		if(result){
 		frm.setAttribute("action","./delete");
 		frm.setAttribute("method","post");
 		frm.submit(); 		
 		}
 	});

	 $("#wishList").click(function(){
		// fetch("../wishlist/add?productNum="+$("#up").attr("data-product-num"),{
		// 	method:"GET"
		// })
		// .then(response=>response.text())
		// .then(response=>{
		// 	console.log(response);
		// })
		let productNum = $("#up").attr("data-product-num");
		$.ajax({
			url:"../wishlist/add",
			method:"GET",
			data:{
				productNum:productNum
			},
			success:function(result){
				if(confirm("관심상품 목록으로 이동하시겠습니까?")){
					location.href="../wishlist/list"
				}else{
					frm.setAttribute("action","./list");
					frm.setAttribute("method","get");
					frm.submit();
				};
			},
			error:function(){
				alert("관심상품 추가에 실패하였습니다");
			}
		});
	});



	// fetch("../reply/list?productNum="+up.getAttribute("data-product-num"),{
	// 	method:"get"
	// }).then(r=>r.text()).then(r=>replyList.innerHTML=r);

	