<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/common.css">
    <link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">
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
</head>

<body test>
    <main>
        <header>
            <div>
                <img src="http://placehold.it/100x30?text=logo">
            </div>
            <div>
                <input type="text" placeholder="검색창">
            </div>
            <div class="menu">
                <a href="#">회원가입</a>
                <a href="#">로그인</a>
            </div>
        </header>

        <section onload="loadSlider()" >
	        <!-- 이미지 슬라이더 영역 -->
	        <div class="swiper-container">
	
	        <!-- 이미지가 들어갈 영역 시작 -->
	        <div class="swiper-wrapper">
	            
	            <!-- 이미지 설정(div 안에 img 태그 배치) -->
	            <div class="swiper-slide">
	                <img src="http://placehold.it/300x100?text=A">
	            </div>
	            <div class="swiper-slide">
	                <img src="http://placehold.it/300x100?text=B">    
	            </div>
	            <div class="swiper-slide">
	                <img src="http://placehold.it/300x100?text=C">    
	            </div>
	            
	        </div>
	        <!-- 이미지가 들어갈 영역 종료 -->
	
	
	        <!-- 하단에 네비게이터가 필요한 경우 생성 -->
	        <div class="swiper-pagination"></div>
	
	        <!-- 이전/다음 버튼 시작 -->
	        <div class="swiper-button-prev"></div>
	        <div class="swiper-button-next"></div>
	        <!-- 이전/다음 버튼 종료 -->
	
	        <!-- 스크롤바가 필요한 경우 생성 -->
	        <div class="swiper-scrollbar"></div>
	
	    </div>
	    <!-- 이미지 슬라이더 영역 종료 -->
            <article>
                <div class="row-empty"></div>
                <div class="row-empty"></div>
                <div id=a>
                    <h4>핫핫핫핫 클래스</h4>
                </div>
                <div id=a>
                    <h4><a href="#">전체보기</a></h4>
                </div>
            
            <div class="gallary">
                <div class="gallary-item">
                    <div class="gallary-image">
                        <img src="http://placeimg.com/480/480/animals">
                    </div>
                    <div class="gallary-text">
                        <h4>Lorem Ipsum</h4>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                        </p>
                    </div>
                </div>
                <div class="gallary-item">
                    <div class="gallary-image">
                        <img src="http://placeimg.com/480/480/nature">
                    </div>
                    <div class="gallary-text">
                        <h4>Lorem Ipsum</h4>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                        </p>
                    </div>
                </div>
                <div class="gallary-item">
                    <div class="gallary-image">
                        <img src="http://placeimg.com/480/480/people">
                    </div>
                    <div class="gallary-text">
                        <h4>Lorem Ipsum</h4>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                        </p>
                    </div>
                </div>
                <div class="gallary-item">
                    <div class="gallary-image">
                        <img src="http://placeimg.com/480/480/tech">
                    </div>
                    <div class="gallary-text">
                        <h4>Lorem Ipsum</h4>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                        </p>
                    </div>
                </div>
                <div class="gallary-item">
                    <div class="gallary-image">
                        <img src="http://placeimg.com/480/480/tech">
                    </div>
                    <div class="gallary-text">
                        <h4>Lorem Ipsum</h4>
                        <p>
                            Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                        </p>
                    </div>
                </div>
            </div>
            </article>
        </section>
        <footer>
            대표: 임수열

            개인정보 관리 책임자: 양대현

            사업자등록번호: 261-81-04385

            통신판매업신고번호: 2016-서울성동-01088

            이메일: contact@frientrip.com

            대표전화: 070-7169-1466

            고객센터: 02-512-3662

            업무시간: 평일 11:00 - 18:00 (점심: 13:00 - 14:00)

            주소: 서울특별시 성동구 왕십리로 115 헤이그라운드 서울숲점 G601

            이용약관
            개인정보 처리방침
            위치기반 서비스 이용약관
        </footer>
    </main>
</body></html>