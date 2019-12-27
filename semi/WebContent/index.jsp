<%@page import="java.util.List"%>
<%@page import="beans.Host_Content_Dto"%>
<%@page import="beans.Host_Content_Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/template/header.jsp"></jsp:include>

<%
	// 컨텐츠 불러오기
	Host_Content_Dao HCdao = new Host_Content_Dao();
	String category = request.getParameter("category");
	// 	String category = "액티비티";
	Host_Content_Dto HCdto = new Host_Content_Dto();
	List<Host_Content_Dto> list;
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

/* 소희-상품 카테고리글꼴스타일 	   */
.gallary-text-category {
	color: grey;
	font-size: 10px;
	padding: 5px;
	text-decoration:none;
}

/* 소희-상품명 글꼴스타일 	   */
.gallary-text-content {
	color: black;
	font-size: 14px;
	opacity: "10";
	padding: 5px;
	text-decoration:none;
}

/* 소희-상품 가격 글꼴스타일 	   */
.gallary-text-cost {
	color: black;
	font-size: "14px;
	opacity: "10";
	font-weight: bold;
	padding: 5px;
	border-radius: 10%;
	text-decoration:none;
}

/* 소희-회색 테두리 ,필요하 	   */
.gallary-border {
	border: 1px solid grey;
	text-decoration:none;
}
</style>


<section>

	<!-- 이미지 슬라이더 템플릿 -->
	<hr color="#F9896">
	<jsp:include page="/template/slider.jsp"></jsp:include>



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
	
	<article>
	<!-- TOP5 클래스  이미지 넣기 시작 -->


		<!-- 당일치기 TOP5 시작 -->
<!-- 		<div id=a> -->
			<div class="sohee-title">당일치기 TOP 5!</div>
			<div class="row-empty"></div>
<!-- 		</div> -->
<!-- 		<div id=a> -->
			<h4 class="gallary-text-category">
				<a href="#">전체보기</a>
			</h4>
