<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
//host_id 는 hidden 으로 넘김
String host_id = (String)request.getSession().getAttribute("host_id");
%>


 <jsp:include page="/template/header.jsp"></jsp:include>  


	<!-- 호스트 컨텐츠 생성 지도 API -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=144ecc43e88cf564cd023973d3eb1f18&libraries=services"></script>
	<script>
	        function loadMap(){
	            // 입력창의 결과값을 불러옵니다.
	            var addr = document.querySelector("#address-input").value;
	            //입력값이 없으면 종료
	            if(!addr) return;
	            var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	                mapOption = {
	                    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	                    level: 3 // 지도의 확대 레벨
	                };  
	            // 지도를 생성합니다    
	            var map = new kakao.maps.Map(mapContainer, mapOption); 
	            // 주소-좌표 변환 객체를 생성합니다
	            var geocoder = new kakao.maps.services.Geocoder();
	            // 주소로 좌표를 검색합니다
	            geocoder.addressSearch(addr, function(result, status) {
	            // 정상적으로 검색이 완료됐으면 
	            if (status === kakao.maps.services.Status.OK) {
	                var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	                // 결과값으로 받은 위치를 마커로 표시합니다
	                var marker = new kakao.maps.Marker({
	                    map: map,
	                    position: coords
	            });
	            // 인포윈도우로 장소에 대한 설명을 표시합니다
	            var infowindow = new kakao.maps.InfoWindow({
	                content: '<div style="width:150px;text-align:center;padding:6px 0;">'+addr+'</div>'
	            });
	            infowindow.open(map, marker);
	            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	            map.setCenter(coords);
	            
	            mapContainer.style.display = "block";
	    } 
	}); }
	</script>
	<!-- 호스트 컨텐츠 생성 지도 API 종료 -->


	<form action="host_content_produce.do" method="post">
	<article class="w-40">
	
	<!-- host_id 는 hidden 으로 넘김 -->
	<!-- host_id 대신에 rlawldms 넣어놨으니 나중에 변경 -->
	<%-- <input  type="hidden" name= "host_id" value="<%=host_id%>">	 --%>
	<input  type="hidden" name= "host_id" value="rlawldms">	

		<div class="row"> 		
			<h2> 호스트 컨텐츠 생성</h2>
		</div>
		<div class="row-left">
		</div>
		<div class="row-left">
			<input class="block-item input-item" type="text" name= "host_content_category" placeholder= "카테고리" required>	
		</div>
		<div class="row-left">
			<input class="block-item input-item" type="number" name= "host_content_cost" placeholder= "가격" required>
		</div>
		<div class="row-left">
			<input class="block-item input-item" type="text" name= "host_content_name" placeholder= "컨텐츠 이름" required>
		</div>
	
		<div class="row-left">
			<input class="block-item input-item" type="number" name= "host_content_ticket" placeholder= "컨텐츠 수량" required>
		</div>
		
		<div class="row-left">			
			<textarea class="block-item input-item" rows="10"  name="host_content_info"> 컨탠츠 내용을 작성해주세요 </textarea>
		</div>
		
		<div class="row-left">			
			<input class="block-item input-item" type="text" name= "host_content_date" placeholder= "예시 : 2019-12-20 am 12:12~14:12" required>		
		</div>
		
		<div>
			<p> 진행장소 </p>		
			    <input class="block-item input-item" type="text" id="address-input" name="host_content_location" placeholder="주소 입력" onblur="loadMap();">
   				<div  id="map" style="width:100%;height:400px;display:none;" ></div>
		</div>
				
		<div class="row-left">			
			<textarea class="block-item input-item" rows="10"  name="host_content_ect_info"> 컨탠츠 추가 내용을 작성해주세요 </textarea>
		</div>
		<div>
			<input type="file" name="host_content_file" accept=".jpg, png, .gif" value="첨부파일">
		</div>	
		<div class="row-left">			
			<textarea class="block-item input-item" rows="10"  name="host_content_QA"> QA 내용을 작성해주세요 </textarea>
		</div>
		
		<div class="row-right">
			<input class="block-item input-item" type="submit" value= "컨텐츠 등록하기" >	
		</div>	
	</article>	
	</form>	


<jsp:include page="/template/footer.jsp"></jsp:include>  