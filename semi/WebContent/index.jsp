<%@page import="java.util.List"%>
<%@page import="beans.Host_Content_Dto"%>
<%@page import="beans.Host_Content_Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<jsp:include page="/template/header.jsp"></jsp:include>

<%
Host_Content_Dao HCdao = new Host_Content_Dao();
List<Host_Content_Dto> HClist = HCdao.mainViewTop5();
%>


<style>

/* 전체 글꼴 */
@font-face {
   font-family: NanumSquareR;
   src: url("../font/NanumSquareR.ttf");
}

a{
text-decoration:none;
color:black;
}

.end{
	color:red;
	}

.ing{
	color:blue;
	}

.sohee-title {
   color: white;
   background-color: #F98967;
   opacity: 100%;
   padding: 10px;
   font-size: 14px;
   text-decoration:none;
}

/* 소희-카테고리 이미지 라운드로 */
.gallary>.gallary-item> .category-image >a>img {
   width: 100%;
   border-radius: 50%;
   text-decoration:none;
}

/* 소희-상품 이미지 라운드주기         */
.gallary >.gallary-item > a > img {
   border-radius: 3%;
   text-decoration:none;
}

/* 소희-상품 카테고리글꼴스타일       */
.gallary-text-category {
   color: grey;
   font-size: 10px;
   padding: 5px;
   text-decoration:none;
}

/* 소희-상품명 글꼴스타일       */
.gallary-text-content {
   color: black;
   font-size: 14px;
   opacity: "10";
   padding: 5px;
   text-decoration:none;
}

/* 소희-상품 가격 글꼴스타일       */
.gallary-text-cost {
   color: black;
   font-size: "14px;
   opacity: "10";
   font-weight: bold;
   padding: 5px;
   border-radius: 10%;
   text-decoration:none;
}

/* 소희-회색 테두리 ,필요하       */
.gallary-border {
   border: 1px solid grey;
   text-decoration:none;
}
</style>


<section>


   <!-- 이미지 슬라이더 템플릿 -->
   <hr color="#F9896">
   <jsp:include page="/template/slider.jsp"></jsp:include>
   
   
   <article>
   <hr>
      <!-- 당일치기 TOP5 시작 -->
         <div class="sohee-title">당일치기 TOP 5!</div>
         <div class="row-empty"></div>
         <h4 class="gallary-text-category">
            <a href="#">전체보기</a>
         </h4>
         
      <!-- TOP5 시작 -->
      
      <div class="gallary">
         
         <%for(Host_Content_Dto HCdto : HClist){ %>
         <div class="gallary-item">
            <a href="<%=request.getContextPath()%>/board/host_content_detail_view.jsp?host_content_no=<%=HCdto.getHost_content_no()%>">
               <img src="<%=request.getContextPath()%>/board/download1.do?Host_content_no=<%=HCdto.getHost_content_no()%>"></a>
            <!-- 카테고리 -->
            <div class="gallary-text-category">
               <span><%=HCdto.getHost_content_category() %></span>
            </div>
            <!-- 컨텐츠 제목 -->
            <div class="gallary-text-content">
               <span><%=HCdto.getHost_content_name() %>
                  <%if(HCdto.getHost_content_ticket() > 0){ %>
                     <div class="ing">(예약 가능)</div>   
                  <%} else{ %>
                     <div class="end">(마감)</div>
                  <%} %>
               </span>
            </div>
            <!-- 컨텐츠 가격 -->
            <div class="gallary-text-cost">
               <span><%=HCdto.getHost_content_cost() %>원</span>
            </div>
         </div>
         <%} %>
      </div>
   </article>


   <!-- 카테고리 이미지 넣기 시작 -->

   <article>
      <hr>
      <div class="sohee-title">어떤클래스를하실건가요</div>
      <div class="row-empty"></div>

      <!-- 액티비티 카테고리 시작 -->
      <div class="gallary" align="center">
         <div class="gallary-item">
         <div class="category-image">
            <a
               href="<%=request.getContextPath()%>/board/host_content_list.jsp?category=액티비티">
               <img src="http://placeimg.com/480/480/people">
            </a> </div> <a href="<%=request.getContextPath()%>/board/host_content_list.jsp?category=액티비티">
               액티비티</a>
         </div>
         <!-- 액티비티 카테고리 종료 -->

         <!-- 배움 카테고리 시작 -->
         <div class="gallary-item" align="center">
         <div class="category-image">
            <a href="<%=request.getContextPath()%>/board/host_content_list.jsp?category=배움">
               <img src="http://placeimg.com/480/480/tech"></a> </div>
               <a href="<%=request.getContextPath()%>/board/host_content_list.jsp?category=배움">
               배움</a>
         </div>
         <!-- 배움 카테고리 종료 -->

         <!-- 건강뷰티 카테고리 시작 -->
         <div class="gallary-item" align="center">
         <div class="category-image">
            <a href="<%=request.getContextPath()%>/board/host_content_list.jsp?category=건강/뷰티">
               <img src="http://placeimg.com/480/480/any"></a></div> 
               <a href="<%=request.getContextPath()%>/board/host_content_list.jsp?category=건강/뷰티">건강/뷰티</a>
         </div>
         <!-- 건강뷰티 카테고리 종료 -->

         <!-- 모임 카테고리 시작 -->
         <div class="gallary-item">
         <div class="category-image">
            <a href="<%=request.getContextPath()%>/board/host_content_list.jsp?category=모임">
               <img src="http://placeimg.com/480/480/tech"></a></div> 
            <a href="<%=request.getContextPath()%>/board/host_content_list.jsp?category=모임">모임</a>
         </div>
         <!-- 모임 카테고리 종료 -->

         <!-- 여행 카테고리 시작 -->
         <div class="gallary-item">
         <div class="category-image">
            <a href="<%=request.getContextPath()%>/board/host_content_list.jsp?category=여행">
               <img src="http://placeimg.com/480/480/nature"></a></div> 
            <a href="<%=request.getContextPath()%>/board/host_content_list.jsp?category=여행">여행</a>
         </div>
      </div>
      <!-- 여행 카테고리 종료 -->
   </article>
   <hr>
   <!-- 카테고리 이미지 넣기 종료 -->
   
</section>
<hr color="#F9896">
<jsp:include page="/template/footer.jsp"></jsp:include>