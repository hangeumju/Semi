<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <style>
	
	.er-color{
	color:#F9896;
	
	}
   </style>

<jsp:include page="/template/header.jsp"></jsp:include>
<hr color="#F9896">
<div align="center">
<h2>405에러 요청하신 페이지를 찾을 수 없습니다.</h2>
</div>
<!-- <img src="http://placehold.it/800x400"> -->
<div align="center">
<!-- <img src="http://placehold.it/800x400"> -->
<img src="<%=request.getContextPath()%>/image/siba.jpg" width="70%">
</div>
<hr color="#F9896">
<jsp:include page="/template/footer.jsp"></jsp:include>