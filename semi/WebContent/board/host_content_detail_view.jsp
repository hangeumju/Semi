<%@page import="beans.Users_Get_Dto"%>
<%@page import="beans.Users_Regist_Dto"%>
<%@page import="beans.Users_Review_Dto"%>
<%@page import="beans.Users_Info_Dao"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
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
  		int no = Integer.parseInt(request.getParameter("host_content_no"));
		
		String host_id = (String) session.getAttribute("host_id"); //호스트 아이디 받고
		String user_id = (String) session.getAttribute("user_id"); //유저 아이디 받고

// 		int no = 40;

		//받은 no를 이용해 단일컨텐츠를 불러오는 명령어를 불러온다
		Host_Content_Dto HCdto = HCdao.getOneContent(no);
		
		String id = HCdto.getHost_id();
		
		Host_Info_Dao HIdao = new Host_Info_Dao();
		Host_Info_Dto HIdto = HIdao.getOneHost(id);
		
		Users_Info_Dao UIdao = new Users_Info_Dao();
		Users_Get_Dto UGdto = UIdao.users_get(user_id);
		
		 //조회수 증가 부분
	 	
		boolean isUser = false;
		
		if(user_id != null){
			isUser = user_id.equals(UGdto.getUser_id());
			
	 	}
	 	else{
	 		user_id = "";
	 	} 
		 
		if(user_id != null && host_id == null){
			
	 		Set<Integer> memory = (Set<Integer>)session.getAttribute("memory");
	 		if(memory == null){	
	 				memory = new HashSet<>();
	 		}
	 		boolean isFirst = memory.add(no);
	 		session.setAttribute("memory", memory);
	 		if(isFirst){
	 		HCdto.setHost_content_view_count(HCdto.getHost_content_view_count()+1);
			HCdao.readCountUp(no);
 			}
	 	}
	 	boolean isHost = false;
	 	if(host_id != null){
			isHost = host_id.equals(HCdto.getHost_id());
	 	}
	 	else{
	 		host_id = "";
	 	}
	
	 	
	 	List<Users_Review_Dto> list = UIdao.users_review_getList(no);
	 	
	 	
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
        
