<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title><c:if test="${board eq 'qna'}">
          		Q&A&nbspList
            </c:if> <c:if test="${board eq 'notice'}">
            	Notice&nbspList
            </c:if></title>
<!-- 사용전 경로를 꼭 수정하세요  -->
<!-- head_css  -->
<c:import url="../temps/head_css.jsp"></c:import>
<style type="text/css">
a {
	text-decoration: none;
	color: black
}
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
					<span class="text-gradient d-inline"> <c:if
							test="${board eq 'qna'}">
                    			Q&A&nbspList
                    		</c:if> <c:if test="${board eq 'notice'}">
                    			Notice&nbspList
                    		</c:if>
					</span>
				</h1>
			</div>
			<div class="row gx-5 justify-content-center">
				<div class="col-lg-11 col-xl-9 col-xxl-8">
					<!-- table -->
					<div class="row g-4 align-items-end">
						<form id="searchForm" class="row mb-3">
							<input id="page" type="hidden" name="pager" value="1" />
							<div class="col-lg-6">
								<div class="input-group">
									<select class="form-select" id="kind" name="kind"
										data-kind="${pager.kind}">
										<option class="a" value="kind1">제목</option>
										<option class="a" value="kind2">내용</option>
										<option class="a" value="kind3">전체</option>
									</select> <label for="search" class="visually-hidden">Search</label> <input
										type="text" name="search" class="form-control" id="search"
										value="${pager.search}">
									<button type="submit" class="btn btn-light">Search</button>
								</div>
							</div>
						</form>
					</div>
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
								<c:if test="${list.size()==0}">
									<tr>
										<td colspan="5" style="text-align: center;">검색 결과가 없습니다</td>
									</tr>
								</c:if>
								<c:forEach items="${list}" var="dto">
									<c:set var="f" value="0"></c:set>
									<c:catch>
										<c:set var="f" value="${dto.flag}"></c:set>
										<c:if test="${f eq 1}">
											<tr>
												<td></td>
												<td>삭제된 글 입니다.</td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
										</c:if>
									</c:catch>
									<c:if test="${f eq 0}">
										<tr>
											<td>${dto.boardNum}</td>
											<td><a href="./detail?boardNum=${dto.boardNum}"> <c:catch>
														<c:forEach begin="1" end="${dto.boardDepth}">
			                                        		&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
			                                        		</c:forEach>
														<c:if test="${dto.boardDepth!=0}">
															<img alt="답글" src="/resources/image/board_reply.png">
														</c:if>
													</c:catch> ${dto.boardHead}
											</a></td>
											<td>${dto.boardWriter}</td>
											<td>${dto.boardDate}</td>
											<td>${dto.boardHit}</td>
										</tr>
									</c:if>
								</c:forEach>
							</tbody>
						</table>
						<div>
							<a href="./add" class="btn btn-light mb-3">글쓰기</a>
						</div>
						<nav aria-label="Page navigation example"
							class="d-flex justify-content-center">
							<ul class="pagination">
								<c:if test="${!pager.start}">
									<li class="page-item"><a class="page-link pager"
										href="./list?page=${pager.startNum-1}" aria-label="Previous"
										data-page="${pager.startNum-1}"> <span aria-hidden="true">&laquo;</span>
									</a></li>
								</c:if>

								<c:forEach begin="${pager.startNum}" end="${pager.lastNum}"
									var="i">
									<li class="page-item"><a class="page-link pager"
										data-page="${i}"
										href="./list?page=${i}&search=${pager.search}&kind=${pager.kind}">${i}</a></li>
								</c:forEach>

								<c:if test="${!pager.last}">
									<li class="page-item"><a class="page-link pager"
										href="./list?page=${pager.lastNum+1}&search=${pager.search}&kind=${pager.kind}"
										aria-label="Next" data-page="${pager.lastNum+1}"> <span
											aria-hidden="true">&raquo;</span>
									</a></li>
								</c:if>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</section>
	</main>
	<!-- 사용전 경로를 꼭 수정하세요  -->
	<!-- Footer  -->
	<c:import url="../temps/footer.jsp"></c:import>
	<script src="/resources/js/boardSearch.js"></script>
</body>
</html>
