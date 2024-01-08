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
		<div clas="row mt-4">
			<form action="add" method="post">
				<div class="mb-3">
					<label for="productName" class="form-label">Product_Name</label>
					<input type="text" class="form-control" id="productName" name="productName" >
					<label for="productContents" class="form-label">Product_Contents</label>
					<input type="text" class="form-control" id="productContents" name="productContents" >
					<label for="productRate" class="form-label">Product_Rate</label>
					<input type="number" class="form-control" id="productRate" name="productRate" >
					<label for="productJumsu" class="form-label">Product_Jumsu</label>
					<input type="number" class="form-control" id="productJumsu" name="productJumsu" >
					<button type="submit" class="btn btn-primary">Add</button>
				</div>
			</form>
		</div>
	</section>
<c:import url="../temps/bootstrap_js.jsp"></c:import>
</body>
</html>