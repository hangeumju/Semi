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


<!-- <style>
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
</style> -->

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/host_main.css">
<jsp:include page="/template/host_header.jsp"></jsp:include>
<body>
    <div class="auction-online-current">
	<div class="title" align ="center">
				<h1>환영합니다!</h1>
				<h3> 호스트 <%=HIdto.getHost_name() %> 
				(<%=HIdto.getHost_id()%>) 님 ! </h3>

	</div>
		</div>
			<!--     공지사항 창입니다 아직 공지사항이 구현되지 않아 이곳도 미구현입니다 -->
<jsp:include page="/template/host_footer.jsp"></jsp:include>