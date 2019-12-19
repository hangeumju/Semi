<%@page import="beans.Users_Get_Dto"%>
<%@page import="beans.Users_Info_Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>

<%
	String user_pw = (String)session.getAttribute("user_pw");
	session.removeAttribute("user_pw");
	Users_Info_Dao UIdao = new Users_Info_Dao();
	String user_id = (String)session.getAttribute("user_id");
	Users_Get_Dto UGdto = UIdao.users_get(user_id);
%>

<div align="center">

	<h2>임시 비밀번호 발급이 완료되었습니다.</h2>

	<h3>비밀번호 = <%=UGdto.getUser_pw() %></h3>
	
</div>


<jsp:include page="/template/footer.jsp"></jsp:include>