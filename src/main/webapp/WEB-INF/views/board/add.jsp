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
          		Q&A&nbspAdd
            </c:if>
            <c:if test="${board eq 'notice'}">
            	Notice&nbspAdd
            </c:if>
        </title>
        <!-- 사용전 경로를 꼭 수정하세요  -->
        <!-- head_css  -->
        <c:import url="../temps/head_css.jsp"></c:import>
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
				          		질문글 작성
				            </c:if>
				            <c:if test="${board eq 'notice'}">
				            	공지사항 작성
				            </c:if>
                    	</span>
                    </h1>
                </div>
                <!-- boardForm import -->
                <c:import url="../temps/boardForm.jsp"></c:import>
			</section>

        </main>
    <!-- 사용전 경로를 꼭 수정하세요  -->
	<!-- Footer  -->
	<c:import url="../temps/footer.jsp"></c:import>
    </body>
</html>
