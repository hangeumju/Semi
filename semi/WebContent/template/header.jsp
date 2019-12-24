<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
String user_id = (String) session.getAttribute("user_id");
String host_id = (String) session.getAttribute("host_id");
boolean login = user_id == null;

%>

<%if(request.getParameter("error") != null) {%>
<script>
window.alert("로그인 정보가 맞지 않습니다");
</script>
<%} %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Document</title>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">

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
String userregist = request.getContextPath()+"/join/users_regist.jsp";
String hostlogin = request.getContextPath()+"/login/host_login.jsp";
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
	function userRegistModal(){
		var loginform = document.querySelector(".userform");
		loginform.action = "<%=userregist%>";
	}
	
	function openHost(){
		window.open("<%=hostlogin%>")
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
		<jsp:include page="/login/user_login.jsp"></jsp:include>
			
		</header>