//반복문으로 사진넣는것도 해결해야 합니다!~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
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
        		var total = document.querySelector(".total");
        		total.innerText = plus.value*<%=HCdto.getHost_content_cost() %>;

        	}
        	
        	//티켓 창 마이너스 1 시키는 명령어
        	function minus(){
        		var minus = document.querySelector("input[name=ticketing]");
        		if(minus.value > 1){
        		minus.value = parseInt(minus.value) - 1;
        		}
        		var total = document.querySelector(".total");
        		total.innerText = minus.value*<%=HCdto.getHost_content_cost() %>;
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
        		
            	//------------------------수정 하려고 할때---------------------------
            	function edit(){
                    
                    var choice = window.confirm("수정하시겠습니까?");
                   
                    if(choice){
                    	location.href = "<%=request.getContextPath()%>/board/host_content_edit.jsp?host_content_no=<%=HCdto.getHost_content_no()%>";
                     }
                }
            	//------------------------삭제 하려고 할때---------------------------
				function del(){
                    var cho = window.confirm("삭제하시겠습니까?");
                    if(cho){
                    location.href = "<%=request.getContextPath()%>/board/host_content_delete.do?host_id=<%=HCdto.getHost_id()%>&no=<%=HCdto.getHost_content_no()%>";
                     }
                }
            	
				//------------------------목록 하려고 할때---------------------------
				function list(){
                    var cho = window.confirm("목록으로 가시겠습니까?");
                    if(cho){
                    location.href = "<%=request.getContextPath()%>/board/host_content_list.jsp";
                     }
                }
            
            	
    </script>
    
    <!--     	스트립트 영역 끝입니다---------------------------------------------------------- -->
<jsp:include page="/template/header.jsp"></jsp:include>
    
   
	
	<article class="w-70 row">
		<div class="float">
			
			<div class="main">
				<!-- 이미지 슬라이더 영역 -->
    			<div id="deslider-container"></div>
    			<div><h1><%=HCdto.getHost_content_name() %></h1></div>
    			<div><h3>조회수(<%=HCdto.getHost_content_view_count() %>)</h3></div>
    			<div><h3>가격 = <%=HCdto.getHost_content_cost() %></h3></div>
    			<div><h2>호스트 이름 <%=HCdto.getHost_id()%></h2></div>
    			<div><h2>호스트 연락처 <%=HIdto.getHost_phone() %></h2></div>
    			
    			<div><%=HCdto.getHost_content_info() %></div>
    			<div>
    			<%=HCdto.getHost_content_start_date().substring(0, 10) %>
    			<%=HCdto.getHost_content_last_date().substring(0, 10) %>
    			</div>
    			<div><%=HCdto.getHost_content_location() %></div>
    			<div><%=HCdto.getHost_content_ect_info() %></div>
    			<div>QnA<%=HCdto.getHost_content_qa() %></div>
    			<div> 리뷰 게시판 자리</div>
    			<%for (Users_Review_Dto dto : list) {%>
    			<div><%=dto.getReview_no() %></div>
    			<div><%=dto.getReview_writer() %></div>
    			<div><%=dto.getReview_date().substring(0, 10) %></div>
    			<div><%=dto.getReview_content() %></div>
    			<%} %>
    			
    			<!-- 댓글 작성칸이 표시될 자리 -->
				<%if(host_id=="" || !isHost){ %>
				<form action="users_review_regist.do" method="post">
					<input type="hidden" name="content_original_no" value="<%=HCdto.getHost_content_no()%>">
					<input type="hidden" name="review_writer"  value="<%=user_id%>">
					<textarea name="review_content" rows="2" cols="103" required="required"></textarea>
					<input type="submit" value="등록">
				</form>
				<%} %>
			</div>
			
			<div class="sub">
				<%if(isUser) {%>
				<div>남은 티켓 수량 : <%=HCdto.getHost_content_ticket()%></div>
				<div>티켓수량 선택</div>
				<form action="<%=request.getContextPath()%>/board/users_pay.jsp" method="post">
					<input type="hidden" name="host_content_name" value="<%=HCdto.getHost_content_name() %>"><!--컨텐츠 제목 -->
					<input type="hidden" name="host_name" value="<%=HIdto.getHost_name()%>"><!--호스트 이름 -->
					<input type="hidden" name="host_phone" value="<%=HIdto.getHost_phone() %>"><!--호스트 폰번호 -->
					<input type="hidden" name="host_content_no" value="<%=HCdto.getHost_content_no() %>"><!-- 호스트 컨텐트 넘버 -->
					<input type="hidden" name="host_content_location" value="<%=HCdto.getHost_content_location() %>"><!--호스트 지역 -->
					<input type="hidden" name="host_content_cost" value="<%=HCdto.getHost_content_cost() %>"> <!--호스트 컨텐츠 가격 -->
					<input type="button" class="minus" value="-" onclick="minus();">
					<input id="pay"  class="ticket_input" type="text" name="ticketing" value="1"> <!-- 티켓수 -->
					<input type="button" value = "+" class= "plus" onclick="plus();">
				 	<div class="total"><%=HCdto.getHost_content_cost() %> </div> 
					<input id="callender" type="text" name="start_date" class="start_date" placeholder="날짜선택"> <!-- 날짜 -->
    				<button class="form_button">참여합니다!</button>
				</form>
					<button onclick="list();">목록으로</button><br>
					
				<%}else if(host_id != null && isHost) {%>
    				<button onclick="edit();">수정</button><br>
    				<button onclick="del();">삭제</button><br>
    			<%} else {%>
    				<button onclick="list();">목록으로</button><br>
    			<%} %>
			</div>
		</div>
		
		
	</article>
	
<jsp:include page="/template/footer.jsp"></jsp:include>
