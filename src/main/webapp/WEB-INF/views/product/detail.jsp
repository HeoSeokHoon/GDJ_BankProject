<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temps/bootstrap_css.jsp"></c:import>
</head>
<body>
	<c:import url="../temps/header.jsp"></c:import>
	<section class="container-fluid">
		<div>
			<c:if test="${not empty detail}">
				<table class="table">
					<tr>
						<th>ProductNum</th>
						<th>ProductName</th>
						<th>ProductContents</th>
						<th>FileList</th>
						<th>ProductRate</th>
						<th>ProductJumsu</th>
					</tr>
					<tr>
						<td>${detail.productNum}</td>
						<td>${detail.productName}</td>
						<td>${detail.productContents}</td>
						<td>
							<c:forEach items="${detail.productFileDTOs}" var="f">
								<a href="/resources/upload/product/${f.fileName}">${f.oriName}</a><br>
							</c:forEach>
						</td>
						<td>${detail.productRate}</td>
						<td>${detail.productJumsu}</td>
					</tr>
				</table>
				<button id="up" data-product-num="${detail.productNum}">Update</button>
				<button id="del">Delete</button>
				<form id="frm" action="./update" method="get">
					<input type="hidden" name="productNum" value="${detail.productNum}">
				</form>
			</c:if>
			<c:if test="${empty detail}">
				<h3>없는 번호 입니다</h3>
			</c:if>
		</div>
	</section>
<c:import url="../temps/bootstrap_js.jsp"></c:import>
<script src="../resources/js/productDetail.js"></script>
</body>
</html>