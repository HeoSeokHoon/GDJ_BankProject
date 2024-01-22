<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>My page</title>
<!-- 사용전 경로를 꼭 수정하세요  -->
<!-- head_css  -->
<c:import url="../temps/head_css.jsp"></c:import>
<style type="text/css">
a {
	text-decoration: none;
	color: black
}
</style>
</head>
<body class="d-flex flex-column h-100">
	<main class="flex-shrink-0">
		<!-- 사용전 경로를 꼭 수정하세요  -->
		<!-- Navigation-->
		<c:import url="../temps/header.jsp"></c:import>
		<section class="py-5">
			<div class="text-center mb-5">
				<h1 class="display-5 fw-bolder mb-0">
					<span class="text-gradient d-inline"> My page </span>
				</h1>
			</div>
			<div class="row justify-content-center">
				<div class="col-4 align-self-center bg-light rounded-4">
					<div class="card my-3">
						<h3 class="card-header">회원 정보</h3>
						<div class="row card-body">
							<h6 class="card-title">프로필사진</h6>
							<div class="col-6">
								<c:if test="${member.memberFileDTO eq null}">
									<svg class="d-block user-select-none" width="100%" height="200"
										aria-label="Placeholder: Image cap" focusable="false"
										role="img" preserveAspectRatio="xMidYMid slice"
										viewBox="0 0 318 318"
										style="font-size: 1.125rem; text-anchor: middle">
    									<rect width="100%" height="100%" fill="#868e96"></rect>
    									<text x="50%" y="50%" fill="#dee2e6" dy=".3em">사진을 등록하세요</text>
  									</svg>
								</c:if>
								<c:if test="${member.memberFileDTO ne null}">
									<img class="img-fluid"
										src="/resources/upload/member/${member.memberFileDTO.fileName}" />
								</c:if>
							</div>
							<div class="card-body">
								<p class="card-text">ID : ${member.userName}</p>
							</div>
							<ul class="list-group list-group-flush">
								<li class="list-group-item">password : ${member.password}</li>
								<li class="list-group-item">name : ${member.name}</li>
								<li class="list-group-item">phone : ${member.phone}</li>
								<li class="list-group-item">address : ${member.address}</li>
							</ul>
							<div id="map" style="width:500px;height:400px;">

							</div>
							<div class="card-footer text-muted">
								<div class="row justify-content-center">
									<div class="align-self-center bg-light rounded-4">
										<button id="update" class="col-auto me-3 btn btn-dark w-100 py-2 mt-2"
											type="submit">회원정보수정</button>
										<button id="password" class="col-auto me-3 btn btn-dark w-100 py-2 mt-2"
											type="submit">비밀번호수정</button>
										<button id="delete" class="col-auto btn btn-dark w-100 py-2 mt-2"
											type="submit">회원탈퇴</button>
										<p class="mt-5 mb-3 text-body-secondary">&copy;2023</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div>
				<form id="frm" action="./update" method="get">
				</form>
			</div>
		</section>
	</main>
	<!-- 사용전 경로를 꼭 수정하세요  -->
	<!-- Footer  -->
	<c:import url="../temps/footer.jsp"></c:import>
	<script src="/resources/js/memberDetail.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3b71455d55c080ee992b8468b55e8ff2"></script>
	<script>
		let container = document.getElementById('map');
		let options = {center: new kakao.maps.LatLng(33.450701, 126.570667),
		level: 3 };


		let map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	</script>
</body>
</html>
