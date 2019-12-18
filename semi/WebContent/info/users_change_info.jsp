<%@page import="beans.Users_Change_Info_Dto"%>
<%@page import="beans.Users_Change_Info_Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//유저 정보 수정 페이지
	//사용자의 아이디를 이용하여 정보를 불러와서 출력
	String user_id = (String)session.getAttribute("user_id");
	Users_Change_Info_Dao UCIdao = new Users_Change_Info_Dao();
	Users_Change_Info_Dto UCIdto = UCIdao.get(user_id);
%>

<jsp:include page="/template/header.jsp"></jsp:include>
<div align="center">

	<h2>회원 정보 수정</h2>
	<form action="users_change_info.do" method="post">
		<table border="0">
			<tr>
				<th>전화번호</th>
				<td><input type="tel" name="phone" value="<%=UCIdto.getUser_phone()%>"
					required></td>
			</tr>
			<tr>
				<th rowspan="2">이메일</th>
				<td><input type="text" name="user_emil_id"
					value="<%=UCIdto.getUser_email_id()%>" placeholder="이메일아이디" size="6">
				</td>
			</tr>
			<tr>
				<td><input type="text" name="user_email_domain"
					value="<%=UCIdto.getUser_email_domain()%>" placeholder="이메일도메인" size="6">
				</td>
			</tr>
			<tr>
				<td><input type="text" name="user_interest"
					value="<%=UCIdto.getUser_interest()%>" placeholder="관심사" size="6">
				</td>
			</tr>
			<tr>
				<th colspan="2" align="center"></th>
				<td><input type="submit" value="완료"></td>
			</tr>


		</table>
	</form>
</div>
<jsp:include page="/template/footer.jsp"></jsp:include>
