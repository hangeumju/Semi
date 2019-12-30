<%@page import="beans.Reservation_Dto"%>
<%@page import="beans.Reservation_Dao"%>
<%@page import="beans.Users_Content_History_Dto"%>
<%@page import="java.util.List"%>
<%@page import="beans.Users_Content_History_Dao"%>
<%@page import="beans.Users_Get_Dto"%>
<%@page import="beans.Users_Info_Dao"%>
<%@page import="beans.Host_Info_Dto"%>
<%@page import="beans.Host_Info_Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/host_main.css">
<jsp:include page="/template/host_header.jsp"></jsp:include>  
   
    <%
    Host_Info_Dao HIdao = new  Host_Info_Dao();
    String host_id = (String)session.getAttribute("host_id");
  
    
//    페이지 크기
   int pagesize = 10;
//    네비게이터 크기
   int navsize = 10;
   
//    페이징 추가
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
   
   Reservation_Dao Rdao = new Reservation_Dao();
   
   String type = request.getParameter("type");
   String keyword = request.getParameter("keyword");
   
   boolean isSearch = type != null && keyword != null;
   
   List<Reservation_Dto> list;
   
   if(isSearch){
      list = Rdao.search(type, keyword, start, finish); 
   }
   else{
      list = Rdao.reservation_list(host_id, start, finish);
   }
   
   int count = Rdao.getCount(host_id, type, keyword);
   %>
<style>   
 *{
           box-sizing: border-box;
       }
     /*
    테이블 스타일
    */
       .notice_table {
            width: 100%;
            border-top: 1px solid lightgray;
            border-collapse: collapse;
         
          }
          th, td {
            border-bottom: 1px solid lightgray;
            padding: 10px;
          }
    
    /*
    사이드 메뉴 스타일
  
*/
     div{
/*     border: 1px solid black; */
       }
       .side{
           width: 170px;
           float: left;
/*           background-color:#F98967;*/
         
       }
       .side .side_menu > ul > li > a {
       		width:140px;
            margin: 0;
            padding: 0;
            border: 0;
            font-size: 16px;
            font-weight: 500;
            color: black;
            line-height: 40px;
            display: block;
            text-decoration: none;
            text-align: left;
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
           float: right;
           width: 970px;
           font-size: 16px;
           font-weight: 500;
           color: black;
           line-height: 40px;
           display: block;
           padding: 0px 50px 0px 0px;
       }
       
         /* .float끝나는 영역을 가상으로 생성하고 clear(가상선택자) */
        #dd::after{
            content:"";
            display: block;
            clear: both;
        }
        
       .row-empty2{
          height: 25px;
       }
       

       
    </style>
<body>
   <div id="dd">
    <h2 style="margin: 20px 50px 10px"><%=host_id %>님의 예약 차트입니다</h2>
        <form action="reservation_chart.jsp" method="get">
 <div class="row-empty"></div>
     <!-- side_menu시작 -->
       <div class="side">
         
          <div class="side_menu">
              <ul>
                <div style="margin: 0px 10px;">내 컨텐츠</div>
                 <hr color="#F98967">
                  <li>
                      <a href="<%=request.getContextPath()%>/board/reservation_chart.jsp">예약차트</a>
                  </li>
                  <li>                     
                      <a href="<%=request.getContextPath()%>/board/host_confirm_list.jsp">내 컨텐츠 리스트</a>
                  </li>
              </ul>
          </div>
          <!-- side_menu끝 -->
       </div>
       <!-- side끝 -->
       <div class="content">
            <div class="row-empty"></div>
           <div class="row-empty2"></div>
        <table class="notice_table" >
        <thead>
           <tr>
           <th>예약번호</th>
           <th>컨텐츠명</th>
           <th>예약자 이름</th>
           <th>휴대전화 번호</th>
           <th>예약된 수량</th>
           <th>예약 날짜</th>
           </tr>
        </thead>
        
        <tbody align="center">
            <%for(Reservation_Dto Rdto : list){%>
            <tr>
               <td><%=Rdto.getHistory_no() %></td>
               <td><%=Rdto.getHost_content_name() %></td>
                <td>
                <%if(Rdto.getUser_name()!=null){%>
                	<%=Rdto.getUser_name()%>
                <%} else {%>
                	탈퇴한 회원입니다
                <%} %>
                </td>
                <td>
                <%if(Rdto.getUser_phone()!=null){%>
                	<%=Rdto.getUser_phone()%>
                <%} else {%>
                	탈퇴한 회원입니다
                <%} %>
                <td><%=Rdto.getUser_qty() %></td>
                <td><%=Rdto.getUser_class_date() %></td>
             </tr>      
         <%} %>      
        </tbody>
      </table>
      </div>
    </div>
    <div class="row-empty"></div>
    <div class="row-empty"></div>
    <hr color="#F9896">
      
      <div class="row">
      <!-- 네비게이터(navigator) -->
      <jsp:include page="/template/navigator.jsp">
         <jsp:param name="pno" value="<%=pno%>"/>
         <jsp:param name="count" value="<%=count%>"/>
         <jsp:param name="navsize" value="<%=navsize%>"/>
         <jsp:param name="pagesize" value="<%=pagesize%>"/>
      </jsp:include>
   </div>
      
      
  </body>
<jsp:include page="/template/footer.jsp"></jsp:include>
