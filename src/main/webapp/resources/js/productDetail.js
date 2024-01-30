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
 const replyUpdateButton = document.getElementById("replyUpdateButton");

 getReplyList(1, up.getAttribute("data-product-num"));

 //모달 수정 버튼
 replyUpdateButton.addEventListener("click",function(){
	let replyUpdateForm = document.getElementById("replyUpdateForm");

	let formData = new FormData(replyUpdateForm);
	fetch("../reply/update",{
		method:"post",
		body:formData
	})
	.then(r=>r.json())
	.then(r=>{
		if(r>0){
			let i = "replyContents"+document.getElementById("replyUpdateNum").value;
			i = document.getElementById(i);
			i.innerHTML = document.getElementById("replyUpdateContents").value;
		}else{
			alert("수정실패");
		}
		replyUpdateForm.reset();
		document.getElementById("replyCloseButton").click();
	})
 });
 //수정버튼
 replyList.addEventListener("click",(e)=>{
	if(e.target.classList.contains("update")){
		let replyUpdateContents = document.getElementById("replyUpdateContents");
		let i = e.target.getAttribute("data-replyNum");
		let r = document.getElementById('replyContents'+i);
		replyUpdateContents.value=r.innerHTML;
		let replyUpdateNum = document.getElementById("replyUpdateNum");
		replyUpdateNum.value=i;

		document.getElementById("replyWriter").value=r.previousSibling.innerHTML;
	}
 });

 //삭제버튼
 $("#replyList").on("click",".del",function(){
	let n = $(this).attr("data-replyNum");
	fetch("../reply/delete",{
		method:"post",
		headers : {"Content-type": 'application/x-www-form-urlencoded;charset=utf-8'},
		body:"replyNum="+n+"&productNum="+up.getAttribute("data-product-num")
	})
	.then(r=>r.json())
	.then(r=>{
		replyList.innerHTML="";
		makeList(r);
	})
 })

 //더보기
 more.addEventListener("click",()=>{
	let p = more.getAttribute("data-replyList-page");
	let a = more.getAttribute("data-replyList-totalPage");

	if(p>a){
		alert("마지막 페이지 입니다");
	}


	getReplyList(p, up.getAttribute("data-product-num"))
 });

 //서버에 리스트 요청함수
 function getReplyList(page, num){
	fetch("../reply/list?page="+page+"&productNum="+num,{
		method:"get"
	})
	.then(r=>r.json())
	.then(r=>{
		makeList(r);
	})
 }
 let userName = replyList.getAttribute("data-user");

 	//list 작성 함수
 function makeList(r){
	more.setAttribute("data-replyList-page", r.pager.page*1+1);
	more.setAttribute("data-replyList-totalPage", r.pager.totalPage);
	r=r.datas;
	for(let i=0;i<r.length;i++){
		let li = document.createElement("li");
		let sp = document.createElement("span");
		sp.innerText = r[i].userName;
		li.append(sp);

		sp = document.createElement("span");
		sp.setAttribute("id","replyContents"+r[i].replyNum);
		sp.innerText = r[i].replyText;
		li.append(sp);

		sp = document.createElement("span");
		let d = new Date(r[i].replyDate);
		sp.innerHTML = d.getFullYear()+"/"+(d.getMonth()+1)+"/"+d.getDate()+"&nbsp"+d.getHours()+"시"+d.getMinutes()+"분";
		li.append(sp);

		if(userName==r[i].userName){
			let b = document.createElement("button");
			b.innerHTML="삭제";
			b.setAttribute("class","del");
			b.setAttribute("data-replyNum", r[i].replyNum);
			li.append(b);
	
			b = document.createElement("button");
			b.innerHTML="수정";
			b.setAttribute("class","update");
			b.setAttribute("data-replyNum", r[i].replyNum);
			b.setAttribute("data-bs-toggle","modal");
			b.setAttribute("data-bs-target","#replyUpateModal");
			li.append(b);
		}

		replyList.append(li);
	};
 }

 //댓글등록
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
		replyList.innerHTML="";
		makeList(respone);
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

	