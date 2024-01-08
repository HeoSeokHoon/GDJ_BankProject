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
	<table class="table table-hover">
		<thead>
			<tr>
				<th>Product Num</th>
				<th>Product Name</th>
				<th>Product Contents</th>
				<th>Product Rate</th>
				<th>Product Jumsu</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${requestScope.list}" var="dto" >
				<tr>
					<td>${pageScope.dto.productNum}</td>
					<td><a href="./detail?productNum=${dto.productNum}">${pageScope.dto.productName}</a></td>
					<td>${pageScope.dto.productContents}</td>
					<td>${pageScope.dto.productRate}</td>
					<td>${pageScope.dto.productJumsu}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<a class="btn btn-secondary" role="button" href="./add">Add</a>
<c:import url="../temps/bootstrap_js.jsp"></c:import>
</body>
</html>