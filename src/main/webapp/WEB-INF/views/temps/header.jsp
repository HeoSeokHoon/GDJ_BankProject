<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 <nav class="navbar navbar-expand-lg navbar-light bg-white py-3">
    <div class="container px-5">
        <a class="navbar-brand" href="index.html"><span class="fw-bolder text-primary">Start Bootstrap</span></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto mb-2 mb-lg-0 small fw-bolder">
                <li class="nav-item"><a class="nav-link" href="/">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="/product/list">Product</a></li>
                <li class="nav-item"><a class="nav-link" href="/notice/list">Notice</a></li>
                <li class="nav-item"><a class="nav-link" href="/qna/list">Q&A</a></li>
            </ul>
            <ul class="navbar-nav ms-m mb-2 mb-lg-0 small fw-bolder">
            	<c:if test="${empty sessionScope.member}">
	                <li class="nav-item"><a class="nav-link" href="/member/login">Login</a></li>
	                <li class="nav-item"><a class="nav-link" href="/member/signup">Sign Up</a></li>
                </c:if>
                <c:if test="${not empty sessionScope.member}">
	                <li class="nav-item"><a class="nav-link" href="/member/mypage">My page</a></li>
	                <li class="nav-item"><a class="nav-link" href="/member/logout">Logout</a></li>
                </c:if>
            </ul>
        </div>
    </div>
</nav>