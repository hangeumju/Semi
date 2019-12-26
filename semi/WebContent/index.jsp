<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<jsp:include page="/template/header.jsp"></jsp:include>
<style>

/* 전체 글꼴 */
@font-face {
	font-family: NanumSquareR;
	src: url("../font/NanumSquareR.ttf");
}

.sohee-title {
	color: white;
	background-color: #F98967;
	opacity: 100%;
	padding: 10px;
	font-size: 14px;
}

/* 소희-카테고리 이미지 라운드로 */
.gallary>.gallary-item>a>.category-image>img {
	width: 100%;
	border-radius: 50%;
	opacity: 0.5;
}

/* 소희-상품 이미지 라운드주기         */
.gallary>.gallary-item>a>.gallary-image>img {
	border-radius: 3%;
}

/* 소희-상품 카테고리글꼴스타일 	   */
.gallary-text-category {
	color: grey;
	font-size: 10px;
	opacity: "10";
	padding: 5px;
}

/* 소희-상품명 글꼴스타일 	   */
.gallary-text-content {
	color: black;
	font-size: 14px;
	opacity: "10";
	padding: 5px;
}

/* 소희-상품 가격 글꼴스타일 	   */
.gallary-text-cost {
	color: black;
	font-size: "14px;
	opacity: "10";
	font-weight: bold;
	padding: 5px;
	border-radius: 10%;
}

/* 소희-회색 테두리 ,필요하 	   */
.gallary-border {
	border: 1px solid grey;
}
</style>

<main>
<section>

<!-- 이미지 슬라이더 템플릿 -->
<jsp:include page="/template/slider.jsp"></jsp:include>



	<!-- 카테고리 이미지 넣기 시작 -->

	<article>

		<div class="sohee-title">어떤클래스를하실건가요</div>
		<div class="row-empty"></div>

		<div class="gallary">
			<div class="gallary-item">

				<a href="<%=request.getContextPath()%>/board/host_content_list.jsp?category=액티비티">

					<div class="category-image">
						<img src="http://placeimg.com/480/480/tech">
						<div align="center">액티비티</div>
					</div>
				</a>
			</div>
		</div>


			<div class="gallary">
				<div class="gallary-item">

					<a href="<%=request.getContextPath()%>/board/host_content_list.jsp?category=배움">

						<div class="category-image">
							<img src="http://placeimg.com/480/480/tech">
							<div align="center">배움</div>
						</div>
					</a>
				</div>
			</div>

				<div class="gallary">
					<div class="gallary-item">

						<a href="<%=request.getContextPath()%>/board/host_content_list.jsp?category=건강/뷰티">

							<div class="category-image">
								<img src="http://placeimg.com/480/480/any">
								<div align="center">건강/뷰티</div>
							</div>
						</a>
					</div>
				</div>

					<div class="gallary">
						<div class="gallary-item">

							<a href="<%=request.getContextPath()%>/board/host_content_list.jsp?category=모임">

								<div class="category-image">
									<img src="http://placeimg.com/480/480/tech">
									<div align="center">모임</div>
								</div>
							</a>
						</div>
					</div>

						<div class="gallary">
							<div class="gallary-item">

								<a href="<%=request.getContextPath()%>/board/host_content_list.jsp?category=여행">

									<div class="category-image">
										<img src="http://placeimg.com/480/480/any">
										<div align="center">여행</div>
									</div>
								</a>
							</div>
				</div>
	</article>


	<hr>
	<!-- 카테고리 이미지 넣기 종료 -->


	<!-- 핫핫핫핫 클래스  이미지 넣기 시작 -->
	<article>


		<div id=a>
			<div class="sohee-title">핫하핫</div>
			<div class="row-empty"></div>
		</div>
		<div id=a>
			<h4 class="gallary-text-category">
				<a href="#">전체보기</a>
			</h4>
		</div>


		<div class="gallary">
			<div class="gallary-item">
				<a
					href="https://ko.wikipedia.org/wiki/%EB%A1%9C%EB%A0%98_%EC%9E%85%EC%88%A8">
					<div class="gallary-image">
						<img src="http://placeimg.com/480/480/animals">
					</div>

					<div class="gallary-text-category">카테고리:뷰티</div>
					<div class="gallary-text-content">컨텐츠명</div>
					<div class="gallary-text-cost">40000원</div>
				</a>
			</div>


			<div class="gallary-item">
				<a
					href="https://ko.wikipedia.org/wiki/%EB%A1%9C%EB%A0%98_%EC%9E%85%EC%88%A8">
					<div class="gallary-image">
						<img src="http://placeimg.com/480/480/nature">
					</div>

					<div class="gallary-text-category">카테고리:뷰티</div>
					<div class="gallary-text-content">컨텐츠명</div>
					<div class="gallary-text-cost">40000원</div>
				</a>
			</div>


			<div class="gallary-item">
				<a
					href="https://ko.wikipedia.org/wiki/%EB%A1%9C%EB%A0%98_%EC%9E%85%EC%88%A8">
					<div class="gallary-image">
						<img src="http://placeimg.com/480/480/nature">
					</div>

					<div class="gallary-text-category">카테고리:뷰티</div>
					<div class="gallary-text-content">컨텐츠명</div>
					<div class="gallary-text-cost">40000원</div>
				</a>
			</div>


			<div class="gallary-item">
				<a
					href="https://ko.wikipedia.org/wiki/%EB%A1%9C%EB%A0%98_%EC%9E%85%EC%88%A8">
					<div class="gallary-image">
						<img src="http://placeimg.com/480/480/nature">
					</div>

					<div class="gallary-text-category">카테고리:뷰티</div>
					<div class="gallary-text-content">컨텐츠명</div>
					<div class="gallary-text-cost">40000원</div>
				</a>
			</div>


			<div class="gallary-item">
				<a
					href="https://ko.wikipedia.org/wiki/%EB%A1%9C%EB%A0%98_%EC%9E%85%EC%88%A8">
					<div class="gallary-image">
						<img src="http://placeimg.com/480/480/nature">
					</div>

					<div class="gallary-text-category">카테고리:뷰티</div>
					<div class="gallary-text-content">컨텐츠명</div>
					<div class="gallary-text-cost">40000원</div>
				</a>
			</div>

		</div>
	</article>
	<hr>
	<!-- 핫핫핫핫 클래스  이미지 넣기 종료 -->




</section>

<jsp:include page="/template/footer.jsp"></jsp:include>
