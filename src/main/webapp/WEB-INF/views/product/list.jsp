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
	<div class="container m-3">
		<div>
			<form class="row g-3">
				<div class="col-auto">
					<select class="form-select" name="kind" aria-label="Default select example">
					  <option value="kind1">이름</option>
					  <option value="kind2">내용</option>
					  <option value="kind3">이름&내용</option>
				  	</select>
				</div>
				<div class="col-auto">
				  <label for="search" class="visually-hidden">Search</label>
				  <input type="text" name="search" class="form-control" id="search" value="${pager.search}">
				</div>
				<div class="col-auto">
				  <button type="submit" class="btn btn-primary mb-3">Search</button>
				</div>
			</form>
		</div>
		<div class="container-lg">
		<table class="table table-hover">
			<thead>
				<tr>
					<th>Product Num</th>
					<th>Product Name</th>
					<th>Product Rate</th>
					<th>Product Jumsu</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${requestScope.list}" var="dto" >
					<tr>
						<td>${pageScope.dto.productNum}</td>
						<td><a href="./detail?productNum=${dto.productNum}">${pageScope.dto.productName}</a></td>
						<td>${pageScope.dto.productRate}</td>
						<td>${pageScope.dto.productJumsu}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
			<nav aria-label="Page navigation example" class="d-flex justify-content-center">
			  <ul class="pagination">
			  	<c:if test="${!pager.start}">
				    <li class="page-item">
				      <a class="page-link" href="./list?page=${pager.startNum-1}" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
			    </c:if>
			    
			    <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
			    	<li class="page-item"><a class="page-link" href="./list?page=${i}">${i}</a></li>			    
			    </c:forEach>
			    
			    <c:if test="${!pager.last}">
				    <li class="page-item">
				      <a class="page-link" href="./list?page=${pager.lastNum+1}" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
			    </c:if>
			  </ul>
			</nav>
		</div>
		<a class="btn btn-secondary" role="button" href="./add">Add</a>
	</div>
<c:import url="../temps/bootstrap_js.jsp"></c:import>
</body>
</html>