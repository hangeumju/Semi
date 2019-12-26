<%@page import="beans.Host_Info_Dao"%>
<%@page import="beans.Host_Info_Dto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 	<%
 	String host_id = (String)session.getAttribute("host_id"); 
 	Host_Info_Dao HIdao = new Host_Info_Dao();
 	//기존 정보 불러오기 !
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
        }       
</style>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/CSS/common.css">
<jsp:include page="/template/host_header.jsp"></jsp:include>

	<div id="container">
       <div class="join_content">
           <div class="row_group">
              <div class="join_content" style="text-align: center">
	<h2><%=HIdto.getHost_id() %>님의 정보</h2>
     </div>         
<br>
<!-- 회원정보 출력 -->
	<!-- 히든정보 -->
	<!-- 아이디 -->
			 <div class="join_row">
                   <h3 class="join_title">
                       <div>아이디</div>
                    </h3>
                  <span class="join_box">
				<div><%=HIdto.getHost_id()%></div>
				</span>
			</div>
	<!-- 이름 -->			
		 <div class="join_row">
                   <h3 class="join_title">
                       <div>이름</div>
                    </h3>
                  <span class="join_box">
				<div><%=HIdto.getHost_name()%></div>
				</span>
			</div>
	<!-- 전화번호 -->
				 <div class="join_row">
                   <h3 class="join_title">
                       <div>전화번호</div>
                    </h3>
                  <span class="join_box">
				<div><%=HIdto.getHost_phone()%></div>
				</span>
			</div>
				
	<!-- 가입일 -->
		 <div class="join_row">
                   <h3 class="join_title">
                       <div>가입일</div>
                    </h3>
                  <span class="join_box">
				<div><%=HIdto.getHost_joindatewithFormat()%></div>
				</span>
			</div>
	
	<!-- 이메일 -->		
		<div class="join_row">
                   <h3 class="join_title">
                       <div>이메일</div>
                    </h3>
                  <span class="join_box">
				<div><%=HIdto.getHost_totalmail()%></div>
				</span>
			</div>
				
	<!-- 최종로그인시간 -->	
	<div class="join_row">
                   <h3 class="join_title">
                       <div>마지막 로그인 날짜</div>
                    </h3>
                  <span class="join_box">
				<div><%=HIdto.getHost_lastloginwithFormat()%></div>
				</span>
			</div>
				
	<!-- 주소 -->	
	<div class="join_row">
                   <h3 class="join_title">
                       <div>주소</div>
                    </h3>
                  <span class="join_box">
				<div><%=HIdto.getHost_address()%></div>
				</span>
			</div>
				
	<!-- 은행-->	
	<div class="join_row">
                   <h3 class="join_title">
                       <div>계좌 정보</div>
                    </h3>
                  <span class="join_box">
				<div><%=HIdto.getHost_bankaccount()%></div>
			</span>
		</div>
		</div>
			</div>
			<br><br>
<h4><a href="host_check.jsp?go=/info/host_change_pw.jsp">
<font size ="5" color="#F98967">비밀번호 변경</font></a></h4>
<h4><a href="host_check.jsp?go=/info/host_change_info.jsp">
<font size ="5" color="#F98967">회원정보 수정</font></a></h4>
<h4><a href="host_check.jsp?go=/info/host_exit.jsp">
<font size ="5" color="#F98967">회원 탈퇴</font></a></h4>
</div>

<jsp:include page="/template/host_footer.jsp"></jsp:include>