<!-- 		</div> -->
		<!-- TOP1 시작 -->
		
			<div class="gallary">
			<div class="gallary-item">
				<a href="https://ko.wikipedia.org/wiki/%EB%A1%9C%EB%A0%98_%EC%9E%85%EC%88%A8">
					<img src="http://placeimg.com/480/480/animals"></a>
					<div class="gallary-text-category">
					<a href="https://ko.wikipedia.org/wiki/%EB%A1%9C%EB%A0%98_%EC%9E%85%EC%88%A8">
						<%=HCdto.getHost_content_category()%>:뷰티</a>
					</div>
					<div class="gallary-text-content">
					<a href="https://ko.wikipedia.org/wiki/%EB%A1%9C%EB%A0%98_%EC%9E%85%EC%88%A8">
						<%=HCdto.getHost_content_name()%>:컨텐츠명 </a>
					</div>
					<div class="gallary-text-cost">
					<a href="https://ko.wikipedia.org/wiki/%EB%A1%9C%EB%A0%98_%EC%9E%85%EC%88%A8">
						<%=HCdto.getHost_content_cost()%>:40000원</a>
					</div>
			</div>
			<!-- TOP1 종료 -->
			
			<!-- TOP2 시작 -->
			<div class="gallary-item">
				<a href="https://ko.wikipedia.org/wiki/%EB%A1%9C%EB%A0%98_%EC%9E%85%EC%88%A8">
					<img src="http://placeimg.com/480/480/animals"> </a>
					<div class="gallary-text-category">
					<a href="https://ko.wikipedia.org/wiki/%EB%A1%9C%EB%A0%98_%EC%9E%85%EC%88%A8">
						<%=HCdto.getHost_content_category()%>:뷰티</a>
					</div>
					<div class="gallary-text-content">
					<a href="https://ko.wikipedia.org/wiki/%EB%A1%9C%EB%A0%98_%EC%9E%85%EC%88%A8">
						<%=HCdto.getHost_content_name()%>:컨텐츠명</a>
					</div>
					<div class="gallary-text-cost">
					<a href="https://ko.wikipedia.org/wiki/%EB%A1%9C%EB%A0%98_%EC%9E%85%EC%88%A8">
						<%=HCdto.getHost_content_cost()%>:40000원 </a>
					</div>
			</div>
			<!-- TOP2 종료 -->

			<!-- TOP3 시작 -->
			<div class="gallary-item">
				<a href="https://ko.wikipedia.org/wiki/%EB%A1%9C%EB%A0%98_%EC%9E%85%EC%88%A8">
					<img src="http://placeimg.com/480/480/nature">	</a>
					<div class="gallary-text-category">
					<a href="https://ko.wikipedia.org/wiki/%EB%A1%9C%EB%A0%98_%EC%9E%85%EC%88%A8">
						<%=HCdto.getHost_content_category()%>:뷰티</a>
					</div>
					<div class="gallary-text-content">
					<a href="https://ko.wikipedia.org/wiki/%EB%A1%9C%EB%A0%98_%EC%9E%85%EC%88%A8">
						<%=HCdto.getHost_content_name()%>:컨텐츠명</a>
					</div>
					<div class="gallary-text-cost">
					<a href="https://ko.wikipedia.org/wiki/%EB%A1%9C%EB%A0%98_%EC%9E%85%EC%88%A8">
						<%=HCdto.getHost_content_cost()%>:40000원 </a>
					</div>
			</div>
			<!-- TOP3 종료 -->

			<!-- TOP4 시작 -->
			<div class="gallary-item">
				<a href="https://ko.wikipedia.org/wiki/%EB%A1%9C%EB%A0%98_%EC%9E%85%EC%88%A8">
					<img src="http://placeimg.com/480/480/nature"></a>
					<div class="gallary-text-category">
					<a href="https://ko.wikipedia.org/wiki/%EB%A1%9C%EB%A0%98_%EC%9E%85%EC%88%A8">
						<%=HCdto.getHost_content_category()%>:뷰티</a>
					</div>
					<div class="gallary-text-content">
					<a href="https://ko.wikipedia.org/wiki/%EB%A1%9C%EB%A0%98_%EC%9E%85%EC%88%A8">
						<%=HCdto.getHost_content_name()%>:컨텐츠명</a>
					</div>
					<div class="gallary-text-cost">
					<a href="https://ko.wikipedia.org/wiki/%EB%A1%9C%EB%A0%98_%EC%9E%85%EC%88%A8">
						<%=HCdto.getHost_content_cost()%>:40000원 </a>
					</div>
			</div>
			<!-- TOP4 종료 -->
			
			<!-- TOP5 종료 -->
			<div class="gallary-item">
				<a href="https://ko.wikipedia.org/wiki/%EB%A1%9C%EB%A0%98_%EC%9E%85%EC%88%A8">
					<img src="http://placeimg.com/480/480/nature"></a>
					<div class="gallary-text-category">
					<a href="https://ko.wikipedia.org/wiki/%EB%A1%9C%EB%A0%98_%EC%9E%85%EC%88%A8">
						<%=HCdto.getHost_content_category()%>:뷰티</a>
					</div>
					<div class="gallary-text-content">
					<a href="https://ko.wikipedia.org/wiki/%EB%A1%9C%EB%A0%98_%EC%9E%85%EC%88%A8">
						<%=HCdto.getHost_content_name()%>:컨텐츠명</a>
					</div>
					<div class="gallary-text-cost">
					<a href="https://ko.wikipedia.org/wiki/%EB%A1%9C%EB%A0%98_%EC%9E%85%EC%88%A8">
						<%=HCdto.getHost_content_cost()%>:40000원 </a>
					</div>
			</div>
			<!-- TOP5 종료 -->

		</div>
	<hr>
	<!-- TOP5 클래스  이미지 넣기 종료 -->
	</article>
	
	<article>
	<!-- 최신 클래스  이미지 넣기 시작 -->


		<!-- 최신클래스 시작 -->

			<div class="sohee-title">최신클래스!</div>
			<div class="row-empty"></div>

			<h4 class="gallary-text-category">
				<a href="#">전체보기</a>
			</h4>
			
			<!-- 최신클래스1 시작 -->
			<div class="gallary">
			<div class="gallary-item">
				<a href="https://ko.wikipedia.org/wiki/%EB%A1%9C%EB%A0%98_%EC%9E%85%EC%88%A8">
					<img src="http://placeimg.com/480/480/animals"></a>
					<div class="gallary-text-category">
					<a href="https://ko.wikipedia.org/wiki/%EB%A1%9C%EB%A0%98_%EC%9E%85%EC%88%A8">
						<%=HCdto.getHost_content_category()%>:뷰티</a>
					</div>
					<div class="gallary-text-content">
					<a href="https://ko.wikipedia.org/wiki/%EB%A1%9C%EB%A0%98_%EC%9E%85%EC%88%A8">
						<%=HCdto.getHost_content_name()%>:컨텐츠명 </a>
					</div>
					<div class="gallary-text-cost">
					<a href="https://ko.wikipedia.org/wiki/%EB%A1%9C%EB%A0%98_%EC%9E%85%EC%88%A8">
						<%=HCdto.getHost_content_cost()%>:40000원</a>
					</div>
			</div>
			<!-- 최신클래스1 종료 -->
			
			<!-- 최신클래스2 시작 -->
			<div class="gallary-item">
				<a href="https://ko.wikipedia.org/wiki/%EB%A1%9C%EB%A0%98_%EC%9E%85%EC%88%A8">
					<img src="http://placeimg.com/480/480/animals"> </a>
					<div class="gallary-text-category">
					<a href="https://ko.wikipedia.org/wiki/%EB%A1%9C%EB%A0%98_%EC%9E%85%EC%88%A8">
						<%=HCdto.getHost_content_category()%>:뷰티</a>
					</div>
					<div class="gallary-text-content">
					<a href="https://ko.wikipedia.org/wiki/%EB%A1%9C%EB%A0%98_%EC%9E%85%EC%88%A8">
						<%=HCdto.getHost_content_name()%>:컨텐츠명</a>
					</div>
					<div class="gallary-text-cost">
					<a href="https://ko.wikipedia.org/wiki/%EB%A1%9C%EB%A0%98_%EC%9E%85%EC%88%A8">
						<%=HCdto.getHost_content_cost()%>:40000원 </a>
					</div>
			</div>
			<!-- 최신클래스2 종료 -->

			<!-- 최신클래스3 시작 -->
			<div class="gallary-item">
				<a href="https://ko.wikipedia.org/wiki/%EB%A1%9C%EB%A0%98_%EC%9E%85%EC%88%A8">
					<img src="http://placeimg.com/480/480/nature">	</a>
					<div class="gallary-text-category">
					<a href="https://ko.wikipedia.org/wiki/%EB%A1%9C%EB%A0%98_%EC%9E%85%EC%88%A8">
						<%=HCdto.getHost_content_category()%>:뷰티</a>
					</div>
					<div class="gallary-text-content">
					<a href="https://ko.wikipedia.org/wiki/%EB%A1%9C%EB%A0%98_%EC%9E%85%EC%88%A8">
						<%=HCdto.getHost_content_name()%>:컨텐츠명</a>
					</div>
					<div class="gallary-text-cost">
					<a href="https://ko.wikipedia.org/wiki/%EB%A1%9C%EB%A0%98_%EC%9E%85%EC%88%A8">
						<%=HCdto.getHost_content_cost()%>:40000원 </a>
					</div>
			</div>
			<!-- 최신클래스3 종료 -->

			<!-- 최신클래스4 시작 -->
			<div class="gallary-item">
				<a href="https://ko.wikipedia.org/wiki/%EB%A1%9C%EB%A0%98_%EC%9E%85%EC%88%A8">
					<img src="http://placeimg.com/480/480/nature"></a>
					<div class="gallary-text-category">
					<a href="https://ko.wikipedia.org/wiki/%EB%A1%9C%EB%A0%98_%EC%9E%85%EC%88%A8">
						<%=HCdto.getHost_content_category()%>:뷰티</a>
					</div>
					<div class="gallary-text-content">
					<a href="https://ko.wikipedia.org/wiki/%EB%A1%9C%EB%A0%98_%EC%9E%85%EC%88%A8">
						<%=HCdto.getHost_content_name()%>:컨텐츠명</a>
					</div>
					<div class="gallary-text-cost">
					
					<a href="https://ko.wikipedia.org/wiki/%EB%A1%9C%EB%A0%98_%EC%9E%85%EC%88%A8">
						<%=HCdto.getHost_content_cost()%>:40000원 </a>
					</div>
			</div>
			<!-- 최신클래스4 시작 -->
			
			<!-- 최신클래스5 시작 -->
			<div class="gallary-item">
				<a href="https://ko.wikipedia.org/wiki/%EB%A1%9C%EB%A0%98_%EC%9E%85%EC%88%A8">
					<img src="http://placeimg.com/480/480/nature"></a>
					<div class="gallary-text-category">
					<a href="https://ko.wikipedia.org/wiki/%EB%A1%9C%EB%A0%98_%EC%9E%85%EC%88%A8">
						<%=HCdto.getHost_content_category()%>:뷰티</a>
					</div>
					<div class="gallary-text-content">
					<a href="https://ko.wikipedia.org/wiki/%EB%A1%9C%EB%A0%98_%EC%9E%85%EC%88%A8">
						<%=HCdto.getHost_content_name()%>:컨텐츠명</a>
					</div>
					<div class="gallary-text-cost">
					<a href="https://ko.wikipedia.org/wiki/%EB%A1%9C%EB%A0%98_%EC%9E%85%EC%88%A8">
						<%=HCdto.getHost_content_cost()%>:40000원 </a>
					</div>
			</div>
			<!-- 최신클래스5 종료 -->

		</div>
	<hr>
	<!-- 최신클래스  이미지 넣기 종료 -->
	</article>
	
	





</section>
<hr color="#F9896">
<jsp:include page="/template/footer.jsp"></jsp:include>
