<%@page import="beans.Host_Info_Dto"%>
<%@page import="beans.Host_Info_Dao"%>
<%@page import="java.util.Date"%>
<%@page import="beans.Host_Calculate_Dao"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%
	/////////////절대경로 변수
	String context = request.getContextPath();
	Host_Info_Dao HIdao = new Host_Info_Dao();
	//Host_Info_Dto HIdto = new Host_Info_Dto();
	String host_id = (String) session.getAttribute("host_id");
	Host_Info_Dto HIdto = HIdao.get(host_id);

	//전달 날짜 구하기
	Calendar mon = Calendar.getInstance();
	mon.add(Calendar.MONTH , -1);
	String beforeMonth = new java.text.SimpleDateFormat("yyyy/MM/dd").format(mon.getTime()).substring(2, 7);
	//오늘날짜 구하기 
	SimpleDateFormat format1 = new SimpleDateFormat ("yyyy/MM/dd");
	Date time = new Date();
	String month = format1.format(time).substring(2, 7);
	
	
    Host_Calculate_Dao HCCdao = new Host_Calculate_Dao();
    
    int total = HCCdao.total_pay(host_id);
    int pmonth = HCCdao.total_pay(host_id, month);
    int bmonth = HCCdao.before_total_pay(host_id, beforeMonth);
    
    %>
    
	<style>     
	 *{
           box-sizing: border-box;
       }
	          
  /* 전체 글꼴 */
	@font-face {
	font-family: NanumSquareR;
	src: url("../font/NanumSquareR.ttf");
	}
       
    #dd::after{
        content:"";
        display: block;
        clear: both;
       }
        
    .row-empty2{
      height: 25px;
     }

	.sohee-title {
	color: white;
	background-color: #F98967;
	opacity: 100%;
	padding: 10px;
	font-size: 14px;
	}
	
	/* 소희-상품 가격 글꼴스타일 	   */
	.gallary-text-cost {
	color: black;
	font-size: "14px;
	opacity: "10";
	font-weight: bold;
	padding: 5px;
	border-radius: 10%;
	}

	.gallary{
		padding:50px;
		margin: auto;
/* 		border: 1px solid black; */
		text-align: center;
	}
	.gallary-item{
		display:inline-block;
/* 		border: 1px solid black;		 */
		width: 300px;
		padding: 20px;
	}
	

	</style>
       

	<jsp:include page="/template/host_header.jsp"></jsp:include>
	<body>
			<div class="title" align ="center">
					<h1>환영합니다!</h1>
					<h3> 호스트 <%=HIdto.getHost_name() %> 
					(<%=HIdto.getHost_id()%>)님 ! </h3>
			</div>
		
<div class="row-empty"></div>
			
		<div id="dd">
		<div class="gallary">

		<div class="gg">
			<div class="gallary-item">
					<div class="gallary-image" align="center">
						<a href="<%=request.getContextPath()%>/board/host_calculate_chart.jsp">
						<img style="width: 100%;" src="<%=request.getContextPath()%>/image/count.png" width="120" height="230"></a>
					</div>
					<h3><%=HIdto.getHost_id()%>님의 정산 내역</h3>
					<div class="gallary-text-cost"><%=pmonth %>원</div>
			</div>
			
		
			<div class="gallary-item" >
					<div class="gallary-image">
						<a href="#">
						<img style="width: 100%;" src="<%=request.getContextPath() %>/image/call.png" width="120" height="230"></a>
					</div>
					<h3>고객센터 및 사업제휴</h3>
					<div class="gallary-text-cost">1588-1588</div>
			</div>
			</div>
			
		</div>
	</div> 


    <div class="row-empty"></div>
    <div class="row-empty"></div>
    <hr color="#F98967">  
</body>
<!--     공지사항 창입니다 아직 공지사항이 구현되지 않아 이곳도 미구현입니다 -->
<jsp:include page="/template/footer.jsp"></jsp:include>