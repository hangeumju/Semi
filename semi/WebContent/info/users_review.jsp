<%@page import="beans.Users_Get_Dto"%>
<%@page import="beans.Users_Info_Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>
<%
//유저 정보를 불러오는 코드 
	Users_Info_Dao UIdao = new Users_Info_Dao();
	String user_id = (String)session.getAttribute("user_id");
	Users_Get_Dto UGdto = UIdao.users_get(user_id);
%>
<body>
	<div class="row">
		<h2><%=UGdto.getUser_id() %>님의 프립 후기입니다</h2>
		<!--  컨텐츠 넘버/ 유저 이름(작성자) / 작성일 /  
		리뷰내용/ 컨텐츠 이름   -->
	
		
		
	</div>
</body>

<jsp:include page="/template/footer.jsp"></jsp:include>