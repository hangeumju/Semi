<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
String user_id = (String) session.getAttribute("user_id");
String host_id = (String) session.getAttribute("host_id");
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
						<li onclick="openLoginModal();">로그인</li>
					<%} else{%>
						<li>환영합니다 <%=user_id %>님<img src="<%=request.getContextPath() %>/image/dropdown.png">
							<ul>
								<li onclick="location.href='<%=request.getContextPath()%>/info/users_info.jsp'">내정보</li>
								<li onClick="location.href='<%=request.getContextPath()%>/login/users_logout.do'">로그아웃</li>
							</ul>
						</li>
						<%} %>
						<li>|</li>
						<li onclick="openHost();">호스트</li>
						<li>|</li>
						<li>고객센터</li>
				</ul>
			</div>

		<!-- 로그인 모달화면 분리 -->
		<jsp:include page="/login/user_login.jsp"></jsp:include>

	</header>