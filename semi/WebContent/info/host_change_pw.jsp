
<%@page import="beans.Host_Info_Dto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String host_id = (String)session.getAttribute("host_id"); 
    Host_Info_Dto HIdto = new Host_Info_Dto();
    %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/CSS/common.css">
<jsp:include page="/template/header.jsp"></jsp:include>
<form action="host_change_pw.do" method="post">
<article class="w-40">
<!-- 비밀번호 입력 -->
<h3><%=HIdto.getHost_id() %>님의 새로운 비밀번호를 입력해주세요.</h3>
<div class="row">
<input class="block-item input-item" type="password" name ="host_pw" placeholder="새로운 비밀번호 입력" required></div>
<!-- 저장 버튼 -->
<div class="row-left">
	<input class="btn" type="submit" value="비밀번호 변경"></div>
</article>
</form>
<jsp:include page="/template/footer.jsp"></jsp:include>