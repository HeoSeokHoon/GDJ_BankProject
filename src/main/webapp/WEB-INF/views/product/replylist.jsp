<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <c:forEach items="${list}" var="reply">
    <li class="row">
      <div>
        <strong class="title">
          <span>${reply.userName}</span>
        </strong>
        <div class="reply">
          <span>${reply.replyText}</span>
        </div>
      </div>
    </li>
  </c:forEach>
<!-- <div class="text-center"><span id="more" data-replyList-page="${pager.page}">더보기(${pager.page}/${pager.totalPage})</span></div> -->

