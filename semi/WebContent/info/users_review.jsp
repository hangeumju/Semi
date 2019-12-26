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

		String review_writer = (String)session.getAttribute("user_id");  //나중에 주석풀어서 이거 쓰기
// 	String review_writer = "dladnwls";

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
			int count = URdao.users_review_count(review_writer);
			int pagecount = (count + pagesize) / pagesize;
			
			int startBlock = (pno -1) / navsize * navsize + 1;
			int finishBlock = startBlock + (navsize -1);
			
			//만약 마지막 블록이 페이지 수보다 크다면 수정 처리
			if(finishBlock > pagecount){
				finishBlock = pagecount;
			}
	List<Users_Review_Dto> list = URdao.users_review_list(review_writer, start, finish);
%>

<jsp:include page="/template/header.jsp"></jsp:include>

<style>
     div{
/* 		border: 1px solid black; */
       }
       
      /*
    테이블 스타일
    */
 		.notice_table {
            width: 100%;
            border-top: 1px solid lightgray;
            border-collapse: collapse;
         
          }
          th, td {
            border-bottom: 1px solid lightgray;
            padding: 10px;
          }
    
    /*
    사이드 메뉴 스타일  
*/
<<<<<<< HEAD
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
           padding: 0px 50px 0px 0px;
       }
       
         /* .float끝나는 영역을 가상으로 생성하고 clear(가상선택자) */
        #dd::after{
            content:"";
            display: block;
            clear: both;
        }
        
       .row-empty2{
       	height: 25px;
       }
       </style>
=======
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
>>>>>>> refs/remotes/origin/master


<!-- 				후기 내용이 들어갈 자리 -->
<!-- 				들어갈 내용 : 컨텐츠 넘버/ 유저 이름(작성자) / 작성일 / 리뷰내용/ 컨텐츠 넘버   -->
<body>
<<<<<<< HEAD
	<div id="dd">
    <hr>
	<h2 style="margin: 20px 50px 10px"><%=user_id %>님의 리뷰게시판입니다</h2>
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
        	<div class="row-empty2"></div>
        <table class="notice_table" >
=======
	<div id="jb-container">
    <div id="jb-header">
		<h2><%=user_id %>님의 리뷰게시판입니다</h2>
	</div>
    <div id="jb-sidebar">
        <ul class="custom-list"">
				<li><a href="<%=request.getContextPath()%>/info/users_history.jsp">이용내역</a></li>
				<li><a href="<%=request.getContextPath()%>/info/users_review.jsp">이용후기</a></li>
				<li><a href="users_check.jsp?go=/info/users_change_info.jsp">정보수정</a></li>
				<li><a href="users_check.jsp?go=/info/users_exit.do">회원탈퇴</a></li>
				<li><a href="<%=request.getContextPath()%>/info/users_point.jsp">포인트내역</a></li>
		</ul>
	</div>
	<div class="jb-content" align="center">
        <table class="table">
>>>>>>> refs/remotes/origin/master
        <thead>
        	<tr>
	        <th>작성번호</th>
        	<th>컨텐츠내용</th>
        	<th>작성자</th>
        	<th>작성일</th>
	        </tr>
        </thead>
        
        <tbody align="center">
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
	    <div class="row-empty"></div>
	    <div class="row-empty"></div>
    <hr>
    
    	<div class="row">
		<!-- 네비게이터(navigator) -->
		<jsp:include page="/template/navigator.jsp">
			<jsp:param name="pno" value="<%=pno%>"/>
			<jsp:param name="count" value="<%=count%>"/>
			<jsp:param name="navsize" value="<%=navsize%>"/>
			<jsp:param name="pagesize" value="<%=pagesize%>"/>
		</jsp:include>
	</div>
	
</body>
  
<jsp:include page="/template/footer.jsp"></jsp:include>