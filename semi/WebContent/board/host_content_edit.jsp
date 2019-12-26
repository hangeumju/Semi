<%@page import="beans.Host_Info_Dao"%>
<%@page import="beans.Host_Content_Dto"%>
<%@page import="beans.Host_Content_Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String host_id = (String)session.getAttribute("host_id");
    int content_no = Integer.parseInt(request.getParameter("host_content_no"));
    Host_Content_Dao HCdao = new Host_Content_Dao();
    Host_Content_Dto HCdto = HCdao.getOneHost(content_no);
    %>
 <!--     	자바 영역 끝입니다---------------------------------------------------------- -->
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
    
<!--     	스타일 영역 시작입니다---------------------------------------------------------- -->
    <style>
		  .float{
		  border: 1px dotted black;
		  float:left;
		  width:25%
		  }  
		  .w-70::after {
            content: "";
            display: block;
            clear: both;
            height : 500px;
        }
		  .main{
		  	width:465px;
			/* 		  	글 안넘어가게 하는 명령어 */
		  	word-break:break-all; 
		  	
		  }
		  
		  .sub{
			width:232px;
		  	position: fixed;
		  	top: 44.5%;
            right: 27.05%;
            height : 237px;
            /* 		  	글 안넘어가게 하는 명령어 */
            word-break:break-all;
		  }
		  
		  .form_button{
		 	 width:100%;
		  }
		  
		
    </style>
    <!--     	스타일 영역 끝입니다---------------------------------------------------------- -->
   
<!--    슬라이더를 불러옵니다 -->
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/deslider/1.5.1/style.css">
   
     <!--     	스크립트 영역 시작입니다---------------------------------------------------------- -->
    <link href="https://cdn.jsdelivr.net/npm/suneditor@latest/dist/css/suneditor.min.css" rel="stylesheet">
<!-- <link href="https://cdn.jsdelivr.net/npm/suneditor@latest/assets/css/suneditor.css" rel="stylesheet"> -->
<!-- <link href="https://cdn.jsdelivr.net/npm/suneditor@latest/assets/css/suneditor-contents.css" rel="stylesheet"> -->
<style>
    textarea[name=host_content_ect_info]{
        width:100%;
        height:150px;
    }
    
    textarea[name=host_content_qa]{
        width:100%;
        height:150px;
    }
</style>

<script src="https://cdn.jsdelivr.net/npm/suneditor@latest/dist/suneditor.min.js"></script>
<!-- languages (Basic Language: English/en) -->
<script src="https://cdn.jsdelivr.net/npm/suneditor@latest/src/lang/ko.js"></script>
<script>
	//  추가적인 내용 변경창 에디터
    function loadEditor(){
        var editor = SUNEDITOR.create((document.querySelector('textarea[name=host_content_ect_info]')),{
            //언어 설정
            lang: SUNEDITOR_LANG['ko'],
            
            //버튼 목록
            buttonList:[
            	 ['font','fontSize','fontColor'],
                 ['underline','italic', 'bold','paragraphStyle','formatBlock'],
                 ['align','table','image']

              ],
              font:[
                 '굴림','궁서','binggrae','Verdana','Arial'
             ],
             fontSize:[
             '8', '9', '10', '11', '12', '14', '16', '18', '20', '22', '24', '26', '28', '36', '48', '72'
             ],
            
        });
        
    	//중요 : 키입력시마다 값을 원래위치(textarea)에 복사
	    editor.onKeyUp = function(e){
	    	var content = document.querySelector("textarea[name=host_content_ect_info]");
	    	content.value = editor.getContents();
	    }
        
	    editor.setContents('<%=HCdto.getHost_content_ect_info()%>');
	   
    }
  //윈도우 로딩 시 loadEditor를 실행하도록 설정(body에 onload 한 효과)
  window.onload = loadEditor;
  
</script>
	<div align="center">
		<form action="host_content_edit.do" method="post">

		<input type="hidden" name="host_content_no" value="<%=HCdto.getHost_content_no()%>">

		<table border="1" width="70%">
			<!-- 제목 수정 -->
			<tr>
				<th><%=HCdto.getHost_id()%>님의 컨텐츠 수정</th>
				<td>
					<input type="text" name="host_content_name" value="<%=HCdto.getHost_content_name()%>" required>
				</td>
			</tr>
			<tr>				
			<!-- 내용 수정 -->
			<td colspan="2">
					<textarea name="host_content_ect_info" required rows="15" cols="100" 
						style="resize:vertical;"><%=HCdto.getHost_content_ect_info()%></textarea>
				</td>
			<!-- qa 수정 -->
			<tr>
			<td colspan="2">
					<textarea name="host_content_qa" required rows="15" cols="100" 
						style="resize:vertical;"><%=HCdto.getHost_content_qa()%></textarea>
				</td>
			</tr>
				
			<!-- 티켓 수량 수정 -->
			<tr>
				<td>
					티켓 수량 변경
				</td>
				<td colspan="1">
					<input type="text" name="host_content_ticket" value="<%=HCdto.getHost_content_ticket()%>">
				</td>
			</tr>
			<!-- 지도 수정 -->
			<tr>
			<td colspan="2">
			 <input class="block-item input-item" type="text" id="address-input" name="host_content_location" placeholder="주소 입력" onblur="loadMap();">
   				<div  id="map" style="width:100%;height:400px;display:none;" ></div>
			</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="수정하기">
					<a href="host_content_list.jsp">
					<input type="button" value="목록보기">
				</a>
			</td>
		</tr>
	</table>
	</form>
</div>
<jsp:include page="/template/footer.jsp"></jsp:include>
