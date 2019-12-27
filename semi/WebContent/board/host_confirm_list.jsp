<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.List"%>
<%@page import="beans.Host_Content_Dto"%>
<%@page import="beans.Host_Content_Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
// 컨텐츠 불러오기
	Host_Content_Dao HCdao = new Host_Content_Dao();
	String host_id = (String)request.getSession().getAttribute("host_id");
		
// 	페이지 크기
	int pagesize = 12;
// 	네비게이터 크기
	int navsize = 10;
	
// 	페이징 추가
	int pno;
	try{
		pno = Integer.parseInt(request.getParameter("pno"));
		if(pno <= 0) throw new Exception();
	}
	catch(Exception e){
		pno = 1;
	}
	
	int finish = pno * pagesize;
	int start = finish - (pagesize - 1);
	List<Host_Content_Dto> list = HCdao.getList2(host_id, start, finish);
	int count = HCdao.getCount(host_id);
	
	System.out.println(count);
	
	/////////////절대경로 변수
	String context = request.getContextPath();
%>

	
<jsp:include page="/template/host_header.jsp"></jsp:include>
    <style>
        * { 
            box-sizing: border-box;
        }
/*         .w-100{ */
/*         	width:70%; */
/*         } */
        
        .gallary{
            
        }
        .gallary::after{
            content:"";
            display: block;
            clear: both;
        }
        
        .gallary > .gallary-item{
            float:left;
            width:25% !important;
            padding:10px;
        }
        
        .gallary > .gallary-item > .gallary-image > img{
            width:100%;
            border-radius: 50%;
            opacity: 0.5;
        }
        
        .gallary > .gallary-item:hover{
            
        }
        
        .gallary > .gallary-item:hover > .gallary-image > img{
            opacity: 1;
        }
        
        .gallary > .gallary-item> .gallary-text > h4{
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;            
        }
        
        .gallary > .gallary-item> .gallary-text > p {
            word-break:break-all;
        }
        
             div{
/* 	 	border: 1px solid black;    */
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
           line-height: 40px;
           display: block;
           padding: 0px 0px 0px 100px;
/*            text-align: center; */
       }
         /* 여백 주기 */
        .row-empty{
            height: 20px;
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


<body>
   <div id="dd">
   
    <h2 style="margin: 20px 50px 10px"><%=host_id %>님의 컨텐츠 관리</h2>
	<div class="row-empty"></div>
      <!-- side_menu시작 -->
       <div class="side">
         
          <div class="side_menu">             
              <ul>
                <div style="margin: 0px 10px;">내 컨텐츠</div>
                 <hr color="#F98967">
                  <li>
                      <a href="<%=context%>/board/host_content_produce.jsp" >컨텐츠 등록</a>
                  </li>
                  <li>                     
                      <a href="<%=context%>/board/host_confirm_list.jsp" >내 컨텐츠 목록</a>
                  </li>
                  <li>                     
                      <a href="<%=context%>/board/reservation_chart.jsp">예약자관리</a>
                  </li>                  
              </ul>
          </div>
          <!-- side_menu끝 -->
       </div>
       <!-- side끝 -->


	<!-- 갤러리 4단 나누기 -->
  <div class="content">
  <div class="gallary">

 	<% for (Host_Content_Dto dto : list) {%> 
        <div class="gallary-item">
            <div class="gallary-image">
       			<a href="<%=request.getContextPath()%>/board/host_content_detail_view.jsp?host_content_no=<%=dto.getHost_content_no()%>">
                <img src="http://placeimg.com/480/480/animals">
                </a>                
            </div>  
                      
            <div class="gallary-text">
                <h4><%=dto.getHost_content_name() %></h4>
                <h4><%=dto.getHost_content_cost() %></h4>                
                <h4><%=dto.getHost_content_view_count() %></h4>
                <h3><%=dto.getHost_content_category() %></h3>
                <h3><%=dto.getHost_content_approval() %></h3>                
            </div>
        </div>   
	<% } %>  	
 </div>
</div>             
	<!-- 갤러리 4단 나누기 종료-->
     
</div>
     <div class="row">
		<!-- 네비게이터(navigator) -->
		<jsp:include page="/template/host_list_navigator.jsp">
			<jsp:param name="pno" value="<%=pno%>"/>
			<jsp:param name="count" value="<%=count%>"/>
			<jsp:param name="navsize" value="<%=navsize%>"/>
			<jsp:param name="pagesize" value="<%=pagesize%>"/>
		</jsp:include>			
    </div>
    
    <hr color="#F9896">  

  </body>
    
<jsp:include page="/template/host_footer.jsp"></jsp:include> 