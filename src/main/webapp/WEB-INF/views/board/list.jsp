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
                        <!-- table -->
                        <div>
                            <table class="table table-hover">
                                <thead>
                                    <tr class="table-dark">
                                        <th>No</th>
                                        <th>Title</th>
                                        <th>Writer</th>
                                        <th>Date</th>
                                        <th>Hit</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:forEach items="${list}" var="dto">
	                                    <tr>
	                                        <td>${dto.boardNum}</td>
	                                        <td>
	                                        	<a href="./detail?boardNum=${dto.boardNum}">
	                                        		<c:catch>
		                                        		<c:forEach begin="1" end="${dto.boardDepth}">
		                                        		&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
		                                        		</c:forEach>
		                                        		<c:if test="${dto.boardDepth!=0}">
		                                        			<img alt="답글" src="/resources/image/board_reply.png">
														</c:if>
                        	                		</c:catch>
	                                        		${dto.boardHead}
	                                        	</a>
	                                        </td>
	                                        <td>${dto.boardWriter}</td>
	                                        <td>${dto.boardDate}</td>
	                                        <td>${dto.boardHit}</td>
	                                    </tr>                                	
                                	</c:forEach>
                                </tbody>
                            </table>
                            <div>
                                <a href="./add" class="btn btn-light mb-3">글쓰기</a>
                            </div>
                        </div>
                    </div>
                </div>
               </section>
        </main>
    <!-- 사용전 경로를 꼭 수정하세요  -->
	<!-- Footer  -->
	<c:import url="../temps/footer.jsp"></c:import>
    </body>
</html>
