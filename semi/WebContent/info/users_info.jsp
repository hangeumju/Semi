<%@page import="beans.Users_Info_Dao"%>
<%@page import="beans.Users_Get_Dto"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<style>
      #jb-container {
        width: 940px;
        margin: 0px auto;
        padding: 20px;
		border: 1px solid #bcbcbc;
      }
      #jb-header {
        padding: 20px;
        margin-bottom: 20px;
        border: 1px solid #bcbcbc;
      }
      
      #jb-content {
        width: 740px;
 		padding: 20px; 
        margin-bottom: 20px;
        float: right;
		border: 1px solid #bcbcbc;
      }
      #jb-sidebar {
        width: 130px;
/*         padding: 20px; */
        margin-bottom: 20px;
        float: left;
/*         border: 1px solid #bcbcbc; */
      }
   
     /*
    테이블 스타일
    <기본>
    - table : 기본 테이블 스타일
    <옵션>
    - table-hover : 마우스가 올라간 줄에 하이라이트 적용
    - table-stripe : 2줄마다 한 줄씩 하이라이트 적용
    */
    .table{
        width:100%;
        border:1px solid black;

        /* 테두리 병합 */
        border-collapse: collapse;

    }

    .table > thead > tr > td,
    .table > thead > tr > th,
    .table > tbody > tr > td,
    .table > tbody > tr > th
    {
        border:1px solid black;
        padding:0.5rem;
    }
    
    /*
    사이드 메뉴 스타일
    - 리스트 형태로 계층 구조를 구현한 사이드 메뉴 스타일
    - 기본 폭 150px
*/
.custom-list{
    list-style: none;
    margin:0;
    padding:0;
    display:inline-block;
    width:150px;
}
.custom-list > li{
    background-color:black;
    color:white;
	padding:10px 10px 10px 10px;
	cursor:pointer;
}
    </style>
<!-- css style 끝 -->

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

<div id="jb-container">
    <div id="jb-header">
       <h2><%=id %>님의 프로필입니다</h2>
     </div>
      <div id="jb-sidebar">
        <ul class="custom-list"">
					<li><a href="<%=request.getContextPath() %>/info/users_history.jsp">이용내역</a></li>
					<li><a href="<%=request.getContextPath() %>/info/users_review.jsp">이용후기</a></li>
					<li><a href="users_check.jsp?go=/info/users_change_info.jsp">정보수정</a></li>
					<li><a href="users_check.jsp?go=/info/users_exit.do">회원탈퇴</a></li>
					<li><a href="<%=request.getContextPath() %>/info/users_point.jsp">포인트내역</a></li>
		</ul>
      </div>      
      <div id="jb-content">
            <div>               
                  아이디 : <%=UGdto.getUser_id()%>               
            </div>
            <div>               
                  이름 : <%=UGdto.getUser_name()%>               
            </div>
            <div>               
                  휴대폰번호 : <%=UGdto.getUser_phone()%>               
            </div>
            <div>               
                  포인트 : <%=UGdto.getUser_point()%>               
            </div>
            <div>              
                  이메일 : <%=UGdto.getUser_email_id()%><%=UGdto.getUser_email_domain()%>               
            </div>
            <div>               
                  관심사 : <%=UGdto.getUser_interest()%>
            </div>
        </div>

      
   </div>
   </body>
   <jsp:include page="/template/footer.jsp"></jsp:include>