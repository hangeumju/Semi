<%@page import="beans.Host_Info_Dao"%>
<%@page import="beans.Host_Info_Dto"%>
<%@page import="beans.Host_Content_Dto"%>
<%@page import="java.util.List"%>
<%@page import="beans.Host_Content_Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
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
		  	top: 26.3%;
            right: 27.05%;
            height : 400px;
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
        	
        	
        	function plus(){
        		var plus = document.querySelector("input[name=ticketing]");
        		plus.value = parseInt(plus.value) + 1;
        			 		
        	}
        	
        	
        	function minus(){
        		var minus = document.querySelector("input[name=ticketing]");
        		if(minus.value > 1){
        		minus.value = parseInt(minus.value) - 1;
        		}
        	}
        	
        
    </script>
    <!--     	스트립트 영역 끝입니다---------------------------------------------------------- -->
	
	 <!--     	자바 영역 시작입니다---------------------------------------------------------- -->
	<%
		Host_Content_Dao HCdao = new Host_Content_Dao();
		//컨텐츠 번호를 받아서 no에 넣는다
		//int no = Integer.parseInt(request.getParameter("host_content_no"));
		int no = 2;
		//받은 no를 이용해 단일컨텐츠를 불러오는 명령어를 불러온다
		Host_Content_Dto HCdto = HCdao.getOneContent(no);
		
		String id = HCdto.getHost_id();
		
		Host_Info_Dao HIdao = new Host_Info_Dao();
		Host_Info_Dto HIdto = HIdao.getOneHost(id);
	
	%>
 <!--     	자바 영역 끝입니다---------------------------------------------------------- -->
	

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
    			<%=HCdto.getHost_content_start_date() %>
    			<%=HCdto.getHost_content_last_date() %>
    			</div>
    			<div><%=HCdto.getHost_content_location() %></div>
    			<div><%=HCdto.getHost_content_ect_info() %></div>
    			<div>QnA<%=HCdto.getHost_content_qa() %></div>
    			
			</div>
			<div class="sub">
				<div>남은 티켓 수량 : <%=HCdto.getHost_content_ticket()%></div>
				<div>티켓수량 선택</div>
				<form action="#" method="get">
					<input type="button" class="minus" value="-" onclick="minus();">
					<input class="ticket_input" type="number" name="ticketing" value="1">
					<input type="button" value = "+" class= "plus" onclick="plus();">
					<button class="form_button">참여합니다!</button>
				</form>
			</div>
			
	
	</article>
<jsp:include page="/template/footer.jsp"></jsp:include>
