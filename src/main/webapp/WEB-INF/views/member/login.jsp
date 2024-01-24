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
<body class="container-fluid d-flex flex-column h-100">
	<main class="flex-shrink-0">
		<!-- 사용전 경로를 꼭 수정하세요  -->
		<!-- Navigation-->
		<c:import url="../temps/header.jsp"></c:import>
		<div class="row justify-content-center" style="height: 700px">
			<div class="col-3 align-self-center bg-light rounded-4">
				<form action="./login" method="POST">
					<img class="m-3 rounded-4" src="/resources/image/login.jpg" alt=""
						width="72" height="64">
					<h1 class="h3 mb-3 fw-normal">Please Log in</h1>
					<div class="form-floating">
						<input type="text" class="form-control" id="floatingInput"
							placeholder="" name="userName" value="test"> <label
							for="floatingInput">ID</label>
					</div><br>
					<div class="form-floating">
						<input type="password" class="form-control" id="floatingPassword"
							placeholder="Password" name="password" value="test"> <label
							for="floatingPassword">Password</label>
					</div>
					<c:if test="${msg ne null}">
						<div class="form-check text-center my-3">
							<span class="fw-normal">${msg}</span>
						</div>
					</c:if>
					<div class="form-check text-start my-3">
						<input class="form-check-input" type="checkbox"
							value="remember-me" id="flexCheckDefault"> <label
							class="form-check-label" for="flexCheckDefault"> Remember
							me </label>
					</div>
					<button class="btn btn-dark w-100 py-2" type="submit">Login</button>
					<p class="mt-5 mb-3 text-body-secondary">&copy;2023</p>
				</form>
			</div>
		</div>
	</main>
	<!-- 사용전 경로를 꼭 수정하세요  -->
	<!-- Footer  -->
	<c:import url="../temps/footer.jsp"></c:import>
</body>
</html>
