<%@page import="beans.Host_Info_Dao"%>
<%@page import="beans.Host_Info_Dto"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	/////////////절대경로 변수
	String context = request.getContextPath();
	Host_Info_Dao HIdao = new Host_Info_Dao();
	//Host_Info_Dto HIdto = new Host_Info_Dto();
	String host_id = (String) session.getAttribute("host_id");
	Host_Info_Dto HIdto = HIdao.get(host_id);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호스트 메인</title>
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/host_main.css">

</head>
<body>
    <header>
        <div class="title">
        	<a href="">
        		<img src="">
        	</a>
       	</div>
     </header>
     
	<nav>
		<ul>
	        <li><a class="active" href="/semi/host/submain2.jsp">Home</a></li>
	         <li class="dropdown">
	             <a href="<%=context%>/info/host_info.jsp" class="dropbtn">호스트 내정보</a>
	             <div class="dropdown-content">
	                 <a href="<%=context%>/info/host_change_info.jsp">정보수정</a>
	                 <a href="<%=context%>/info/host_info.jsp">탈퇴</a>
	             </div>
	         </li>
	         <li class="dropdown">
	             <a href="javascript:void(0)" class="dropbtn">컨텐츠 관리</a>
	             <div class="dropdown-content">
	                 <a href="#">상품등록</a>
	                 <a href="#">상품 리스트</a>
	                 <a href="#">리뷰관리</a>
	                 <a href="<%=request.getContextPath()%>/board/reservation_chart.jsp">예약자관리</a>
		            </div>
		        </li>
		        <li class="dropdown">
		            <a href="javascript:void(0)" class="dropbtn">정산</a>
	             <div class="dropdown-content">
	                 <a href="#">정산차트</a>
	             </div>
		            </li>
	         <li class="dropdown">
	             <a href="<%=context%>/board/notice.jsp" class="dropbtn">공지사항</a>
              <div class="dropdown-content">
                  <a href="<%=context%>/board/notice.jsp">공지사항</a>
                  <a href="#">당일치기 위치안내</a>
              </div>
          </li>
      </ul> 
    </nav>
			<div class="gallary-item">
				<h1>환영합니다!</h1>
				<h3>
					호스트 (<%=HIdto.getHost_id()%>) 님!
				</h3>

			</div>
			<!--     공지사항 창입니다 아직 공지사항이 구현되지 않아 이곳도 미구현입니다 -->
			<div class="gallary-item">공지사항</div>
</body>
</html>