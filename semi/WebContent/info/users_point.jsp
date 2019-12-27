<%@page import="beans.Users_Content_History_Dao"%>
<%@page import="beans.Users_Info_Dao"%>
<%@page import="beans.Users_Get_Dto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>

<%
	Users_Info_Dao UIdao = new Users_Info_Dao();
	String user_id = (String) session.getAttribute("user_id");
	Users_Get_Dto UGdto = UIdao.users_get(user_id);
	
	String users_history_id = (String) session.getAttribute("user_id");
	Users_Content_History_Dao UCHdao = new Users_Content_History_Dao();
	int money = UCHdao.users_pay_total(users_history_id);
%>
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
	    border: 1px solid black; 
	
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
	width: 700px;
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

.row-empty {
	height: 25px;
}

.join_btn {
	font-size: 13px;
	padding: 4px;
	background-color: #F98967;
	color: white;
	border: none;
}
#money{
	color: #F98967;
	font-size: 25px;
}

</style>
<!-- css style 끝 -->


<!-- 포인트 테이블은 없어서 보유 포인트만 나오도록 했습니다 -->
<body>
	<div id="dd">
		<hr color="#F98967">

		<h2 style="margin: 20px 50px 10px"><%=user_id%>님의 포인트 내역
		</h2>
		<div class="row-empty"></div>


		<!-- side_menu시작 -->
		<div class="side">

			<div class="side_menu">

				<ul>
					<div style="margin: 0px 10px;">
                		<a style="text-decoration: none; color: black;" href="<%=request.getContextPath() %>/info/users_info.jsp">내 정보</a>
                	</div>
					<hr color="#F98967">
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
					<hr color="#F98967">
				</ul>
			</div>
			<!-- side_menu끝 -->
		</div>
		<!-- side끝 -->
		
			<div class="content">
			<div class="row-empty"></div>
			<div class="row-empty"></div>
				<div>회원님의 포인트는</div>
				<div><%=UGdto.getUser_point()%>point입니다</div>
			<div class="row-empty"></div>
				<div>회원님의 총 이용금액은</div>
				<div><a id="money"><%=money%></a>원입니다</div>
			</div>


	</div>
		<div class="row-empty"></div>
		<div class="row-empty"></div>
</body>
<hr color="#F98967">
<jsp:include page="/template/footer.jsp"></jsp:include>