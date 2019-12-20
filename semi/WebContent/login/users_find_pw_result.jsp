<%@page import="beans.Users_Get_Dto"%>
<%@page import="beans.Users_Info_Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>

<%
	String user_id = request.getParameter("user_id");
// //session에 들어있는 pw 데이터를 꺼낸 뒤 항목 삭제
// 	String user_pw = (String)session.getAttribute("user_pw");
// 	session.removeAttribute("user_pw");

// 	String user_id = (String)session.getAttribute("user_id");
	Users_Info_Dao UIdao = new Users_Info_Dao();
	Users_Get_Dto UGdto = UIdao.users_get(user_id);
%>

<div align="center">

	<!-- 검색 성공시 -->
	<%if(user_id != null){ %>
	<h2>당신의 비밀번호는 <%=UGdto.getUser_pw() %>입니다</h2>
	<a href="<%=request.getContextPath() %>/info/users_change_pw.jsp">비밀번호 변경</a>

	<%}else{ %>
	<!-- 검색 실패시 -->
	<h2>입력하신 정보에 해당하는 회원이 없습니다</h2>
	<a href="<%=request.getContextPath() %>/test_index.jsp">메인으로 이동</a>
	<%} %>
</div>


<jsp:include page="/template/footer.jsp"></jsp:include>