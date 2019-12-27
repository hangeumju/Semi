<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
String user_id = (String) session.getAttribute("user_id");
boolean login = user_id == null;

// 로그인 모달창 주소 자동변경을 위한 주소 변수 선언
String userregist = request.getContextPath()+"/join/users_regist.jsp";
String hostlogin = request.getContextPath()+"/login/host_login.jsp";
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Document</title>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/swiper.min.css">
<script src="<%=request.getContextPath()%>/js/swiper.min.js"></script>
<script>
	<%if(request.getParameter("error") != null) {%>
		window.alert("로그인 정보가 맞지 않습니다");
	<%} %>

	function openLoginModal() {
		event.preventDefault()
		var modal = document.querySelector(".modal");
		modal.style.display = "block"
	}

	function closeLoginModal() {
		var modal = document.querySelector(".modal");
		modal.style.display = "none"
	}
	
	function userRegistModal(){
		var loginform = document.querySelector(".userform");
		loginform.action = "<%=userregist%>";
	}
	
	function openHost(){
		window.open("<%=hostlogin%>");
	}
	
</script>

</head>

<body>

	<header>
			<div class="logo row">
				<img src="<%=request.getContextPath() %>/image/header.png">
			</div>
			<div class="menu">
				<ul>
					<%if (login) {%>
						<li class="main" onclick="openLoginModal();">로그인</li>
					<%} else{%>
						<li class="main">환영합니다 <%=user_id %>님<img src="<%=request.getContextPath() %>/image/dropdown.png">
							<ul>
								<li class="sub" onclick="location.href='<%=request.getContextPath()%>/info/users_history.jsp'">이용내역</li>
								<li class="sub" onclick="location.href='<%=request.getContextPath()%>/info/users_review.jsp'">이용후기</li>
								<li class="sub" onclick="location.href='<%=request.getContextPath()%>/info/users_point.jsp'">내포인트</li>
								<li class="sub" onClick="location.href='<%=request.getContextPath()%>/login/users_logout.do'">로그아웃</li>
							</ul>
						</li>
						<%} %>
						<li class="main">|</li>
						<li class="main" onclick="openHost();">호스트</li>
						<li class="main">|</li>
						<li class="main">고객센터</li>
				</ul>
			</div>

		<!-- 로그인 모달화면 분리 -->
		<jsp:include page="/login/user_login.jsp"></jsp:include>

	</header>