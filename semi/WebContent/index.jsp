<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="/template/header.jsp"></jsp:include>
<style>


/* 전체 글꼴 */
      @font-face {
	font-family: NanumSquareR;
	src: url("../font/NanumSquareR.ttf");
}  

/* 소희-카테고리 이미지 라운드로 */
	 .gallary > .gallary-item > .category-image > img {
            width:100%;
            border-radius: 50%;
            opacity: 0.5;
        }

/* 소희-상품 이미지 라운드주기         */
     .gallary > .gallary-item > a > .gallary-image > img {
 	     border-radius: 3%;
 	  }
 	  
/* 소희-상품 카테고리글꼴스타일 	   */
	.gallary-text-category{
        color: grey;
        font-size: 10px;
        opacity: "10";
        padding: 5px;
        }
      
/* 소희-상품명 글꼴스타일 	   */  
 	.gallary-text-content{
        color: black;
        font-size:14px;
        opacity: "10";
        padding: 5px;
        }

/* 소희-상품 가격 글꼴스타일 	   */     
 	  .gallary-text-cost{
 	  	color:black;
 	  	font-size:"14px;
        opacity: "10";
        font-weight:bold;
        padding: 5px;
        border-radius: 10%;
 	  }
 	  
/* 소희-회색 테두리 ,필요하 	   */    	  
 	  .gallary-border{
 	  border:1px solid grey;
 	  }
</style>

 	  
 	  
       

        <section onload="loadSlider()" >
	        <!-- 이미지 슬라이더 영역 -->
	        <div class="swiper-container">
	
	        <!-- 이미지가 들어갈 영역 시작 -->
	        <div class="swiper-wrapper">
	            
	            <!-- 이미지 설정(div 안에 img 태그 배치) -->
	            <div class="swiper-slide">
	                <img src="<%=request.getContextPath()%>/image/main_banner.jpg">
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
	    <hr><!-- 이미지 슬라이더 영역 종료 -->
	    
	    <!-- 카테고리 이미지 넣기 시작 -->

	    <article>
	   <div class="row-empty"></div>
       <div class="row-empty"></div>
       

       <div class="gallary">
      		<div class="gallary-item">
	    		<div class="category-image">
	          		<img src="http://placeimg.com/480/480/tech">
	            <div align="center">액티비티</div>
	    	</div>
	   </div>

	   
	    <div class="gallary">
      		<div class="gallary-item">
	    		<div class="category-image">
	          		<img src="http://placeimg.com/480/480/tech">
	            <div align="center">배움</div>
	    	</div>
	   </div>
	   
	   <div class="gallary">
      		<div class="gallary-item">
	    		<div class="category-image">
	          		<img src="http://placeimg.com/480/480/any">
	            <div align="center">건강/뷰티</div>
	    	</div>
	   </div>
	   
       <div class="gallary">
      		<div class="gallary-item">
	    		<div class="category-image">
	          		<img src="http://placeimg.com/480/480/tech">
	            <div align="center">모임</div>
	    	</div>
	   </div>

	   <div class="gallary">
      		<div class="gallary-item">
	    		<div class="category-image">
	          		<img src="http://placeimg.com/480/480/any">
	            <div align="center">여행</div>
	    	</div>
	   </div>


	    

	    </article>
	    
	    
	   <hr><!-- 카테고리 이미지 넣기 종료 -->
	   
	    
	    	<!-- 핫핫핫핫 클래스  이미지 넣기 시작 -->
            <article>
            
          
                <div id=a>
                    <h4  style="color:#bca4bd; background-color: #F98967 " >핫핫핫핫 클래스(추후 랜덤이미지 넣기)</h4>
                <div class="row-empty"></div>
                </div>
                <div id=a>
                    <h4 class="gallary-text-category"><a href="#" >전체보기</a></h4>
                </div>

            
            <div class="gallary">
                <div class="gallary-item">
                	<a href="https://ko.wikipedia.org/wiki/%EB%A1%9C%EB%A0%98_%EC%9E%85%EC%88%A8">
                    	<div class="gallary-image">
                        	<img src="http://placeimg.com/480/480/animals">
                    	</div>
	                    	
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
             
            		</a>
            		
            		<div class="gallary-item">
                	<a href="https://ko.wikipedia.org/wiki/%EB%A1%9C%EB%A0%98_%EC%9E%85%EC%88%A8">
                    	<div class="gallary-image">
                        	<img src="http://placeimg.com/480/480/nature">
                    	</div>
	                    	
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

            		</a>
            		
            		<div class="gallary-item">
                	<a href="https://ko.wikipedia.org/wiki/%EB%A1%9C%EB%A0%98_%EC%9E%85%EC%88%A8">
                    	<div class="gallary-image">
                        	<img src="http://placeimg.com/480/480/nature">
                    	</div>
	                    	
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

            		</a>
            		
            		<div class="gallary-item">
                	<a href="https://ko.wikipedia.org/wiki/%EB%A1%9C%EB%A0%98_%EC%9E%85%EC%88%A8">
                    	<div class="gallary-image">
                        	<img src="http://placeimg.com/480/480/nature">
                    	</div>
	                    	
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

            		</a>
            		
            		<div class="gallary-item">
                	<a href="https://ko.wikipedia.org/wiki/%EB%A1%9C%EB%A0%98_%EC%9E%85%EC%88%A8">
                    	<div class="gallary-image">
                        	<img src="http://placeimg.com/480/480/nature">
                    	</div>
	      
		                    	<div class="gallary-text-category" >  
                    			카테고리:뷰티
				                </div>
			                    <div class="gallary-text-content">
		                        컨텐츠명
			                   </div>
                  			  <div class="gallary-text-cost">
                     		   40000원
                  			 </div>
        
			    	</div>
            		</a>

				</div>
            </article>
	    	<!-- 핫핫핫핫 클래스  이미지 넣기 종료 -->
	    	



        </section>
        
        <jsp:include page="/template/footer.jsp"></jsp:include>
