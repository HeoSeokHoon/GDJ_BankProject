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
        <title>
			<c:if test="${board eq 'qna'}">
          		Q&A&nbspList
            </c:if>
            <c:if test="${board eq 'notice'}">
            	Notice&nbspList
            </c:if>
		</title>
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
			<section class="py-5">
                <div class="container px-5 mb-5">
                    <div class="text-center mb-5">
                        <h1 class="display-5 fw-bolder mb-0">
                        	<span class="text-gradient d-inline">
	                        	<c:if test="${board eq 'qna'}">
					          		Q&A&nbspList
					            </c:if>
					            <c:if test="${board eq 'notice'}">
					            	Notice&nbspList
					            </c:if>
                        	</span>
                       	</h1>
                    </div>
                    <div class="row gx-5 justify-content-center">
                        <div class="col-lg-11 col-xl-9 col-xxl-8">
                        	<!-- Card One -->
                        	<div class="card overflow-hidden shadow rounded-4 border-0 mb-5">
                                <div class="card-body p-0">
                                    <div class="d-flex align-items-center">
                                        <div class="p-5">
                                            <h2 class="fw-bolder">${boardDTO.boardHead}</h2>
                                            <div>
                                            	${boardDTO.boardContents}
                                            </div>
                                            <div>
                                            	<c:forEach items="${boardDTO.fileDTOs}" var="f">
                                            		<img src="../resources/upload/${board}/${f.fileName}"/><br>${f.oriName}<br>
                                            	</c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div>
								<c:if test="${bbs eq 1}">
		                            <a class="btn btn-light shadow rounded-4 border-0 mb-5" href="reply?boardNum=${boardDTO.boardNum}">답글</a>
								</c:if>
                                <c:if test="${boardDTO.boardWriter eq member.userName}">
                                    <a id="update" class="btn btn-light shadow rounded-4 border-0 mb-5" href="#">Update</a>
                                    <a id="delete" class="btn btn-light shadow rounded-4 border-0 mb-5" href="#">Delete</a>
                                </c:if> 
                               	<form id="frm" action="./update" method="get">
                               		<input type="hidden" name="boardNum" value="${boardDTO.boardNum}"/>
                               	</form>
                            </div>
                        </div>
                    </div>
               	</div>
          	</section>
        </main>
    <!-- 사용전 경로를 꼭 수정하세요  -->
	<!-- Footer  -->
	<c:import url="../temps/footer.jsp"></c:import>
	<script src="/resources/js/boardDetail.js"></script>
    </body>
</html>
