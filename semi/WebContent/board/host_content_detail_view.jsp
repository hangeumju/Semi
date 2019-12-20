<%@page import="beans.Host_Info_Dao"%>
<%@page import="beans.Host_Info_Dto"%>
<%@page import="beans.Host_Content_Dto"%>
<%@page import="java.util.List"%>
<%@page import="beans.Host_Content_Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!--     	자바 영역 시작입니다---------------------------------------------------------- -->
	<%
		Host_Content_Dao HCdao = new Host_Content_Dao();
		//컨텐츠 번호를 받아서 no에 넣는다
		//int no = Integer.parseInt(request.getParameter("host_content_no"));
 		int no = Integer.parseInt(request.getParameter("host_content_no"));
// 		int no = 3;
		//받은 no를 이용해 단일컨텐츠를 불러오는 명령어를 불러온다
		Host_Content_Dto HCdto = HCdao.getOneContent(no);
		
		String id = HCdto.getHost_id();
		
		Host_Info_Dao HIdao = new Host_Info_Dao();
		Host_Info_Dto HIdto = HIdao.getOneHost(id);
	
	%>
 <!--     	자바 영역 끝입니다---------------------------------------------------------- -->
    
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
    <script type="text/javascript" src="../js/slider.js"></script>
    <!-- Content 날자 지정 API  -->
    <link rel="stylesheet" type="text/css" href="../css/datepicker.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
    <script src="../js/datepicker.js"></script>
    <script>
        

        function loadSlider(){
            var imgSources = [
            {
                link:"http://placehold.it/300x100?text=a",
                caption:"테스트 제목1"
            },

            {
                link:"http://placehold.it/300x100?text=b",
                 caption:"테스트 제목1"
            },
            {
                link:"http://placehold.it/300x100?text=c",
                caption:"테스트 제목1"
            }
            
            ];
            var containerId = '#deslider-container';

            var options = {
                auto: {
                    speed: 2000,//한장이 표시될 밀리초
                    pauseOnHover: true,//hover 상태의 재생여부
                },
                fullScreen: true,
                swipe: true,
                pagination: true,
                repeat: true
            };

            var myDeslider = new Deslider(imgSources, containerId, options);
             }

        	window.onload=loadSlider;
        	
        	//티켓 창 플러스 1 시키는 명령어
        	function plus(){
        		var plus = document.querySelector("input[name=ticketing]");
        		if(plus.value < <%=HCdto.getHost_content_ticket()%>){
        		plus.value = parseInt(plus.value) + 1;
        		}
        	}
        	
        	//티켓 창 마이너스 1 시키는 명령어
        	function minus(){
        		var minus = document.querySelector("input[name=ticketing]");
        		if(minus.value > 1){
        		minus.value = parseInt(minus.value) - 1;
        		}
        	}
        	
      
            
             
            	function loadPicker(){
                    var options = {
                        //날짜가 입력될 첫 번째 칸 설정
                        field:document.querySelector(".start_date"),
                        //표시될 월의 개수를 설정
                        numberOfMonths:1,
                        //날짜 선택이 아닌 범위 선택으로 설정
                        singleDate:true,
                        //최초 선택일 이후로만 종료일을 선택하도록 설정
                        selectForward:true,
                        //날짜 구분자 설정
                        seperator:'-',
                       
                        //날짜 지정
               			minDate: moment('<%=HCdto.getHost_content_start_date().substring(0, 10) %>'),
               		    maxDate: moment('<%=HCdto.getHost_content_last_date().substring(0, 10) %>'),

                        
                        //날짜형식설정
                        format:'YYYY-MM-DD'
                    };
                    var picker = new Lightpick(options);
                }
            	//이 페이지에서 예약 실행
            	window.onload=loadPicker; 
        
    </script>
    <!--     	스트립트 영역 끝입니다---------------------------------------------------------- -->
	
	 
	

<jsp:include page="/template/header.jsp"></jsp:include>
	
	<article class="w-70">
		<div class="float">
			
			<div class="main">
				<!-- 이미지 슬라이더 영역 -->
    			<div id="deslider-container"></div>
    			<div><h1><%=HCdto.getHost_content_name() %></h1></div>
    			<div><h3><%=HCdto.getHost_content_cost() %></h3></div>
    			<div><h2><%=HCdto.getHost_id()%></h2></div>
    			<div><h2><%=HIdto.getHost_phone() %></h2></div>
    			
    			<div><%=HCdto.getHost_content_info() %></div>
    			<div>
    			<%=HCdto.getHost_content_start_date().substring(0, 10) %>
    			<%=HCdto.getHost_content_last_date().substring(0, 10) %>
    			</div>
    			<div><%=HCdto.getHost_content_location() %></div>
    			<div><%=HCdto.getHost_content_ect_info() %></div>
    			<div>QnA<%=HCdto.getHost_content_qa() %></div>
    			
			</div>
			<div class="sub">
				<div>남은 티켓 수량 : <%=HCdto.getHost_content_ticket()%></div>
				<div>티켓수량 선택</div>
				<form action="<%=request.getContextPath()%>/board/users_pay.jsp" method="get">
					<input type="button" class="minus" value="-" onclick="minus();">
					<input class="ticket_input" type="number" name="ticketing" value="1">
					<input type="button" value = "+" class= "plus" onclick="plus();">
					<div>예약 날짜를 선택하세요</div>
					<input id="callender" type="text" name="start_date" class="start_date" placeholder="시작하는 날">
					<button class="form_button">참여합니다!</button>
				</form>
			</div>
			
	
	</article>
<jsp:include page="/template/footer.jsp"></jsp:include>
