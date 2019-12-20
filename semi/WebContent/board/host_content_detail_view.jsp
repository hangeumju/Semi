<%@page import="beans.Host_Content_Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!--     	스타일 영역 시작입니다---------------------------------------------------------- -->
    <style>
		  .float{
		  border: 1px dotted black;
		  float:left;
		  width:25%
		  }  
		  .w-70::after {
            content: "";
            display: block;
            clear: both;
            height : 500px;
        }
		  .main{
		  	width:465px;
			/* 		  	글 안넘어가게 하는 명령어 */
		  	word-break:break-all; 
		  	
		  }
		  
		  .sub{
			width:232px;
		  	position: fixed;
		  	top: 26.3%;
            right: 27.05%;
            height : 400px;
            /* 		  	글 안넘어가게 하는 명령어 */
            word-break:break-all;
		  }
		  
		  .form_button{
		 	 width:100%;
		  }
    </style>
    <!--     	스타일 영역 끝입니다---------------------------------------------------------- -->
   
<!--    슬라이더를 불러옵니다 -->
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/deslider/1.5.1/style.css">
   
     <!--     	스크립트 영역 시작입니다---------------------------------------------------------- -->
    <script type="text/javascript" src="../js/slider.js"></script>
    
    <script>
        

        function loadSlider(){
            var imgSources = [
            {
                link:"http://placehold.it/300x100?text=a",
                caption:"테스트 제목1"
            },

            {
                link:"http://placehold.it/300x100?text=b",
                 caption:"테스트 제목1"
            },
            {
                link:"http://placehold.it/300x100?text=c",
                caption:"테스트 제목1"
            }
            
            ];
            var containerId = '#deslider-container';

            var options = {
                auto: {
                    speed: 2000,//한장이 표시될 밀리초
                    pauseOnHover: true,//hover 상태의 재생여부
                },
                fullScreen: true,
                swipe: true,
                pagination: true,
                repeat: true
            };

            var myDeslider = new Deslider(imgSources, containerId, options);
             }

        	window.onload=loadSlider;
    </script>
    <!--     	스트립트 영역 시작입니다---------------------------------------------------------- -->
	
	 <!--     	자바 영역 시작입니다---------------------------------------------------------- -->
	<%
		Host_Content_Dao HCdao = new Host_Content_Dao();
		
		
	
	
	
	%>
 <!--     	자바 영역 끝입니다---------------------------------------------------------- -->
	

<jsp:include page="/template/header.jsp"></jsp:include>
	
	<article class="w-70">
		<div class="float">
			
			<div class="main">
				<!-- 이미지 슬라이더 영역 -->
    			<div id="deslider-container"></div>
    			<div><h1>제목</h1></div>
    			<div><h3>가격</h3></div>
    			<div><h2>호스트 정보</h2></div>
    			<div>클래스 상세소개</div>
    			<div>클래스가 언제부터 언제까지인지(스타트 앤 라스트 데이트)</div>
    			<div>위치</div>
    			<div>클래스 보충설명</div>
    			<div>QnA</div>
    			
			</div>
			<div class="sub">
				<div>티켓수량 선택</div>
				<form action="#" method="get">
					<button class="form_button">참여합니다!</button>
				</form>
			</div>
		
	
	</article>
<jsp:include page="/template/footer.jsp"></jsp:include>
