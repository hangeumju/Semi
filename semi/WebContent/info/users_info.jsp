<%@page import="beans.Users_Info_Dao"%>
<%@page import="beans.Users_Get_Dto"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

 <style>
       div{
/*            border: 1px solid black; */
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
            height: 40px;
        }
       span{
/*            border: 1px solid black; */
           margin: 0px 20px 0px 0px;
       }
       
       /* .float끝나는 영역을 가상으로 생성하고 clear(가상선택자) */
        #dd::after{
            content:"";
            display: block;
            clear: both;
        }
       
   </style>
<%
   //회원 정보를 불러오는 코드
   //1. session에서 id에 들어있는 데이터를 꺼낸다
   //2. id를 주고dao를 이용하여 회원정보(Dto)를 꺼낸다
   //3. 원하는 위치에 출력한다.    

   String id = (String) session.getAttribute("user_id");
   Users_Get_Dto UGdto;
   
    Users_Info_Dao UGdao = new Users_Info_Dao();
    UGdto = UGdao.users_get(id);
%>

<jsp:include page="/template/header.jsp"></jsp:include>


<body>
   <div id="dd">
    <hr>
     <h2 style="margin: 20px 50px 10px"><%=id %>님의 프로필</h2>
     <div class="row-empty"></div>
      <!-- side_menu시작 -->
       <div class="side">
         
          <div class="side_menu">
             
              <ul>
                <div style="margin: 0px 10px;">내 정보</div>
                 <hr>
                  <li>
                      <a href="<%=request.getContextPath() %>/info/users_history.jsp">이용내역</a>
                  </li>
                  <li>                     
                      <a href="<%=request.getContextPath() %>/info/users_review.jsp">이용후기</a>
                  </li>
                  <li>                     
                      <a href="users_check.jsp?go=/info/users_change_info.jsp">정보수정</a>
                      
                  </li>
                  <li>                     
                      <a href="users_check.jsp?go=/info/users_exit.do">회원탈퇴</a>
                  </li>
                  <li>                     
                      <a href="<%=request.getContextPath() %>/info/users_point.jsp">포인트내역</a>
                  </li>
                  <hr>
              </ul>
          </div>
          <!-- side_menu끝 -->
       </div>
       <!-- side끝 -->
       
       <div class="content">
            <div class="row-empty"></div>
        
            <div class="ins_content">               
                 <span>아이디</span>
                 <span style="margin: 0 0 0 17px;"><%=UGdto.getUser_id()%></span>
            </div>
            <div class="ins_content">               
                 <span>이름</span>
                 <span style="margin: 0 0 0 31px;"><%=UGdto.getUser_name()%></span>
            </div>
            <div class="ins_content">               
                 <span>휴대전화</span>
                 <span style="margin: 0 0 0 1px;"><%=UGdto.getUser_phone()%></span>
            </div>
            <div class="ins_content">               
                 <span>포인트</span>
                 <span style="margin: 0 0 0 16px;"><%=UGdto.getUser_point()%></span>
            </div>
            <div class="ins_content">               
                 <span>이메일</span>
                 <span style="margin: 0 0 0 16px;"><%=UGdto.getUser_email_id()%><%=UGdto.getUser_email_domain()%></span>
            </div>
            <div class="ins_content">               
                 <span>관심사</span>
                 <span style="margin: 0 0 0 16px;"><%=UGdto.getUser_interest()%></span>
            </div>
            <div class="row-empty"></div>
            <div class="row-empty"></div>
       </div>
       
<!--  ::after -->
	
   </div> 
  
   <hr>    
</body>

   <jsp:include page="/template/footer.jsp"></jsp:include>