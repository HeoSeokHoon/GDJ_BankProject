$("#checkAll").click(function(){
  let check = $("#checkAll").prop("checked");
  $(".checks").prop("checked",check);
});

$("#t-body").on("click",".checks",function(){
  let flag=true;
    $('.checks').each(function(idx, c){
        if(!$(c).prop('checked')){
            flag=!flag;
            return false;
        }
    });
    $("#checkAll").prop("checked", flag);
});

$("#add").click(function(){
	let ar = [];
	$(".checks").each(function(idx,item){
		if($(item).prop("checked")){
		ar.push($(item).val());
		}
	});
	if(ar.length > 0){
		$("#deleteForm").attr("action","../account/add");
		$("#deleteForm").submit();
	}
})

$("#del").click(function(){
  let ar = [];
  let checkElement=[];
    $(".checks").each(function(idx,item){
      if($(item).prop("checked")){
        ar.push($(item).val());
        checkElement.push(item);
      }
    });
    if(ar.length > 0){
      deleteWithJquery();
      // deleteWithFetch(ar);
    }
});

function deleteWithFetch(){

  // let param = "";
  // nums.forEach(element => {
  // //   param=param+"productNum="+element+"&";
  // });

  let deleteFrom = document.getElementById("deleteForm");
  let form = new FormData(deleteFrom);

  fetch("./delete",{
    method:"POST",
    // headers:{
    //   "Content-type":"application/x-www-form-urlencoded"
    // },
    // body:param
    body:form
  })
  .then(respone=> respone.text())
  .then(respone=>{
    console.log(respone);
    $("#deleteForm").html(respone);
  })
}

function deleteWithJquery(){

  let form = new FormData($("#deleteForm")[0]);

  $.ajax({
    method:"post",
    url:"./delete",
    traditional:true,
    processData: false,
    contentType: false,
    data: form,
    success:function(result){
      // result = result.trim();
      // if(result>0){
      //   alert(`${result}개가 삭제되었습니다`);
      //   $(checkElement).each(function(idx,item){
      //     let parent = $(item).closest("tr")
      //     parent.remove();
      //     $("#checkAll").prop("checked",false);
      //   });
      // };
      console.log(result);
      $("#t-body").html(result);
    },
    error:function(){
      alert("알 수 없는 에러 발생 관리자에게 문의하세요");
    }
  });
}