<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/template/header.jsp"></jsp:include>


        <section onload="loadSlider()" >
	        <!-- 이미지 슬라이더 영역 -->
	        <div class="swiper-container">
	
	        <!-- 이미지가 들어갈 영역 시작 -->
	        <div class="swiper-wrapper">
	            
	            <!-- 이미지 설정(div 안에 img 태그 배치) -->
	            <div class="swiper-slide">
	                <img src="<%=request.getContextPath()%>/image/main_banner.jpg">
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
	    
	    <!--  -->
            <article>
                <div class="row-empty"></div>
                <div class="row-empty"></div>
                <div id=a>
                    <h4>핫핫핫핫 클래스</h4>
                </div>
                <div id=a>
                    <h4><a href="#">전체보기</a></h4>
                </div>
            
    
<style>
/* .gallary-box{ */
/* width:100px; */
/* height:100px; */
/* padding:20px; */
/* border:1px solid red; */
/* margin:10 10 10 10; */

/* } */

	.gallary-text-category{
        color: grey;
        font-size:"10";
        opacity: "10"
        }
 	.gallary-text-content{
        color: black;
        font-size:"14";
        opacity: "10";
        }
 	  .gallary-text-cost{
 	  	color:black;
 	  	font-size:"14";
        opacity: "10";
        font-weight:bold;
 	  }
 	  
 	  .gallary-border{
 	  border:1px solid grey;
 	  }
        
</style>
            

            
            <div class="gallary">
                <div class="gallary-item">
                	<a href="https://ko.wikipedia.org/wiki/%EB%A1%9C%EB%A0%98_%EC%9E%85%EC%88%A8">
                    <div class="gallary-image">
                        <img src="http://placeimg.com/480/480/animals">
                    </div>
                    <div class="gallary-border">
                    <div class="gallary-text-category">  
                    	카테고리:뷰티
                   </div>
                   <div class="gallary-text-content">
                        컨텐츠명
                   </div>
                   <div class="gallary-text-cost">
                        40000원
                   </div>
                    </div>
</div>
                </div>
            </a>
                
                <div class="gallary-item">
                    <div class="gallary-image">
                        <img src="http://placeimg.com/480/480/nature">
                       </div>
                    <div class="gallary-border">
                    <div class="gallary-text-category">  
                    	카테고리:뷰티
                   </div>
                   <div class="gallary-text-content">
                        컨텐츠명
                   </div>
                   <div class="gallary-text-cost">
                        40000원
                   </div>
                    </div>
                    </div>
                </div>
            </a>
                
                               <div class="gallary-item">
                    <div class="gallary-image">
                        <img src="http://placeimg.com/480/480/nature">
                       </div>
                    <div class="gallary-border">
                    <div class="gallary-text-category">  
                    	카테고리:뷰티
                   </div>
                   <div class="gallary-text-content">
                        컨텐츠명
                   </div>
                   <div class="gallary-text-cost">
                        40000원
                   </div>
                    </div>
                    </div>
                </div>
            </a>
            
                                <div class="gallary-item">
                    <div class="gallary-image">
                        <img src="http://placeimg.com/480/480/nature">
                       </div>
                    <div class="gallary-border">
                    <div class="gallary-text-category">  
                    	카테고리:뷰티
                   </div>
                   <div class="gallary-text-content">
                        컨텐츠명
                   </div>
                   <div class="gallary-text-cost">
                        40000원
                   </div>
                    </div>
                    </div>
                </div>
            </a>
            
                                <div class="gallary-item">
                    <div class="gallary-image">
                        <img src="http://placeimg.com/480/480/nature">
                       </div>
                    <div class="gallary-border">
                    <div class="gallary-text-category">  
                    	카테고리:뷰티
                   </div>
                   <div class="gallary-text-content">
                        컨텐츠명
                   </div>
                   <div class="gallary-text-cost">
                        40000원
                   </div>
                    </div>
                    </div>
                </div>
                
            </a>
            </div>
            </article>
        </section>
        
        <jsp:include page="/template/footer.jsp"></jsp:include>
