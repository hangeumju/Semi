<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 유저 비밀번호 변경 입력 결과창-->

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

/* 완료버튼 */
.join_btn {
	font-size: 13px;
	padding: 4px;
	background-color: #F98967;
	color: white;
	border: none;
}

.going_home_text {
	color: #F98967;
	font-size: 14px;
	opacity: "10";
	padding: 5px;
}
</style>
<!-- css style 끝 -->

<body>
	<div id="dd">
<hr>
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
   <div align = "center">
   
   <h2> 비밀번호 변경이 완료되었습니다</h2>
   
   <h4 class="going_home_text"><a href="<%=request.getContextPath()%>">메인 페이지로 이동</a></h4>
   
   </div>
   </section>
   </div>
   </body>
   