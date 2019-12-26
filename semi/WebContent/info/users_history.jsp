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
//	 		하단 네비게이터 계산하기
//			- 시작블록 = (현재페이지-1) / 네비게이터크기 * 네비게이터크기 +1	
	//**************************************************************************************
		int count = UCHdao.users_content_history_count(user_id); 
		System.out.println(count);
		int pagecount = (count + pagesize) / pagesize; 
		
		int startBlock = (pno -1) / navsize * navsize + 1;
		int finishBlock = startBlock + (navsize -1);
		
		//만약 마지막 블록이 페이지 수보다 크다면 수정 처리
		if(finishBlock > pagecount){
			finishBlock = pagecount;
		}
		
	List<Users_Content_History_Dto> list = UCHdao.users_history_list(users_history_id, start, finish);
%>

<jsp:include page="/template/header.jsp"></jsp:include>

<style>   
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
     div{
/*     border: 1px solid black; */
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
<!-- css style 끝 -->

<body>
    <div id="dd">
   	<hr>
    <h2 style="margin: 20px 50px 10px"><%=user_id %>님의 이용 내역입니다</h2>
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
			<thead>
				<tr>
				<th>결제날짜</th>
				<th>컨텐츠명</th>
				<th>가격</th>
				<th width="100px" >수량</th>
				<th>호스트이름</th>
				<th>호스트연락처</th>
				<th>이용날짜</th>
				<th>위치</th>		
				</tr>
			</thead>
			
			<tbody  align="center">
			<%for(Users_Content_History_Dto UCHdto : list){%>
            <tr>
                <td><%=UCHdto.getUser_reservation_date() %></td>
                <td><%=UCHdto.getHost_content_name() %></td>
                <td><%=UCHdto.getHost_content_cost() %></td>
                <td><%=UCHdto.getUser_qty() %></td>
                <td><%=UCHdto.getHost_name() %></td>
                <td><%=UCHdto.getHost_phone() %></td>
                <td><%=UCHdto.getUser_class_date() %></td>
                <td><%=UCHdto.getHost_content_location() %></td>                       
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