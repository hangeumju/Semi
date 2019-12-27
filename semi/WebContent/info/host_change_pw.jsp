<%@page import="beans.Host_Info_Dao"%>
<%@page import="beans.Host_Info_Dto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String host_id = (String)session.getAttribute("host_id");
    Host_Info_Dao HIdao = new Host_Info_Dao();
    Host_Info_Dto HIdto = HIdao.get(host_id);
    %>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/CSS/common.css">
<jsp:include page="/template/host_header.jsp"></jsp:include>
<form action="host_change_pw.do" method="get">

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
div {
	/*     border: 1px solid black; */
	
}

.side {
	width: 170px;
	float: left;
	/*           background-color:#F98967;*/
}

.side .side_menu>ul>li>a {
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

ul {
	list-style: none;
}

.side .side_menu>ul>li:hover {
	background-color: antiquewhite;
	color: black;
}

.side .side_menu>ul>li {
	padding: 0px 0px 0px 10px;
}

.content {
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
#dd::after {
	content: "";
	display: block;
	clear: both;
}

.row-empty2 {
	height: 25px;
}

.join_btn {
	font-size: 13px;
	padding: 4px;
	background-color: #F98967;
	color: white;
	border: none;
	border-radius: 10px;
}

</style>
<!-- css style 끝 -->
	<!-- 비밀번호 입력 -->
<body>
	<div id="dd">
		<hr color="#F9896">
		<h2 style="margin: 20px 50px 10px"><%=HIdto.getHost_id()%>님의 정보를
			비밀번호를 수정하시나요?
		</h2>
		<div class="row-empty"></div>
		<!-- side_menu시작 -->
       <div class="side">
         
          <div class="side_menu">
             
              <ul>
                <div style="margin: 0px 10px;">내 정보</div>
                 <hr color="#F9896">
                  <li>
                      <a href="<%=request.getContextPath()%>/board/reservation_chart.jsp">예약차트</a>
                  </li>
                  <li>                     
                      <a href="<%=request.getContextPath()%>/board/host_confirm_list.jsp">내 컨텐츠 리스트</a>
                      
                  </li>
                  <hr color="#F9896">
              </ul>
          </div>
          <!-- side_menu끝 -->
       </div>
       
       <!-- side끝 -->
           <section>
			<div align="center">
				<h1>신규 비밀번호 입력</h1>
				<form action="host_change_pw.do" method="get">

				<input type="password" name="host_pw" required> 
				<input class="join_btn" type="submit" value="완료">

				</form>
			</div>
	</div>
</body>
</form>
<hr color="#F9896">
</section>

<jsp:include page="/template/host_footer.jsp"></jsp:include>