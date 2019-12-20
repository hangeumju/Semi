<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%

String user_id = (String) session.getAttribute("user_id");
boolean login = user_id != null;

String host_id = (String) session.getAttribute("host_id");
boolean host_login = host_id != null;

%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Document</title>
<link rel="stylesheet" type="text/css" 
href="<%=request.getContextPath()%>/css/common.css">
<link rel="stylesheet"
	href="https://unpkg.com/swiper/css/swiper.min.css">
<link rel="icon" type="image/png" href="#">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.6.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/font-awesome/4.6.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css">

<script src="https://unpkg.com/swiper/js/swiper.min.js"></script>
<script>
	function loadSlider() {
		//swiper 객체 생성
		var sw = new Swiper('.swiper-container', {
			//옵션... 생략이 가능
			//자동재생 옵션
			autoplay : {
				delay : 3000,
			},
			//direction : 방향(vertical / horizontal)
			direction : 'horizontal',
			//높이를 맞추고 싶을 경우 사용
			autoHeight : true,
			//사진 전환 속도(사진이 전환 시작~끝까지 걸리는 시간)
			speed : 300,
			//loop : 무한반복 설정(true / false)
			loop : true,
			// 하단 네비게이션이 있는 경우 설정
			pagination : {
				el : '.swiper-pagination',
				type : 'bullets',
				clickable : true,//클릭이 가능하도록 설정
			},
			// 좌우 이동 버튼이 있는 경우 설정
			navigation : {
				nextEl : '.swiper-button-next',
				prevEl : '.swiper-button-prev',
			},
			// 스크롤바가 있는 경우 설정
			scrollbar : {
				el : '.swiper-scrollbar',
			},
			// 사진 전환 효과가 필요한 경우 설정(아래 중 택1)
			// effect:'coverflow',
			effect : 'cube',
			// effect:'slide',
			// effect:'fade',
			// effect:'flip',
			//잡는 모양 커서(grab cursor) 활성화 설정
			grabCursor : true,
		});
	}
</script>

<!-- 로그인 모달창 주소 자동변경을 위한 주소 변수 선언 -->
<%
String userlogin = request.getContextPath()+"/login/users_login.do";
String hostlogin = request.getContextPath()+"/login/host_login.do";
%>

<script>
	function openLoginModal() {
		event.preventDefault()
		var modal = document.querySelector(".modal");
		modal.style.display = "block"
	}

	function closeLoginModal() {
		var modal = document.querySelector(".modal");
		modal.style.display = "none"
	}
	
	function userLoginModal(){
		var loginform = document.querySelector(".loginform");
		loginform.action = "<%=userlogin%>";
		var user = document.querySelector(".user");
		user.style.color = "white";
		var host = document.querySelector(".host");
		host.style.color = "gray";
		var userborder = document.querySelector(".user");
		userborder.style.border = "2px white solid";
		var hostborder = document.querySelector(".host");
		hostborder.style.border = "none";
	}
	
	function hostLoginModal(){
		var loginform = document.querySelector(".loginform");
		loginform.action = "<%=hostlogin%>";
		var user = document.querySelector(".user");
		user.style.color = "gray";
		var host = document.querySelector(".host");
		host.style.color = "white";
		var userborder = document.querySelector(".user");
		userborder.style.border = "none";
		var hostborder = document.querySelector(".host");
		hostborder.style.border = "2px white solid";
		
	}
</script>

<script>
function openRegistModal() {
	event.preventDefault()
	var modal = document.querySelector(".modal.regist");
	modal.style.display = "block"
}

function closeRegistModal() {
	var modal = document.querySelector(".modal.regist");
	modal.style.display = "none"
}

function userRegistModal(){
	var loginform = document.querySelector(".registform");
	loginform.action = "http://www.naver.com";
}

function hostRegistModal(){
	var loginform = document.querySelector(".registform");
	loginform.action = "http://www.daum.net";
}

</script>

</head>

<body>
	<main>
		<header style="padding: 100px 32px 0px 32px">
		<div class="flex-container">
			<div class="flex-item">
				<form action="#" autocomplete="off">
					<img src="http://placehold.it/100x30?text=logo">
					<fieldset class="url">
						<input id="url" type="text" name="url"> <label for="url"><i
							class="fa fa-search" aria-hidden="true"></i> Search</label>
						<div class="after"></div>
					</fieldset>
				</form>
			</div>
			<div style="height: 30px;"></div>
			<div class="flex-item-gnb">
				<div>
					<button class="a" onclick="openLoginModal();">로그인</button>
					<button class="a" onclick="location.href='<%=request.getContextPath()%>/info/users_info.jsp'">내정보</button>
					<%if(login){ %>
					<button class="a" onClick="location.href='<%=request.getContextPath()%>/login/users_logout.do'">로그아웃</button>
					<%} %>
					<button class="a" onclick="openRegistModal();">회원가입</button>
				</div>
			</div>
		</div>
		
		<!-- 로그인 모달화면 분리 -->
		<jsp:include page="/template/total_login.jsp"></jsp:include>
		
			
			<!-- 회원가입 모달화면 구현 -->
			<form class="registform" autocomplete="off" action="#" method="post">
				<div class="modal regist" onclick="closeRegistModal();">
					<!-- 모달내부 화면 -->
					<div class="modal-view regist" onclick="event.stopPropagation();">
						<div style="position: relative; width: 100%; height: 100%;">
							<div style="position: absolute; top: 20px; right: 20px;">
								<span class="closebtn" onclick="closeRegistModal()">&times;</span>
							</div>
							<div
								style="position: absolute; top: 50%; left: 50%; width: 300px; height: 400px; margin-left: -150px; margin-top: -200px;">
								<div style="height: 60px;"></div>
								<div style="margin: 10px 0px; color: white;">
								<button class="modalbtn regist" onclick="userRegistModal()">일반회원 가입</button>
								</div>
								<div style="height: 5px;"></div>
								<div style="margin: 10px 0px; color: white;">
								<button class="modalbtn regist" onclick="hostRegistModal()">호스트 가입</button>
								</div>
								<div style="height: 50px;"></div>
							</div>
						</div>
					</div>
				</div>
			</form>

		</header>