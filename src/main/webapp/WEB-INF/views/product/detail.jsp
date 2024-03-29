<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
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
			<div class="container px-5 my-5">
				<div class="text-center mb-5">
				        
					<div class="container-lg">
						<c:if test="${not empty detail}">
							<table class="table table-hover">
								<thead>
									<tr class="table-dark">
										<th>Product Num</th>
										<th>Product Name</th>
										<th>Product Contents</th>
										<th>Product Rate</th>
										<th>Product Jumsu</th>
										<th>Product File</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>${detail.productNum}</td>
										<td>${detail.productName}</td>
										<td>${detail.productContents}</td>
										<td>${detail.productRate}</td>
										<td>${detail.productJumsu}</td>
										<td>
											<c:forEach items="${detail.productFileDTOs}" var="f">
												<a href="/resources/upload/product/${f.fileName}">${f.oriName}</a><br>
											</c:forEach>
										</td>
									</tr>
								</tbody>
							</table>
						<button class="btn btn-light" id="up" data-product-num="${detail.productNum}">Update</button>
						<button class="btn btn-light" id="del">Delete</button>
						<form id="frm" action="./update" method="get">
							<input type="hidden" name="productNum" value="${detail.productNum}">
						</form>
						</c:if>
						<c:if test="${empty detail}">
							<h3>없는 번호 입니다</h3>
						</c:if>
					</div>
				                  
				</div>
		              
			</div>
		</main>
    <!-- 사용전 경로를 꼭 수정하세요  -->
	<!-- Footer  -->
	<c:import url="../temps/footer.jsp"></c:import>
	<script src="../resources/js/productDetail.js"></script>
    </body>
</html>
