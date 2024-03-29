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
<title>Sing Up</title>
<!-- 사용전 경로를 꼭 수정하세요  -->
<!-- head_css  -->
<c:import url="../temps/head_css.jsp"></c:import>
</head>
<body class="d-flex flex-column h-100">
	<main class="flex-shrink-0">
		<!-- 사용전 경로를 꼭 수정하세요  -->
		<!-- Navigation-->
		<c:import url="../temps/header.jsp"></c:import>
		<section class="py-5">
			<div class="row justify-content-center">
				<div class="col-6 bg-light rounded-4 py-5 px-4">
					<div class="text-center mb-5">
						<h1 class="display-5 fw-bolder mb-0">
							<span class="text-gradient d-inline"> 회원정보 수정 </span>
						</h1>
					</div>
					<div class="row gx-5 justify-content-center">
						<div class="col-lg-8 col-xl-8">
							<form action="./update" method="POST" enctype="multipart/form-data">
								<div class="form-floating mb-3">
									<input type="text" disabled class="form-control" id="userName"
										name="userName" placeholder="" value="${member.userName}" /> <label for="userName"
										class="form-label">아이디</label>
								</div>
								<div class="form-floating mb-3">
									<input class="form-control" id="name" name="name"
										placeholder="" value="${member.name}"/> <label for="name" class="form-label">이름</label>
								</div>
								<div class="form-floating mb-3">
									<input type="text" class="form-control" id="phone" name="phone"
										placeholder="" value="${member.phone}" /> <label for="phone" class="form-label">전화번호</label>
								</div>
								<div class="form-floating mb-3">
									<input type="email" class="form-control" id="email"
										name="email" placeholder="" value="${member.email}"/> <label for="email"
										class="form-label">E-mail주소</label>
								</div>
								<div class="form-floating mb-3">
									<input type="text" class="form-control" id="address"
										name="address" placeholder="" value="${member.address}"/> <label for="address"
										class="form-label">주소</label>
								</div>
								<div class="mb-3">
									<label for="file" class="form-label">프로필사진</label> <input
										id="file" class="form-control" type="file" name="file">
								</div>
								<div class="d-grid">
									<button class="btn btn-dark" type="submit">수정</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>
	<!-- 사용전 경로를 꼭 수정하세요  -->
	<!-- Footer  -->
	<c:import url="../temps/footer.jsp"></c:import>
</body>
</html>
