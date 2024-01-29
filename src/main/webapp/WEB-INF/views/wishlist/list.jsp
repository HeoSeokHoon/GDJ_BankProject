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
		<div class="container px-5 mt-5">
			<div class="text-center mb-5">
				<h1 class="display-5 fw-bolder mb-0">
					<span class="text-gradient d-inline"> Wish List </span>
				</h1>
			</div>
		</div>
		<div class="container">
			<table class="table table-hover text-center caption-top">
				<caption>
					<button id="del" class="btn btn-light">삭제</button>
					<button id="add" class="btn btn-light">가입</button>
				</caption>
				<thead>
					<tr class="table-dark">
						<th class="col-2">
							<div class="form-check">
								<input class="form-check-input" type="checkbox" value=""
									id="checkAll"> <label class="form-check-label"
									for="checkAll" style="width: 50%;">전체선택</label>
							</div>
						</th>
						<th>No</th>
						<th>Product Name</th>
						<th>Rate</th>
						<th>Product Rating</th>
					</tr>
				</thead>
				<tbody id="t-body">
					<form id="deleteForm">
						<c:forEach items="${list}" var="dto">
							<tr>
								<td>
									<div class="form-check">
										<input class="form-check-input checks" type="checkbox" name="productNum"
											value="${dto.productNum}">
									</div>
								</td>
								<td>${dto.productNum}</td>
								<td><a
									href="../product/detail?productNum=${dto.productNum}">${dto.productName}</a></td>
								<td>${dto.productRate}</td>
								<td>${dto.productJumsu}</td>
							</tr>
						</c:forEach>
					</form>
				</tbody>
			</table>

			<nav aria-label="Page navigation example"
				class="d-flex justify-content-center">
				<ul class="pagination">
					<c:if test="${!pager.start}">
						<li class="page-item"><a class="page-link"
							href="./list?page=${pager.startNum-1}" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
						</a></li>
					</c:if>

					<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
						<li class="page-item"><a class="page-link"
							href="./list?page=${i}&search=${pager.search}&kind=${pager.kind}">
								${i} </a></li>
					</c:forEach>

					<c:if test="${!pager.last}">
						<li class="page-item"><a class="page-link"
							href="./list?page=${pager.lastNum+1}&search=${pager.search}&kind=${pager.kind}"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</c:if>
				</ul>
			</nav>
		</div>
	</main>
	<!-- 사용전 경로를 꼭 수정하세요  -->
	<!-- Footer  -->
	<c:import url="../temps/footer.jsp"></c:import>
	<script src="../resources/js/wishlist.js"></script>
</body>
</html>
