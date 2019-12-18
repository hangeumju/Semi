<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--유저 아이디  찾기 페이지 --%>    
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">   
<jsp:include page="/template/header.jsp"></jsp:include>
<div align="center">
	<h2>회원 아이디 찾기</h2>

	<form action="users_login_find.do" method="post">
		<table>
			<!-- 정보입력 : 이름, 전화번호 -->
			<tr>
				<th>이름</th>
				<td><input type="text" name="user_name" placeholder="이름" required>
				</td>
			</tr>
			<!-- -------------------------------------- -->
			<tr>
				<th>전화번호</th>
				<td><input type="tel" name="user_phone" placeholder="전화번호" required>
				</td>
			</tr>
			<!-- -------------------------------------- -->
			<tr>
				<th align="center" colspan="2"><input type="reset" value="초기화">
					<input type="submit" value="아이디찾기"></th>
			</tr>
			<!-- -------------------------------------- -->

			<tr>
				<td>
					<!-- 각종링크( 회원가입 . 비번찾기) --> <a href="/semi/join/users_regist.jsp">회원가입</a><br>
					<a href="#">비밀번호 찾기/변경</a><br>
				</td>
			</tr>
			<!-- -------------------------------------- -->



		</table>
	</form>
</div>
<jsp:include page="/template/footer.jsp"></jsp:include>