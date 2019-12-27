<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
		request.setCharacterEncoding("UTF-8");
		Host_Content_Dao HCdao = new Host_Content_Dao();
		//컨텐츠 번호를 받아서 no에 넣는다
  		int no = Integer.parseInt(request.getParameter("host_content_no"));
		
		String host_id = (String) session.getAttribute("host_id"); //호스트 아이디 받고
		String user_id = (String) session.getAttribute("user_id"); //유저 아이디 받고

// 		int no = 20;

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
	 	
	 	SimpleDateFormat format1 = new SimpleDateFormat ("yyyy-MM-dd");
	 	
	 			
	 	Date time = new Date();
	 			
	 	String time1 = format1.format(time);
	 	
// 	 	System.out.println(time1);
	%>
 <!--     	자바 영역 끝입니다---------------------------------------------------------- -->
    
<!--     	스타일 영역 시작입니다---------------------------------------------------------- -->
    <style>
		  .float1.float2{
		 	 border: 1px dotted black;
		 	 float:left;
		  	 width:50%
		  }  
		 
		  .float2
		  
		  .float1::after {
            content: "";
            display: block;
            clear: both;
       	  }
       	  
		   .float2.main{
		  	width:75%;
			/* 		  	글 안넘어가게 하는 명령어 */
		  	word-break:break-all; 
		 
		  	margin-left: auto;
            
		  }
		  
		  .float2.sub{
			width:300px;
		  	position: fixed;
		  	top: 45.5%;
            right: 10.00%;
            height : 237px;
            /* 		  	글 안넘어가게 하는 명령어 */
            word-break:break-all;
		  }
		  
		  .form_button{
		 	 width:300px;
		 	 display : block;
		 	 
		  }
		     *{
           box-sizing: border-box;
       }
       
       #container, #footer, #header {
        margin: 0 auto;
        width: 400px;  
    }       
       .join_content{
           width: 100%; 
/*            border: 1px solid black; */
       }
       
        .join_title {
        margin: 19px 0 8px;
        font-size: 14px;
        font-weight: 700;
/*         border: 1px solid black; */
    }
       .join_box *{
           border: solid 1px darkgray;
           padding: 30px;
           width: 20%; 
       }
       .email_box *{
           height: 32px;          
       }
       #email_id{
           width: 220px;
           border: solid 1px darkgray;
       }
       .join_btn{
            font-size:1.5rem;
            padding:0.5rem;
            background-color: #F98967;
            color:white;
            border:none;
            border-radius: 10px;
        }       
        
             div{
/*  		 border: 1px solid black;    */
       }
       .side{
           width: 170px;
           float: left;         
       }
       
       .side .side_menu > ul > li > a {
            margin: 0;
            padding: 0;
            border: 0;
            font-size: 16px;
            font-weight: 500;
            color: black;
            line-height: 40px;
            display: block;
            text-decoration: none;
       }
       
       ul{
           list-style: none;
       }
       .side .side_menu > ul > li:hover{
            background-color: antiquewhite;
            color: black;
       }
       .side .side_menu > ul > li{
            padding: 0px 0px 0px 10px;
           
       }
        .content{
           float: left;
           width: 1000px;
           font-size: 16px;
           font-weight: 500;
           color: black;
           line-height: 40px;content
           display: block;
           padding: 0px 20px 0px 0px;
          
       }
         /* 여백 주기 */
        .row-empty{
            height: 30px;
        }
        #dd{
        	margin: auto;
        	width: 1200px;
        }
         /* .float끝나는 영역을 가상으로 생성하고 clear(가상선택자) */
        #dd::after{
            content:"";
            display: block;
            clear: both;
        }
	
    </style>
    <!--     	스타일 영역 끝입니다---------------------------------------------------------- -->
   
	<!--    슬라이더를 불러옵니다 -->
   
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/deslider/1.5.1/style.css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/slider.js"></script>
    
    
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
            var containerId = '.deslider-container';

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
            	var minDate;
            	var maxDate;
            	
            	var startDate = moment("<%=time1%>");
            	var finishDate = moment("<%=HCdto.getHost_content_start_date().substring(0, 10)%>")
