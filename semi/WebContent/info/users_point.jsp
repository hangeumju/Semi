<%@page import="beans.Users_Info_Dao"%>
<%@page import="beans.Users_Get_Dto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>

<%
	Users_Info_Dao UIdao = new Users_Info_Dao();
	String user_id = (String)session.getAttribute("user_id");
	Users_Get_Dto UGdto = UIdao.users_get(user_id);	
	
	
%>


<!-- 포인트 테이블은 나중에 시간나면 생성하기로? 해서 보유 포인트만 나오도록 했습니다 -->
<body>
	<div class="row">
		<h2><%=user_id %>님의 포인트 내역입니다</h2>
		<p><%=UGdto.getUser_point() %> point</p>
	</div>
</body>

<jsp:include page="/template/footer.jsp"></jsp:include>