<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% String host_check = request.getParameter("host_check");
    %>
<jsp:include page="/template/header.jsp"></jsp:include>
<div align="center">
<h2>비밀번호 확인</h2>
<form action="host_check.do" method ="post">
<input type ="hidden" name="host_check" value="<%=host_check%>">
<input type="password" name="pw" required>
<input type="submit" value="확인">
</form>
<%if(request.getParameter("error") != null) {%>
<h4><font color="red">비밀번호를 다시 확인해주세요.</font></h4>
<%} %>

</div>
<jsp:include page="/template/footer.jsp"></jsp:include>