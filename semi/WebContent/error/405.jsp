<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/template/header.jsp"></jsp:include>

<h2>405에러 요청하신 페이지를 찾을 수 없습니다.</h2>
<!-- <img src="http://placehold.it/800x400"> -->
<img src="<%=request.getContextPath()%>/image/siba.jpg">

<jsp:include page="/template/footer.jsp"></jsp:include>