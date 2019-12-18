<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/common.css">
    <link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">
    
    <!-- 메인페이지 스타일  -->
    <style>
        .swiper-container{
            width:100%;
        }
        .swiper-container img{
            width:100%;
        }
        
         header>* {
            display: inline-block
        }

        #a {
            display: inline-block
        }
        
        .menu{
            background-color: none
        }
    </style>
	<!-- 메인페이지 스타일 종료 -->

	<!-- 메인페이지 스크립트  -->
    <script src="https://unpkg.com/swiper/js/swiper.min.js"></script>
    <script>
        function loadSlider(){
            //swiper 객체 생성
            var sw = new Swiper('.swiper-container', {
                //옵션... 생략이 가능
                //자동재생 옵션
                autoplay:{
                    delay:3000,
                },
                //direction : 방향(vertical / horizontal)
                direction: 'horizontal',
                //높이를 맞추고 싶을 경우 사용
                autoHeight:true,
                //사진 전환 속도(사진이 전환 시작~끝까지 걸리는 시간)
                speed:300,
                //loop : 무한반복 설정(true / false)
                loop: true,
                // 하단 네비게이션이 있는 경우 설정
                pagination: {
                    el: '.swiper-pagination',
                    type:'bullets',
                    clickable:true,//클릭이 가능하도록 설정
                },
                // 좌우 이동 버튼이 있는 경우 설정
                navigation: {
                    nextEl: '.swiper-button-next',
                    prevEl: '.swiper-button-prev',
                },
                // 스크롤바가 있는 경우 설정
                scrollbar: {
                    el: '.swiper-scrollbar',
                },
                // 사진 전환 효과가 필요한 경우 설정(아래 중 택1)
                // effect:'coverflow',
                effect:'cube',
                // effect:'slide',
                // effect:'fade',
                // effect:'flip',
                //잡는 모양 커서(grab cursor) 활성화 설정
                grabCursor:true,
            });
        }
    </script>
    <!-- 메인페이지 스크립트  종료-->
    
 


	
</head>

