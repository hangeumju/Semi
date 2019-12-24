<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
String user_id = (String) session.getAttribute("user_id");
String host_id = (String) session.getAttribute("host_id");
boolean login = user_id == null;

%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Document</title>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
<!-- <link rel="stylesheet"
	href="https://unpkg.com/swiper/css/swiper.min.css"> -->

<link rel="icon" type="image/png" href="#"> <!-- 이것의 href가 #이면 현재페이지를 한번더 불러옵니다! -->

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css">

<!-- <script src="https://unpkg.com/swiper/js/swiper.min.js"></script> -->
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
String userregist = request.getContextPath()+"/join/users_regist.jsp";
String hostlogin = request.getContextPath()+"/template/host_login.jsp";
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
	
</script>

<script>
	function userLoginModal(){
		var loginform = document.querySelector(".userform");
		loginform.action = "<%=userlogin%>";
	}
	
	function userRegistModal(){
		var loginform = document.querySelector(".userform");
		loginform.action = "<%=userregist%>";
	}
</script>

<script>
	function openHost(){
		window.open("<%=hostlogin%>");
	}
</script>

</head>

<body>
	<main>
		<header style="padding: 100px 32px 0px 32px">
		<div class="flex-container">
			<div style="height: 30px;"></div>
			<div class="flex-item-gnb">
				<div>
					<%if(login){ %>
					<button class="a" onclick="openLoginModal();">일반회원</button>
					<%} else{ %>
					<button class="a" onclick="location.href='<%=request.getContextPath()%>/info/users_info.jsp'">내정보</button>
					<button class="a" onClick="location.href='<%=request.getContextPath()%>/login/users_logout.do'">로그아웃</button>
					<%} %>
					<button class="a" onclick="openHost();">호스트</button>
					<button class="a">고객센터</button>
				</div>
			</div>
		</div>
		
		<!-- 로그인 모달화면 분리 -->
		<%-- <jsp:include page="/template/user_login.jsp"></jsp:include> --%>
			
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