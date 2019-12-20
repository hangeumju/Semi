<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		loginform.action = "http://www.naver.com";
		var user = document.querySelector(".user");
		user.style.color = "white";
		var host = document.querySelector(".host");
		host.style.color = "gray";
	}
	
	function hostLoginModal(){
		var loginform = document.querySelector(".loginform");
		loginform.action = "http://www.daum.net";
		var user = document.querySelector(".user");
		user.style.color = "gray";
		var host = document.querySelector(".host");
		host.style.color = "white";
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

<body test>
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

<!-- 			로그아웃 그냥 넣었어요 나중에 지워주세요~-->
			<div>
				<form action="<%=request.getContextPath()%>/logout/host_logout.do">
				<input type="button" value="로그아웃">
				</form>
			</div>

			<div style="height: 30px;"></div>

			<div class="flex-item-gnb">
				<div>
					<button class="a" onclick="openLoginModal();">로그인</button>
					<button class="a" onclick="openRegistModal();">회원가입</button>
				</div>
			</div>
		</div>
		
			<!-- 로그인 모달화면 구현 -->
			<form class="loginform" autocomplete="off" action="http://www.naver.com" method="post">
				<div class="modal" onclick="closeLoginModal();">
					<!-- 모달내부 화면 -->
					<div class="modal-view" onclick="event.stopPropagation();">
						<div style="position: relative; width: 100%; height: 100%;">
							<div style="position: absolute; top: 20px; right: 20px;">
								<span class="closebtn" onclick="closeLoginModal()">&times;</span>
							</div>
							<div
								style="position: absolute; top: 50%; left: 50%; width: 300px; height: 400px; margin-left: -150px; margin-top: -200px;">
								<div style="height: 50px;"></div>
								<div style="margin: 10px 0px; text-align: center;">
									<span class="user" style="margin-right: 50px; color: white; cursor: pointer;" onclick="userLoginModal()">일반회원</span>
									<span class="host" style="margin-left: 50px; color: gray; cursor: pointer;" onclick="hostLoginModal()">호스트</span>
								</div>
								<div style="height: 30px;"></div>
								<div style="margin: 10px 0px; color: white;">
									<p>Username</p>
									<input type="text" name="id"
										style="border-bottom: 2px white solid; width: 100%;">
								</div>
								<div style="height: 5px;"></div>
								<div style="margin: 10px 0px; color: white;">
									<p>Password</p>
									<input type="password" name="pw"
										style="border-bottom: 2px white solid; width: 100%;">
								</div>
								<div style="height: 60px;"></div>
								<button class="modalbtn">로그인</button>
							</div>
						</div>
					</div>
				</div>
			</form>
			
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
								<div style="height: 50px;"></div>
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