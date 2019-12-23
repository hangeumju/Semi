<%@page import="beans.Users_Content_History_Dto"%>
<%@page import="java.util.List"%>
<%@page import="beans.Users_Content_History_Dao"%>
<%@page import="beans.Users_Get_Dto"%>
<%@page import="beans.Users_Info_Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	Users_Info_Dao UIdao = new Users_Info_Dao();
	String user_id = (String)session.getAttribute("user_id");
	Users_Get_Dto UGdto = UIdao.users_get(user_id);	
	///////////////////////////////////////////////////////////////
	//세션에서 유저아이디를 받아서 이용내역 리스트를 출력합니다
	Users_Content_History_Dao UCHdao = new Users_Content_History_Dao();
	String users_history_id = (String)session.getAttribute("user_id");
	List<Users_Content_History_Dto> list = UCHdao.users_history_list(users_history_id);
%>

<jsp:include page="/template/header.jsp"></jsp:include>

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
        margin-bottom: 55px;
        float: left;
		 border: 1px solid #bcbcbc;
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
    - hover 상황에서 하위 메뉴가 펼쳐짐
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

<body>
    <div id="jb-container">
    <div id="jb-header">
       <h2><%=user_id %>님의 이용 내역입니다</h2>
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
        <table class="table" >
			<thead>
				<tr>
				<th>이용날짜</th>
				<th>컨텐츠명</th>
				<th>가격</th>
				<th>수량</th>
				<th>호스트이름</th>
				<th>호스트연락처</th>
				<th>위치</th>		
				</tr>
			</thead>
			<tbody>
			<%for(Users_Content_History_Dto UCHdto : list){%>
            <tr>
                <td><%=UCHdto.getUser_reservation_date() %></td>
                <td><%=UCHdto.getHost_content_name() %></td>
                <td><%=UCHdto.getHost_content_cost() %></td>
                <td><%=UCHdto.getUser_qty() %></td>
                <td><%=UCHdto.getHost_name() %></td>
                <td><%=UCHdto.getHost_phone() %></td>
                <td><%=UCHdto.getHost_content_location() %></td>                       
            </tr>      
			<%} %>		
        </tbody>
		</table>
      </div>
      
    </div>
  </body>


 <jsp:include page="/template/footer.jsp"></jsp:include>