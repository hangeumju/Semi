<%@page import="beans.Host_Info_Dto"%>
<%@page import="beans.Host_Info_Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String go = request.getParameter("go");
	String host_id = (String)session.getAttribute("host_id"); 
	Host_Info_Dao HIdao = new Host_Info_Dao();
	//기존 정보 불러오기 !
	Host_Info_Dto HIdto = HIdao.get(host_id);
%>

<style>
       *{
           box-sizing: border-box;
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
           line-height: 40px;
           display: block;
           padding: 0px 0px 0px 12px;
           text-align: center;
       }
         /* 여백 주기 */
        .row-empty{
            height: 80px;
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
        .check-btn{
            padding:0.4rem;
            background-color: #F98967;
            color:white;
            border:none;

            border-radius: 10px;
        }
    </style>
<jsp:include page="/template/host_header.jsp"></jsp:include>

<body>
   <div id="dd">
   
    <h2 style="margin: 20px 50px 10px"><%=HIdto.getHost_id() %>님의 프로필</h2>
     <div class="row-empty"></div>
      <!-- side_menu시작 -->
       <div class="side">
         
          <div class="side_menu">             
              <ul>
                <div style="margin: 0px 10px; font-size: 15px;">
                	<a style="text-decoration: none; color: black;" href="<%=request.getContextPath()%>/info/host_info.jsp">내 정보</a>
                </div>
                 <hr color="#F98967">
                  <li>
                      <a href="host_check.jsp?go=/info/host_change_pw.jsp">비밀번호 변경</a>
                  </li>
                  <li>                     
                      <a href="host_check.jsp?go=/info/host_change_info.jsp">내 정보 수정</a>
                  </li>
                  <li>                     
                      <a href="host_check.jsp?go=/info/host_exit.do">회원탈퇴</a>
                  </li>                  
              </ul>
          </div>
          <!-- side_menu끝 -->
       </div>
       <!-- side끝 -->

<div class="content">
	<h2>비밀번호 확인</h2>
	<form action="host_check.do" method="post">
		<input type="hidden" name="go" value="<%=go%>"> 
		<input style="margin: 0 0 0 50px;" type="password" name="host_pw" required>
		<input class="check-btn" type="submit" value="확인">
		<%if (request.getParameter("error") != null) {%>
		<h4>
			<font color="red">비밀번호를 다시 확인해주세요.</font>
		</h4>
		<%} %>
	</form>
  <div class="row-empty"></div>
  <div class="row-empty"></div>
</div>

  </div> 
  <div class="row-empty"></div>
  <div class="row-empty"></div>

   <hr color="#F98967">   
 
</body>

<jsp:include page="/template/host_footer.jsp"></jsp:include>