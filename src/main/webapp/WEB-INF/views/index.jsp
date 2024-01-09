<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    
    <!-- css -->
    <c:import url="./temps/bootstrap_css.jsp"></c:import>
    
    
  </head>
  <body>
    <!-- header -->
    <c:import url="./temps/header.jsp"></c:import>
    <div class="container-fluid border border-5 border-warning-subtle mt-5">
    	<section class="container">
    		<div id="carouselExampleAutoplaying" class="carousel slide" data-bs-ride="carousel">
			  <div class="carousel-inner">
			    <div class="carousel-item active">
			      <img src="/resources/images/000601.png" class="d-block w-25" alt="...">
			    </div>
			    <div class="carousel-item">
			      <img src="/resources/images/000602.png" class="d-block w-25" alt="...">
			    </div>
			    <div class="carousel-item">
			      <img src="/resources/images/000603.png" class="d-block w-25" alt="...">
			    </div>
			  </div>
			  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Previous</span>
			  </button>
			  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Next</span>
			  </button>
			</div>
    	</section>
    </div>
    
    <c:import url="./temps/bootstrap_js.jsp"></c:import>
  </body>
</html>