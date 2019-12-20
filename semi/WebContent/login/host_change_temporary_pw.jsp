<%@page import="beans.Host_Info_Dto"%>
<%@page import="beans.Host_Info_Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/CSS/common.css">
<jsp:include page="/template/header.jsp"></jsp:include>

<div align="center">
<%
String host_pw = (String)session.getAttribute("host_pw");
session.removeAttribute("host_pw");
Host_Info_Dao HIdao = new Host_Info_Dao();
String host_id = (String)session.getAttribute("host_id");
Host_Info_Dto HIdto = HIdao.get(host_id);


%>

	<h2>임시 비밀번호 발급이 완료되었습니다.</h2>
	<h3>비밀번호 = <%=HIdto.getHost_pw()%></h3>
	
	<a>비밀번호 변경</a>

</div>
<jsp:include page="/template/footer.jsp"></jsp:include>