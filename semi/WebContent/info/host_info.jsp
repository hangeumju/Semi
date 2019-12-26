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

       div{
/*  		 border: 1px solid black;  */
       }
       .side{
           width: 170px;
           float: left;
/*           background-color:#F98967;*/
         
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
           float: right;
           width: 970px;
           font-size: 16px;
           font-weight: 500;
           color: black;
           line-height: 40px;
           display: block;
           padding: 0px 0px 0px 12px;
       }
       .ins_content{
           padding: 10px;
       }
       
       /* 여백 주기 */
        .row-empty{
            height: 80px;
        }
       span{
/*           border: 1px solid black;  */
           margin: 0px 20px 0px 0px;
       }
       
       /* .float끝나는 영역을 가상으로 생성하고 clear(가상선택자) */
        #dd::after{
            content:"";
            display: block;
            clear: both;
        }       
/*        #dd{ */
/*         	margin: auto; */
/*         	width: 1200px; */
/*         } */
	
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
                <div style="margin: 0px 10px;">내 정보</div>
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


<!-- 회원정보 출력 -->
 <div class="content">
         
        
            <div class="ins_content">               
                 <span>아이디</span>
                 <span style="margin: 0 0 0 17px;"><%=HIdto.getHost_id()%></span>
            </div>
            <div class="ins_content">               
                 <span>이름</span>
                 <span style="margin: 0 0 0 31px;"><%=HIdto.getHost_name()%></span>
            </div>
            <div class="ins_content">               
                 <span>전화번호</span>
                 <span style="margin: 0 0 0 1px;"><%=HIdto.getHost_phone()%></span>
            </div>
            <div class="ins_content">               
                 <span>가입일</span>
                 <span style="margin: 0 0 0 16px;"><%=HIdto.getHost_joindatewithFormat()%></span>
            </div>
            <div class="ins_content">               
                 <span>이메일</span>
                 <span style="margin: 0 0 0 16px;"><%=HIdto.getHost_totalmail()%></span>
            </div>
            <div class="ins_content">               
                 <span>주소</span>
                 <span style="margin: 0 0 0 35px;"><%=HIdto.getHost_address()%></span>
            </div>
            <div class="ins_content">               
                 <span>계좌 정보</span>
                 <span style="margin: 0 0 0 -3px;"><%=HIdto.getHost_bankaccount()%></span>
            </div>
            <div class="ins_content">               
                 <span>마지막 로그인 날짜</span>
                 <span style="margin: 0 0 0 -10px;"><%=HIdto.getHost_lastloginwithFormat()%></span>
            </div>
            <div class="row-empty"></div>
            <div class="row-empty"></div>
       </div>

       
<!--  ::after -->
	
   </div> 
  
   <hr color="#F98967">   
 
</body>

<jsp:include page="/template/host_footer.jsp"></jsp:include>