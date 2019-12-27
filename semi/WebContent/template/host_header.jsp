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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/host_main.css">
    <title></title>
    <style>
        
    </style>
</head>
<body>
    <main>
        <header>
        <div class="title">
        	<a href="<%=request.getContextPath()%>/host/host_submain.jsp">
        		<img src="/semi/image/header.png" width="60%">
        	</a>
       	</div>
     </header>
     
       <nav>
		<ul>
	        <li><a class="active" href="/semi/host/host_submain.jsp">Home</a></li>
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
	                 <a href="<%=context%>/board/host_content_produce.jsp" >상품등록</a>
	                 <a href="<%=context%>/board/host_confirm_list.jsp" >상품 리스트</a>
	                 <a href="<%=context%>/board/reservation_chart.jsp">예약자관리</a>
		            </div>
		        </li>
		        <li class="dropdown">
		            <a href="javascript:void(0)" class="dropbtn">정산</a>
	             <div class="dropdown-content">
	                 <a href="<%=context%>/board/host_calculate_chart.jsp">정산차트</a>
	             </div>
		            </li>
	         <li class="dropdown">
	             <a href="<%=context%>/board/notice.jsp" class="dropbtn">공지사항</a>
              <div class="dropdown-content">
                  <a href="<%=context%>/board/notice.jsp">공지사항</a>
              </div>
          </li>
      </ul> 
    </nav>