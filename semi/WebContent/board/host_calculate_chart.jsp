
<%@page import="java.util.Date"%>
<%@page import="beans.Host_Calculate_Dao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <jsp:include page="/template/host_header.jsp"></jsp:include>   
    <%
	//전달 날짜 구하기
	Calendar mon = Calendar.getInstance();
	mon.add(Calendar.MONTH , -1);
	String beforeMonth = new java.text.SimpleDateFormat("yyyy/MM/dd").format(mon.getTime()).substring(2, 7);
	//오늘날짜 구하기 
	SimpleDateFormat format1 = new SimpleDateFormat ("yyyy/MM/dd");
	Date time = new Date();
	String month = format1.format(time).substring(2, 7);
	
// 	System.out.println(beforeMonth);
// 	System.out.println(time1);
	
    String host_id = (String)request.getSession().getAttribute("host_id");
    
    Host_Calculate_Dao HCCdao = new Host_Calculate_Dao();
    
    int total = HCCdao.total_pay(host_id);
    int pmonth = HCCdao.total_pay(host_id, month);
    int bmonth = HCCdao.before_total_pay(host_id, beforeMonth);
    
    System.out.println(total);
    System.out.println(pmonth);
    System.out.println(bmonth);
    %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/host_main.css">
	<style>   
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
	<h2 style="margin: 20px 50px 10px"><%=host_id %>님의 정산 차트입니다</h2>
	 <div class="row-empty"></div>
     <!-- side_menu시작 -->
       <div class="side">
         
          <div class="side_menu">
             
              <ul>
                <div style="margin: 0px 10px;">내 정산</div>
                 <hr color="#F9896">
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
	        <th>총금액</th>
        	<th>당월 금액</th>
        	<th>전월 금액</th>
	        </tr>
        </thead>
        
        <tbody align="center">
    <tr>
        <td><%=total %>원</td>
		<td><%=pmonth %>원</td>
		<td><%=bmonth %>원</td>
	</tr>
	 </tbody>
		</table>
      </div>
    </div>
    <div class="row-empty"></div>
    <div class="row-empty"></div>
</body>
<jsp:include page="/template/host_footer.jsp"></jsp:include>
  