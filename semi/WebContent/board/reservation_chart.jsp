<%@page import="beans.Reservation_Dto"%>
<%@page import="beans.Reservation_Dao"%>
<%@page import="beans.Users_Content_History_Dto"%>
<%@page import="java.util.List"%>
<%@page import="beans.Users_Content_History_Dao"%>
<%@page import="beans.Users_Get_Dto"%>
<%@page import="beans.Users_Info_Dao"%>
<%@page import="beans.Host_Info_Dto"%>
<%@page import="beans.Host_Info_Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    Host_Info_Dao HIdao = new  Host_Info_Dao();
    String host_id = (String)session.getAttribute("host_id");
    Host_Info_Dto HIdto = HIdao.get(host_id);
    
// 	페이지 크기
	int pagesize = 10;
// 	네비게이터 크기
	int navsize = 10;
	
// 	페이징 추가
	int pno;
	try{
		pno = Integer.parseInt(request.getParameter("pno"));
		if(pno <= 0) throw new Exception();
	}
	catch(Exception e){
		pno = 1;
	}
	
	int finish = pno * pagesize;
	int start = finish - (pagesize - 1);

	Reservation_Dao Rdao = new Reservation_Dao();
	
	String type = request.getParameter("type");
	String keyword = request.getParameter("keyword");
	
	boolean isSearch = type != null && keyword != null;
	
	List<Reservation_Dto> list;
	
	if(isSearch){
		list = Rdao.search(type, keyword, start, finish); 
	}
	else{
		list = Rdao.reservation_list(start, finish);
	}
	
	int count = Rdao.getCount(type, keyword);
	%>
    
<jsp:include page="/template/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
<html>
<head>
    
    <style type="text/css">
        #wrap {
            width: 800px;
            margin: 0 auto 0 auto;
        }
        #top{
            text-align :right;
        }
        #board, #pageForm, #searchForm{
            text-align :center;
        }
        
        #boardList{
            text-align :center;
        }
    </style>
    
    <script type="text/javascript">
        function writeForm(){
            location.href="";
        }
    </script>
    
</head>
<body>    
 
<div id="wrap">
    <br>
    <div id="top"> 
    </div>
    <br>
       <br>
    <div id="searchForm">
        <form action="reservation_chart.jsp" method="get">
            <select name="type">
                <option value="history_no">예약번호</option>
                <option value="user_name">예약자</option>
                <option value="host_content_name">컨텐츠명</option>
            </select>
            
            <input type="search" name="keyword" placeholder="검색어" required>&nbsp;
            <input type="submit" value="검색">
        </form>    
    </div>  
    <div id="board">
        <table id="#boardList" width="800" border="3" bordercolor="lightgray">
            <h3>(<%=host_id %>) 님의 예약자 관리</h3>
            <tr heigh="30">
                <td>예약번호</td>
                <td>컨텐츠명</td>
                <td>예약자</td>
                <td>휴대전화 번호</td>
                <td>예약티켓수량</td>
                <td>예약 날짜</td>
            </tr>
            <tbody>    
            <%for(Reservation_Dto Rdto : list){%>
            <tr>
               <td><%=Rdto.getHistory_no() %></td>
               <td><%=Rdto.getHost_content_name() %></td>
                <td><%=Rdto.getUser_name()%></td>
                <td><%=Rdto.getUser_phone()%></td>
                <td><%=Rdto.getUser_qty() %></td>
                <td><%=Rdto.getUser_class_date() %></td>
            </tr>
                <%} %>
                
                
           </tbody>
        </table>
    </div>
    <br>
	<div class="row">
		<!-- 네비게이터(navigator) -->
		<jsp:include page="/template/navigator.jsp">
			<jsp:param name="pno" value="<%=pno%>"/>
			<jsp:param name="count" value="<%=count%>"/>
			<jsp:param name="navsize" value="<%=navsize%>"/>
			<jsp:param name="pagesize" value="<%=pagesize%>"/>
		</jsp:include>
	</div>
    </div>
</body>
</html>
<jsp:include page="/template/footer.jsp"></jsp:include>
