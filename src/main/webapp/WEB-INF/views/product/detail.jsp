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
				<h3>${detail.productNum}</h3>
				<div>${detail.productName}</div>
				<div>${detail.productContents}</div>
				<div>${detail.productRate}</div>
				<div>${detail.productJumsu}</div>
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