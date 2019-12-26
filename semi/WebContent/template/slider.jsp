<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/swiper.min.css">
<style>
.swiper-container {
      width: 100%;
      height: 100%;
    }
</style>

<article>
	<div class="swiper-container">
		<!-- Additional required wrapper -->
		<div class="swiper-wrapper">
			<!-- 슬라이더 입니다. -->
			<div class="swiper-slide"><img src="./image/1.jpg"></div>
			<div class="swiper-slide"><img src="./image/2.jpg"></div>
			<div class="swiper-slide"><img src="./image/3.jpg"></div>
			<div class="swiper-slide"><img src="./image/4.png"></div>
		</div>
		<!-- 만약 페이지네비게이션이 필요하다면 추가하세요 -->
		<div class="swiper-pagination"></div>
		<!-- 양옆에 좌우 버튼이 필요하다면 추가하세요 -->
		<div class="swiper-button-prev"></div>
		<div class="swiper-button-next"></div>
	</div>
	
	<script src="<%=request.getContextPath()%>/js/swiper.min.js"></script>
	<script> 
	new Swiper('.swiper-container', {
		navigation : {
			nextEl : '.swiper-button-next',
			prevEl : '.swiper-button-prev',
		},
	});
	</script>
</article>

