<%@page import="beans.Users_Review_Dao"%>
<%@page import="java.util.List"%>
<%@page import="beans.Users_Info_Dao"%>
<%@page import="beans.Users_Review_Dto"%>
<%@page import="beans.Users_Get_Dto"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	//유저 정보를 불러오는 코드 
	Users_Info_Dao UIdao = new Users_Info_Dao();
 	String user_id = (String) session.getAttribute("user_id"); 
	Users_Get_Dto UGdto = UIdao.users_get(user_id); 
	///////////////////////////////////////////////////////////////
	//유저 리뷰테이블 정보를 불러오는 코드 (작성자=유저아이디 기준으로 작성일,컨텐츠넘버,리뷰넘버,리뷰내용을 불러온다)
// 	Users_Review_Dto URdto;
	Users_Review_Dao URdao = new Users_Review_Dao();
// 		String review_writer = (String)session.getAttribute("user_id");  //나중에 주석풀어서 이거 쓰기
	String review_writer = "dladnwls";
	List<Users_Review_Dto> list = URdao.users_review_list(review_writer);
	
	//네비게이터 내용
	//페이지 크기
			int pagesize = 10;
			//네비게이터 크기
			int navsize = 10;
			
			//페이징 추가
			int pno;
			try{
				pno = Integer.parseInt(request.getParameter("pno"));
				if(pno <= 0) throw new Exception(); //음수를 입력하면 예외를 발생시킨다
			}
			catch(Exception e){
				pno = 1;
			}
				
			int finish = pno * pagesize;
			int start = finish - (pagesize - 1);
			//	System.out.println("start = " + start + " , finish = " + finish);
			
		//**************************************************************************************
//		 		하단 네비게이터 계산하기
//				- 시작블록 = (현재페이지-1) / 네비게이터크기 * 네비게이터크기 +1	
		//**************************************************************************************
			int count = URdao.users_review_count(); 
			int pagecount = (count + pagesize) / pagesize;
			
			int startBlock = (pno -1) / navsize * navsize + 1;
			int finishBlock = startBlock + (navsize -1);
			
			//만약 마지막 블록이 페이지 수보다 크다면 수정 처리
			if(finishBlock > pagecount){
				finishBlock = pagecount;
			}
%>

<jsp:include page="/template/header.jsp"></jsp:include>

<style>
      #jb-container {
        width: 1100px;
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


<!-- 				후기 내용이 들어갈 자리 -->
<!-- 				들어갈 내용 : 컨텐츠 넘버/ 유저 이름(작성자) / 작성일 / 리뷰내용/ 컨텐츠 넘버   -->
<body>
	<div id="jb-container">
    <div id="jb-header">
		<h2><%=user_id %>님의 리뷰게시판입니다</h2>
	</div>
    <div id="jb-sidebar">
        <ul class="custom-list"">
				<li><ahref="<%=request.getContextPath()%>/info/users_history.jsp">이용내역</a></li>
				<li><ahref="<%=request.getContextPath()%>/info/users_review.jsp">이용후기</a></li>
				<li><a href="users_check.jsp?go=/info/users_change_info.jsp">정보수정</a></li>
				<li><a href="users_check.jsp?go=/info/users_exit.do">회원탈퇴</a></li>
				<li><a href="<%=request.getContextPath()%>/info/users_point.jsp">포인트내역</a></li>
		</ul>
	</div>
	<div class="jb-content">
        <table class="table" >
        <thead>
        	<tr>
	        <th>작성번호</th>
        	<th>컨텐츠내용</th>
        	<th>작성자</th>
        	<th>작성일</th>
	        </tr>
        </thead>
        <tbody>
        <%for(Users_Review_Dto URdto : list) {%>
        <tr>
			<td><%=URdto.getReview_no() %></td>
			<%-- <td>컨텐츠넘버:<%=URdto.getContent_original_no() %></td> --%>
			<td><%=URdto.getReview_content() %></td>
			<td><%=URdto.getReview_writer() %></td>
			<td><%=URdto.getReview_date() %></td>
		</tr>
		<%} %>
        </tbody>
		</table>
		</div>
			
	</div>
</body>
  
<div class="row">
		<!-- 네비게이터(navigator) -->
		<jsp:include page="/template/navigator.jsp">
			<jsp:param name="pno" value="<%=pno%>"/>
			<jsp:param name="count" value="<%=count%>"/>
			<jsp:param name="navsize" value="<%=navsize%>"/>
			<jsp:param name="pagesize" value="<%=pagesize%>"/>
		</jsp:include>
	</div>

<jsp:include page="/template/footer.jsp"></jsp:include>