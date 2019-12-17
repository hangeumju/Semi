<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>
<form action="host_login.do" method="post">
<div align="center">
<h2>Host Login</h2>
<table border="1">
<!-- ID 입력창 -->
<tr>
<td>
<input class="text" name ="host_id" placeholder="아이디 입력" required></td>
</tr>
<!-- PW 입력창 -->
<tr>
<td>
<input class="password" name ="host_pw" placeholder="비밀번호 입력" required></td>
</tr>
<!-- login 버튼-->
<tr>
<td align="right">
<input type="submit" value="Host Login"></td>
</tr>
<!-- ID저장 버튼-->
<tr>
<td><input type="checkbox"> ID 저장하기</td>
</tr>
<!-- ID찾기 버튼 -->
<tr>
<td>
<a href="#">ID 찾기</a><br>
<a href="#">PW 찾기</a><br>
<a href="<%=request.getContextPath()%>/join/host_regist.jsp">Join us</a></td>
</tr>
</table>
</div>
</form>
<%if(request.getParameter("error") != null){%>
<h3><font color="red">입력하신 정보가 일치하지 않습니다.<br>
다시 확인해주세요.</font></h3>
<%}%>
<jsp:include page="/template/footer.jsp"></jsp:include>






