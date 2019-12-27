<%@page import="beans.Users_Get_Dto"%>
<%@page import="beans.Users_Change_Info_Dto"%>
<%@page import="beans.Users_Info_Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
	border-radius: 10px;
}

.change_pw_btn {
	margin: 0;
	padding: 0;
	border: 0;
	font-size: 16px;
	font-weight: 500;
	color: #F98967;
	line-height: 40px;
	display: block;
	text-decoration: none;
}
</style>
<!-- css style 끝 -->

<body>
	<div id="dd">
		<hr color="#F9896">

		<h2 style="margin: 20px 50px 10px"><%=UGdto.getUser_id()%>님의 정보를
			수정하시나요?
		</h2>
		<div class="row-empty"></div>
		<!-- side_menu시작 -->
		<div class="side">

			<div class="side_menu">

				<ul>
					<div style="margin: 0px 10px;">
                		<a style="text-decoration: none; color: black;" href="<%=request.getContextPath() %>/info/users_info.jsp">내 정보</a>
                	</div>
					<hr color="#F9896">
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
					<hr color="#F9896">
				</ul>
			</div>
			<!-- side_menu끝 -->
		</div>
		<!-- side끝 -->
</body>

<section>

	<form action="users_change_info.do" method="post">
		<div class="content">
			<div class="row-empty"></div>



			<!-- 전화번호 수정 -->
			<div class="ins_content">
				<span>전화번호</span> <br> <input class="block-item input-item"
					type="text" name="user_phone" placeholder="휴대전화" required>
			</div>

			<!-- 이메일 계정 수정 -->
			<div class="ins_content">
				<span>이메일</span> <br> <input class="input-item" type="text"
					name="user_email_id" placeholder="이메일아이디" required> <span>
					<select class="input-item" name="user_email_domain">
						<option value="" selected disabled hidden>이메일선택</option>
						<option>@naver.com</option>
						<option>@nate.com</option>
						<option>@gmail.com</option>
						<option>@daum.net</option>
						<option>@hanmail.net</option>
				</select>
				</span>
			</div>


			<!-- 관심분야 수정 -->
			<div class="ins_content">
				<span>관심분야 </span> <br> <span> <select
					class="block-item input-item" name="user_Interest">
						<option value="" selected disabled hidden>관심분야</option>
						<option>액티비티</option>
						<option>배움</option>
						<option>건강/뷰티</option>
						<option>모임</option>
						<option>여행</option>
				</select>
				</span>
			</div>
			<br>
			<!-- 정보 수정 및 지우기 버튼 -->

			<input class="join_btn" type="reset" value="지우기"> <input
				class="join_btn" type="submit" value="수정하기">
			<div class="change_pw_btn">
				<h4>
					<a href="users_change_pw.jsp">비밀번호 변경</a>
				</h4>
			</div>




		</div>
		</div>

	</form>
</section>
<hr color="#F9896">
<jsp:include page="/template/footer.jsp"></jsp:include>