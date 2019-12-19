<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
//host_id 는 hidden 으로 넘김
String host_id = (String)request.getSession().getAttribute("host_id");
%>


 <jsp:include page="/template/header.jsp"></jsp:include>  

<!-- style , script 정의 공간 -->

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

    <!-- Content 날자 지정 API  -->
    <link rel="stylesheet" type="text/css" href="../css/datepicker.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
    <script src="../js/datepicker.js"></script>
    <script>    
    	function loadPicker(){
            var options = {
                //날짜가 입력될 첫 번째 칸 설정
                field:document.querySelector(".start_date"),
                //날짜가 입력될 두 번째 칸 설정
                secondField:document.querySelector(".last_date"),
                //표시될 월의 개수를 설정
                numberOfMonths:2,
                //날짜 선택이 아닌 범위 선택으로 설정
                singleDate:false,
                //최초 선택일 이후로만 종료일을 선택하도록 설정
                selectForward:true,
                //날짜 구분자 설정
                seperator:'-',
               
                //문서 내에 표시되도록 설정
                // inline:true,
                //선택 시작일 설정(현재일로 설정하거나 'YYYY-MM-DD' 형태로 설정)
                minDate:moment(new Date()).add(1, 'days'),//내일부터 선택 가능
                // minDate:new Date(),//오늘부터 선택가능
                
                //날짜형식설정
                format:'YYYY-MM-DD'
            };
            var picker = new Lightpick(options);
        }
    	//이 페이지에서 예약 실행
    	window.onload=loadPicker;    	
    </script>
    <!-- Content 날자 지정 API 종료  -->
    
<!-- style , script 정의 공간 -->


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
			<p class="row-left">			
			<select class="block-item input-item" name="host_content_category">
				<option value="" selected disabled hidden >카테고리 선택</option>
				<option>액티비티</option>
				<option>배움</option>
				<option>건강/뷰티</option>
				<option>모임</option>
				<option>여행</option>
			</select>
		</p>	
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
			<p> 진행 날짜 설정 </p>	
				<div  >
   				 <input type="text" name="start_date" class="start_date" placeholder="시작하는 날">
    			<input type="text" name="last_date" class="last_date" placeholder="끝나는 날">
				</div>			
		</div>
		
		<div>
			<p> 진행 장소 </p>		
			    <input class="block-item input-item" type="text" id="address-input" name="host_content_location" placeholder="주소 입력" onblur="loadMap();">
   				<div  id="map" style="width:100%;height:400px;display:none;" ></div>
		</div>
				
		<div class="row-left">			
			<textarea class="block-item input-item" rows="10"  name="host_content_ect_info"> 컨탠츠 추가 내용을 작성해주세요 </textarea>
		</div>
		<div>
			<input type="file" name="host_content_file1" accept=".jpg, png, .gif" value="첨부파일">
			<input type="file" name="host_content_file2" accept=".jpg, png, .gif" value="첨부파일">
			<input type="file" name="host_content_file3" accept=".jpg, png, .gif" value="첨부파일">
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