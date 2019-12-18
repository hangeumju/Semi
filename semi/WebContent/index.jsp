<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/template/header.jsp"></jsp:include>
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
        
        <jsp:include page="/template/footer.jsp"></jsp:include>
