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
        <style type="text/css">
        	a{text-decoration: none; color: black}
        </style>
    </head>
    <body class="d-flex flex-column h-100">
        <main class="flex-shrink-0">
       		<!-- 사용전 경로를 꼭 수정하세요  -->
            <!-- Navigation-->
           	<c:import url="../temps/header.jsp"></c:import>
           	<div class="container px-5 my-5">
           		<div class="text-center mb-5">
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
				<tr class="table-dark">
					<th>Product Num</th>
					<th>Product Name</th>
					<th>Product Rate</th>
					<th>Product Jumsu</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="dto" >
					<tr>
						<td>${dto.productNum}</td>
						<td><a href="./detail?productNum=${dto.productNum}">${dto.productName}</a></td>
						<td>${dto.productRate}</td>
						<td>${dto.productJumsu}</td>
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
			    	<li class="page-item"><a class="page-link" href="./list?page=${i}&search=${pager.search}&kind=${pager.kind}">${i}</a></li>			    
			    </c:forEach>
			    
			    <c:if test="${!pager.last}">
				    <li class="page-item">
				      <a class="page-link" href="./list?page=${pager.lastNum+1}&search=${pager.search}&kind=${pager.kind}" aria-label="Next">
				        <span aria-hidden="true">&raquo;</span>
				      </a>
				    </li>
			    </c:if>
			  </ul>
			</nav>
		</div>
                    
                </div>
                <div>
                	<a class="btn btn-primary btn-lg" href="./add">상품 등록</a>
                </div>
           	</div>
        </main>
    <!-- 사용전 경로를 꼭 수정하세요  -->
	<!-- Footer  -->
	<c:import url="../temps/footer.jsp"></c:import>
    </body>
</html>
