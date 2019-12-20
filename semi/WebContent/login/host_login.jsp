<%@page import="beans.Host_Info_Dao"%>
<%@page import="beans.Host_Info_Dto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    String host_id = (String)session.getAttribute("host_id");
    Host_Info_Dao HIdao = new Host_Info_Dao();
    Host_Info_Dto HIdto = HIdao.get(host_id);
    %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/CSS/common.css">
<jsp:include page="/template/header.jsp"></jsp:include>
<form action="host_login.do" method="post">
<article class="w-40">
<!-- ID 입력창 -->
<div class="row">
<input class="block-item input-item" type="text" name ="host_id" placeholder="아이디 입력" required></div>
<!-- PW 입력창 -->
<div class="row">
<input class="block-item input-item" type="password" name ="host_pw" placeholder="비밀번호 입력" required></div>
<!-- login 버튼-->
<div class="row-left">
	<input class="btn" type="submit" value="Host Login"></div>
<!-- ID저장 버튼-->
<div class="row-left">
<input type="checkbox">ID 저장하기</div>
<!-- ID찾기 버튼 -->
<div class="row-left">
<a href="<%=request.getContextPath()%>/login/host_login_find.jsp">회원정보 찾기</a><br>
<a href="<%=request.getContextPath()%>/join/host_regist.jsp">Join us</a><br>
<!-- error 전송될 경우 메세지 출력 -->
<div>
<%if(request.getParameter("error") != null){%>
<h3><font color="red">입력하신 정보가 일치하지 않습니다.<br>
다시 확인해주세요.</font></h3>
<%} %>
</div>
</article>
</form>
<jsp:include page="/template/footer.jsp"></jsp:include>