//             	console.log(startDate);
//             	console.log(startDate.isValid());
//             	console.log(finishDate);
//             	console.log(finishDate.isValid());
//             	console.log(startDate.diff(finishDate));//-나오면 startDate가 finishDate 이전이란 뜻
            	
//             	var duration = moment.duration(finishDate.diff(startDate));
//             	console.log(duration);
//             	console.log(duration.asDays());
            	//날짜 지정
                if(startDate.diff(finishDate) > 0){
                	minDate = moment(new Date()).add(0, 'days');
                	maxDate = moment('<%=HCdto.getHost_content_last_date().substring(0, 10) %>');
                }
                else{
                	minDate = moment('<%=HCdto.getHost_content_start_date().substring(0, 10) %>');
                	maxDate = moment('<%=HCdto.getHost_content_last_date().substring(0, 10) %>');
                }
            	
            	
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
                       
                   minDate : minDate,
                   maxDate : maxDate,
               		
                   //날짜형식설정
                    format:'YYYY-MM-DD'
                    };
                    var picker = new Lightpick(options);
                }
            	
           	 	function addLoadEvent(func) {
                	var oldonload = window.onload;
                   	 if(typeof window.onload != 'function') {
                        window.onload = func;
                   	 } else {
                        window.onload = function() {
                            oldonload();
                            func();
                    			}
                			}	
            		}

           	 		addLoadEvent(loadSlider);
            		addLoadEvent(loadPicker);
            	
            	
            	//이 페이지에서 예약 실행
            	
//             	window::onload(){loadSlider();}
//             	window::onload(){loadPicker();} 
        		
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
                    location.href = "<%=request.getContextPath()%>/board/host_content_list.jsp?category=<%=HCdto.getHost_content_category()%>";
                     }
                }
    </script>
    
    <!--     	스트립트 영역 끝입니다---------------------------------------------------------- -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
<jsp:include page="/template/host_header.jsp"></jsp:include>
   <div id="dd">
			 <div class="join_content" align="center">
          		 <div class="row_group">
              		<div class="join_content" >
				<!-- 이미지 슬라이더 영역 -->
    			<div class="deslider-container"></div>
    			
    			<div>
    				<h2><%=HCdto.getHost_content_name() %></h2> 
    				
    			</div>
    		
    			
    			<div><h4><%=HCdto.getHost_content_cost() %>원</h4></div>
    			<div><h3>호스트 아이디 <%=HCdto.getHost_id()%></h3></div>
    			<div><h3>호스트 연락처 <%=HIdto.getHost_phone() %></h3></div>
    			
    			<div><%=HCdto.getHost_content_info() %></div>
    			<div>
    			<%=HCdto.getHost_content_start_date().substring(0, 10) %>
    			~
    			<%=HCdto.getHost_content_last_date().substring(0, 10) %>
    			</div >
    			<div><%=HCdto.getHost_content_location() %></div>
    			<div><%=HCdto.getHost_content_ect_info() %></div>
    			<div>QnA<%=HCdto.getHost_content_qa() %></div>
    			<div> 리뷰 게시판 자리</div>
    			<%for (Users_Review_Dto dto : list) {%>
    			
    			<div><%=dto.getReview_writer() %> (<%=dto.getReview_date().substring(0, 10) %>)</div>
    			
    			<div><%=dto.getReview_content() %></div>
    			<%} %>
    			<br>
    			<!-- 댓글 작성칸이 표시될 자리 -->
			</div>

				<div class="row-empty" align="center">
				<%if(host_id != null && isHost) {%>
					<span class="join_box">
    				<button onclick="edit();" class="join_btn">수정</button> <button onclick="del();" class="join_btn">삭제</button><br>
    			<%} else {%>
    				<button onclick="list();">목록으로</button><br>
    			<%} %>
					</span>
				</div>
			</div>
			</div>
			</div>
				</div>
					</div>
						</div>

<div class="row-empty"></div>   
<div class="row-empty"></div>
<div class="row-empty"></div>
		<hr color="#F98967">   
    
<jsp:include page="/template/host_footer.jsp"></jsp:include>