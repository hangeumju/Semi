<%@page import="beans.Host_Info_Dao"%>
<%@page import="beans.Host_Info_Dto"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	/////////////절대경로 변수
	String context = request.getContextPath();
	Host_Info_Dao HIdao = new Host_Info_Dao();
	//Host_Info_Dto HIdto = new Host_Info_Dto();
	String host_id = (String) session.getAttribute("host_id");
	Host_Info_Dto HIdto = HIdao.get(host_id);
%>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/host_main.css">
<jsp:include page="/template/host_header.jsp"></jsp:include>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호스트 메인</title>

<style>
.custom-menu {
	list-style: none;
	margin: 0;
	padding: 0;
	display: block;
	width: 150px;
}

.custom-menu>li {
	background-color: #F98967;
	padding: 15px;
	cursor: pointer;
}

.custom-menu a {
	text-decoration: none;
	color: white;
}

/* 	상세내용이 밑으로 나오게 하는 곳 */
.custom-menu ul {
	list-style: none;
	padding: 0;
	margin: 0;
	position: relative;
	display: none;
}

.custom-menu ul>li {
	background-color: #F98967;
	color: white;
	padding: 15px;
	width: 150px;
}

/* 		호버상태에서 세부 내용 보이게 하는 곳] */
.custom-menu li:hover>ul {
	display: block;
}

.custom-menu li {
	overflow: hidden;
	white-space: nowrap;
	text-overflow: ellipsis;
}

.gallary>.gallary-item {
	float: left;
	width: 33.333% !important;
	padding: 10px;
}

.w-80 {
	height: 400px;
}
</style>

</head>
<body>
	<article class="w-80">
		<div class="gallary">
			<div class="row-left gallary-item">
				<ul class="custom-menu">
					<li><a href="<%=context%>/info/host_info.jsp">호스트내정보</a>
						<ul>
							<li><a href="<%=context%>/info/host_change_info.jsp">정보
									수정</a></li>
							<li><a href="<%=context%>/info/host_info.jsp">탈퇴</a></li>
						</ul></li>
					<li><a href="#">컨텐츠 관리</a>
						<ul>
							<li><a href="#">상품 등록</a></li>
							<li><a href="#">상품 리스트</a></li>
							<li><a href="#">리뷰 관리</a></li>
							<li><a
								href="<%=request.getContextPath()%>/board/reservation_chart.jsp">예약자
									관리</a></li>
						</ul></li>
					<li><a href="#">정산</a></li>

				</ul>
			</div>
			<div class="gallary-item">
				<h1>환영합니다!</h1>
				<h3>
					호스트 (<%=HIdto.getHost_id()%>) 님!
				</h3>

			</div>
			<!--     공지사항 창입니다 아직 공지사항이 구현되지 않아 이곳도 미구현입니다 -->
			<div class="gallary-item">공지사항</div>
		</div>

	</article>
</body>
</html>