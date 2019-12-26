<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<article onload="loadSlider()">
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
</article>