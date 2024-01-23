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
<title>SeokHun-Project</title>
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
							<span class="text-gradient d-inline">약관동의</span>
						</h1>
					</div>
					<div class="row gx-5 justify-content-center">
						<div class="col-lg-8 col-xl-8">
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value=""
									id="checkAll"> <label class="form-check-label"
									for="checkAll"> 모두 동의 </label>
							</div>
							<div class="form-check">
								<input class="form-check-input checks req" type="checkbox" value=""
									id="a1"> <label
									class="form-check-label" for="a1">
									필수 동의 </label>
							</div>
							<div class="form-check">
								<input class="form-check-input checks req" type="checkbox" value=""
									id="a2"> <label
									class="form-check-label" for="a2">
									필수 동의 </label>
							</div>
							<div class="form-check">
								<input class="form-check-input checks req" type="checkbox" value=""
									id="a3"> <label
									class="form-check-label" for="a3">
									필수 동의 </label>
							</div>
							<div class="form-check">
								<input class="form-check-input checks opts" type="checkbox" value=""
									id="a4"> <label
									class="form-check-label" for="a4">
									선택 동의 </label>
							</div>
							<div class="form-check">
								<input class="form-check-input checks opts" type="checkbox" value=""
									id="a5"> <label
									class="form-check-label" for="a5">
									선택 동의 </label>
							</div>
							<div>
									<button id="signUp" class="btn btn-dark">회원가입</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>
	<!-- 사용전 경로를 꼭 수정하세요  -->
	<!-- Footer  -->
	<c:import url="../temps/footer.jsp"></c:import>
	<script src="../resources/js/member/agreement.js"></script>
</body>
</html>
