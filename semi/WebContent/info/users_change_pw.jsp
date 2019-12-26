<%@page import="beans.Users_Get_Dto"%>
<%@page import="beans.Users_Change_Info_Dto"%>
<%@page import="beans.Users_Info_Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 유저 비밀번호 변경 -->

<%
	//유저 정보 수정 페이지
	//사용자의 아이디를 이용하여 정보를 불러와서 출력
	String user_id = (String) session.getAttribute("user_id");
	Users_Info_Dao UIdao = new Users_Info_Dao();
	Users_Change_Info_Dto UCIdto = new Users_Change_Info_Dto();
	Users_Get_Dto UGdto = UIdao.users_get(user_id);
%>
<jsp:include page="/template/header.jsp"></jsp:include>

<style>
/*
    테이블 스타일
    */
.notice_table {
	width: 100%;
	border-top: 1px solid lightgray;
	border-collapse: collapse;
}

th, td {
	border-bottom: 1px solid lightgray;
	padding: 10px;
}

/*
    사이드 메뉴 스타일
  
*/
div {
	/*     border: 1px solid black; */
	
}

.side {
	width: 170px;
	float: left;
	/*           background-color:#F98967;*/
}

.side .side_menu>ul>li>a {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 16px;
	font-weight: 500;
	color: black;
	line-height: 40px;
	display: block;
	text-decoration: none;
}

ul {
	list-style: none;
}

.side .side_menu>ul>li:hover {
	background-color: antiquewhite;
	color: black;
}

.side .side_menu>ul>li {
	padding: 0px 0px 0px 10px;
}

.content {
	float: right;
	width: 970px;
	font-size: 16px;
	font-weight: 500;
	color: black;
	line-height: 40px;
	display: block;
	padding: 0px 50px 0px 0px;
}

/* .float끝나는 영역을 가상으로 생성하고 clear(가상선택자) */
#dd::after {
	content: "";
	display: block;
	clear: both;
}

.row-empty2 {
	height: 25px;
}

.join_btn {
	font-size: 13px;
	padding: 4px;
	background-color: #F98967;
	color: white;
	border: none;
}
</style>
<!-- css style 끝 -->

<body>
	<div id="dd">
		<hr>
		<h2 style="margin: 20px 50px 10px"><%=UGdto.getUser_id()%>님의 정보를
			비밀번호를 수정하시나요?
		</h2>
		<div class="row-empty"></div>
		<!-- side_menu시작 -->

		<div class="side">

			<div class="side_menu">

				<ul>
					<div style="margin: 0px 10px;">내 정보</div>
					<hr>
					<li><a
						href="<%=request.getContextPath()%>/info/users_history.jsp">이용내역</a>
					</li>
					<li><a
						href="<%=request.getContextPath()%>/info/users_review.jsp">이용후기</a>
					</li>
					<li><a href="users_check.jsp?go=/info/users_change_info.jsp">정보수정</a>

					</li>
					<li><a href="users_check.jsp?go=/info/users_exit.do">회원탈퇴</a>
					</li>
					<li><a
						href="<%=request.getContextPath()%>/info/users_point.jsp">포인트내역</a>
					</li>
					<hr>
				</ul>
			</div>
			<!-- side_menu끝 -->
		</div>
		<!-- side끝 -->



		<section>
			<div align="center">
				<h1>신규 비밀번호 입력</h1>
				<form action="users_change_pw.do" method="post">

					<input type="password" name="user_pw" required> <input
						class="join_btn" type="submit" value="완료">

				</form>
			</div>
	</div>
</body>
<hr>
</section>
<jsp:include page="/template/footer.jsp"></jsp:include>