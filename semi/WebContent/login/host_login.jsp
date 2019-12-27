<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
String hostregist = request.getContextPath()+"/join/host_regist.jsp";
%>

<%if(request.getParameter("error") != null) {%>
<script>
window.alert("로그인 정보가 맞지 않습니다");
</script>
<%} %>



<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">

<script>
	function openModal() {
		var modal = document.querySelector(".modal");
		modal.style.display = "block"
	}
	
	function hostRegistModal(){
		var loginform = document.querySelector(".hostform");
		loginform.action = "<%=hostregist%>";
	}

</script>

<style>
.modal{
background-color: rgba(0, 0, 0, 0.1);
}

.banner{
max-width:100%;
left:0;
right:0;
top:0;
bottom:0;
margin:auto;
overflow:auto;
position:fixed;
filter:blur(2px);
}


</style>

</head>
<body onload="openModal()">

<img class="banner" src="../image/hostloginimg.jpg">

<section>
<!-- 호스트 로그인/회원가입 모달화면 구현 -->
			<form class="hostform" autocomplete="off"
			action="<%=request.getContextPath() %>/login/host_login.do" 
			method="post">
				<div class="modal">
					<!-- 모달내부 화면 -->
					<div class="modal-view">
						<div style="position: relative; width: 100%; height: 100%;">
							<div
								style="position: absolute; top: 50%; left: 50%; width: 300px; height: 400px; margin-left: -150px; margin-top: -200px;">
								<div style="height: 30px;"></div>
								<div style="margin: 10px 0px; color: white;">
									<p>Username</p>
									<input class="id-modal" type="text" name="id"
										style="border-bottom: 2px white solid; width: 100%;">
								</div>
								<div style="height: 5px;"></div>
								<div style="margin: 10px 0px; color: white;">
									<p>Password</p>
									<input class="pw-modal" type="password" name="pw"
										style="border-bottom: 2px white solid; width: 100%;">
								</div>
								<div style="height: 90px;"></div>
								<button class="modalbtn">로그인</button>
								<div style="height: 20px;"></div>
								<button class="modalbtn" onclick="hostRegistModal()">회원가입</button>
							</div>
						</div>
					</div>
				</div>
			</form>
</section>
</body>
</html>