<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/common.css">
    <link rel="stylesheet" href="https://unpkg.com/swiper/css/swiper.min.css">
    
    <!-- 메인페이지 스타일  -->
    <style>
        .swiper-container{
            width:100%;
        }
        .swiper-container img{
            width:100%;
        }
        
         header>* {
            display: inline-block
        }

        #a {
            display: inline-block
        }
        
        .menu{
            background-color: none
        }
    </style>
	<!-- 메인페이지 스타일 종료 -->

	<!-- 메인페이지 스크립트  -->
    <script src="https://unpkg.com/swiper/js/swiper.min.js"></script>
    <script>
        function loadSlider(){
            //swiper 객체 생성
            var sw = new Swiper('.swiper-container', {
                //옵션... 생략이 가능
                //자동재생 옵션
                autoplay:{
                    delay:3000,
                },
                //direction : 방향(vertical / horizontal)
                direction: 'horizontal',
                //높이를 맞추고 싶을 경우 사용
                autoHeight:true,
                //사진 전환 속도(사진이 전환 시작~끝까지 걸리는 시간)
                speed:300,
                //loop : 무한반복 설정(true / false)
                loop: true,
                // 하단 네비게이션이 있는 경우 설정
                pagination: {
                    el: '.swiper-pagination',
                    type:'bullets',
                    clickable:true,//클릭이 가능하도록 설정
                },
                // 좌우 이동 버튼이 있는 경우 설정
                navigation: {
                    nextEl: '.swiper-button-next',
                    prevEl: '.swiper-button-prev',
                },
                // 스크롤바가 있는 경우 설정
                scrollbar: {
                    el: '.swiper-scrollbar',
                },
                // 사진 전환 효과가 필요한 경우 설정(아래 중 택1)
                // effect:'coverflow',
                effect:'cube',
                // effect:'slide',
                // effect:'fade',
                // effect:'flip',
                //잡는 모양 커서(grab cursor) 활성화 설정
                grabCursor:true,
            });
        }
    </script>
    <!-- 메인페이지 스크립트  종료-->
    
    <!-- 호스트 가입 우편번호 API -->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/CSS/common.css">
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
		function postcode() {
		    new daum.Postcode({
		        oncomplete: function(data) {
		            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		
		            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		            var addr = ''; // 주소 변수
		            var extraAddr = ''; // 참고항목 변수
		
		            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                addr = data.roadAddress;
		            } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                addr = data.jibunAddress;
		            }
		
		            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
		            if(data.userSelectedType === 'R'){
		                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                    extraAddr += data.bname;
		                }
		                // 건물명이 있고, 공동주택일 경우 추가한다.
		                if(data.buildingName !== '' && data.apartment === 'Y'){
		                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                }
		                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                if(extraAddr !== ''){
		                    extraAddr = ' (' + extraAddr + ')';
		                }
		                // 조합된 참고항목을 해당 필드에 넣는다.
		                // document.getElementById("sample6_extraAddress").value = extraAddr;
		                // 아래와 같이 변경이 가능
		                // extraAddress 창을 비활성화 했기 때문에 필요 없음
		                // document.querySelector("input[name=extra_addr]").value =  extraAddr;
		            
		            } else {
		                // document.querySelector("input[name=extra_addr]").value = '';
		            }
		
		            // 우편번호와 주소 정보를 해당 필드에 넣는다.
		            // document.getElementById('sample6_postcode').value = data.zonecode;
		            document.querySelector("input[name=host_post]").value = data.zonecode;
		            // document.getElementById("sample6_address").value = addr;
		            document.querySelector("input[name=host_basic_addr]").value = addr;
		            // 커서를 상세주소 필드로 이동한다.
		            // document.getElementById("sample6_detailAddress").focus();
		            document.querySelector("input[name=host_extra_addr]").focus();
		        }
		    }).open();
		}
	</script>
	<!-- 우편번호 API 종료 -->	
	
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
	    } 
	}); }
	</script>
	<!-- 호스트 컨텐츠 생성 지도 API 종료 -->
	
</head>