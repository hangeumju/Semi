<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% String go = request.getParameter("go");
    %>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/CSS/common.css">
<jsp:include page="/template/header.jsp"></jsp:include>
<div align="center">
<h2>비밀번호 확인</h2>
<form action="host_check.do" method ="post">
<input type ="hidden" name="host_id" value="<%=go%>">
<input type="password" name="pw" required>
<input type="submit" value="확인">
<%if(request.getParameter("error") != null) {%>
<h4><font color="red">비밀번호를 다시 확인해주세요.</font></h4>
<%} %>
</form>
</div>
<jsp:include page="/template/footer.jsp"></jsp:include>