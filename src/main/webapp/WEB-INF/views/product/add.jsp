<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../temps/bootstrap_css.jsp"></c:import>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
</head>
<body>
	<c:import url="../temps/header.jsp"></c:import>
	<section class="container-fluid">
		<div class="row mt-3 ms-1">
			<form action="add" method="post" enctype="multipart/form-data">
				<div class="mb-3">
					<label for="productName" class="form-label">Product_Name</label>
					<input type="text" class="form-control" id="productName" name="productName" >
					<label for="productContents" class="form-label">Product_Contents</label>
					<textarea class="form-control" id="productContents" name="productContents" ></textarea>
					<div class="mt-2 mb-2">
  						<input class="form-control form-control-sm" type="file" name="contentsFile">
  						<input class="form-control form-control-sm" type="file" name="contentsFile">
  						<input class="form-control form-control-sm" type="file" name="contentsFile">
  					</div>
					<label for="productRate" class="form-label">Product_Rate</label>
					<input type="text" class="form-control" id="productRate" name="productRate" >
					<label for="productJumsu" class="form-label">Product_Jumsu</label>
					<input type="text" class="form-control mb-2" id="productJumsu" name="productJumsu" >
					<button type="submit" class="btn btn-primary">Add</button>
				</div>
			</form>
		</div>
	</section>
<c:import url="../temps/bootstrap_js.jsp"></c:import>
<script>
	$('#productContents').summernote();
</script>

</body>
</html>