
<%@page import="beans.Host_Info_Dao"%>
<%@page import="beans.Host_Info_Dto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String host_id = (String)session.getAttribute("host_id");
    Host_Info_Dao HIdao = new Host_Info_Dao();
    Host_Info_Dto HIdto = HIdao.get(host_id);
    %>

<style>
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
           padding: 10px;
           width: 100%; 
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
                      <a href="host_check.jsp?go=/info/host_exit.jsp">회원탈퇴</a>
                  </li>                  
              </ul>
          </div>
          <!-- side_menu끝 -->
       </div>
       <!-- side끝 -->

	<!-- 비밀번호 입력 -->
<div class="content">
	<div id="container">
	<form action="host_change_pw.do" method="post">
       <div class="join_content">
              <div class="join_content" style="text-align: center">
					<h3> 호스트 비밀번호 변경</h3>
					<div class="join_row">
			          <h3 class="join_title">
			                <div>변경할 비밀번호를 입력해주세요.</div>
			  		  </h3>
			          <span class="join_box">
				 			<input id="pw" class="block-item input-item" type="password" name="host_pw"  required>
					  </span>
				 	</div>
			</div>
	
	<!-- 저장 버튼 -->
			<br><br>
 			<span class="join_box">
      			<input class="join_btn" type="submit" value="변경하기">
     		</span>
   		</div>
	</form>
  </div>
</div>
</div>
<div class="row-empty"></div>
<div class="row-empty"></div>
<div class="row-empty"></div>
<div class="row-empty"></div>

   <hr color="#F98967">   
</body>

<jsp:include page="/template/host_footer.jsp"></jsp:include>