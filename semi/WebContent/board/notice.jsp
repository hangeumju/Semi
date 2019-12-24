<%@page import="beans.Notice_Board_Dao"%>
<%@page import="beans.Notice_Board_Dto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>

<%
	Notice_Board_Dao NBdao = new Notice_Board_Dao();	

	//페이징 추가
	int pno;
	try{
		pno = Integer.parseInt(request.getParameter("pno"));
		if(pno <= 0) throw new Exception(); //음수를 입력하면 예외를 발생시킨다
	}
	catch(Exception e){
		pno = 1;
	}
	
	//페이지 크기
	int pagesize = 10;
		
	int finish = pno * pagesize;
	int start = finish - (pagesize - 1);
	//	System.out.println("start = " + start + " , finish = " + finish);
	
//**************************************************************************************
// 		하단 네비게이터 계산하기
//		- 시작블록 = (현재페이지-1) / 네비게이터크기 * 네비게이터크기 +1	
//**************************************************************************************
	int count = NBdao.notice_board_count(); //전체글 개수를 구하는 메소드 108개
	int navsize = 10;
	int pagecount = (count + pagesize) / pagesize; //전체 페이지 수 11개
	
	int startBlock = (pno -1) / navsize * navsize + 1;
	int finishBlock = startBlock + (navsize -1);
	
	//만약 마지막 블록이 페이지 수보다 크다면 수정 처리
	if(finishBlock > pagecount){
		finishBlock = pagecount;
	}

	List<Notice_Board_Dto> list = NBdao.notice_board_list(start, finish);
%>

<style>
        .notice_table {
            width: 100%;
            border-top: 1px solid #444444;
            border-collapse: collapse;
          }
          th, td {
            border-bottom: 1px solid #444444;
            padding: 10px;
          }
    
    .page-navigator{
            list-style: none;
            padding:0;
            margin:0;
             display: inline-block;
        }
        .page-navigator::after{
            content: "";
            display: block;
            clear: both;
        }
        .page-navigator > li{
            float:left;
            background-color: #B1DB4E;
            color: white;
            padding: 1rem;            
        }
        .page-navigator > li.active{
            background-color: black;
        }
        .page-navigator > li > a{
            color: white;
            text-decoration: none;
        }
        .page-navigator > li > a:hover{
            color: #daf83e;
        }
    </style>
</head>

<body>
    <main>
        <h1>공지사항</h1>
        <div>
            <table class="notice_table">
                <tbody>
                <%for(Notice_Board_Dto NBdto : list){%>
                    <tr>
                    	<td><%=NBdto.getNotice_no() %></td>
                        <td>공지</td>
                        <td><a href="notice_detail.jsp?no=<%=NBdto.getNotice_no() %>"><%=NBdto.getNotice_title() %></a></td>    
                        <td align="right"><%=NBdto.getNotice_writer() %></td>
                        <td align="right" width="250"><%=NBdto.getNotice_date() %></td>
                    </tr>
                <%} %>
                </tbody>
                
            </table>
            
            <ul class="page-navigator">
            <!-- 네비게이터(navigator) -->    		
    	
    			<%if(startBlock > 1){ %><!--  -->
    				<li><a href="notice.jsp?pno=<%=startBlock -1 %>">[이전] </a></li>
    			<%} %>

    			<%for(int i = startBlock; i <= finishBlock; i++){ %>
    				<%if(i == pno){ %><!-- 현재페이지면 -->
    					<li><%=i %><li>
    				<%}else{ %>
    						<li><a href="notice.jsp?pno=<%=i %>"><%=i %></a></li>
    				<%} %>
    			<%} %>

    			<%if(finishBlock < pagecount){ %>
    					<li><a href="notice.jsp?pno=<%=finishBlock + 1%>">[다음]</a><li>
    			<%} %>
    		</ul>

	        <h5>pno = <%=pno %></h5>
			<h5>pagecount=<%=pagecount %>, pagesize=<%=pagesize %></h5>
			<h5>start=<%=start %>, finish=<%=finish %></h5>
			<h5>startBlock=<%=startBlock %>, finishBlock=<%=finishBlock %></h5>
        </div>
    </main>
</body>


<jsp:include page="/template/footer.jsp"></jsp:include>