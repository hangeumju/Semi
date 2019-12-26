<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.List"%>
<%@page import="beans.Host_Content_Dto"%>
<%@page import="beans.Host_Content_Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
// 컨텐츠 불러오기

	Host_Content_Dao HCdao = new Host_Content_Dao();
	String category = request.getParameter("category");
// 	String category = "액티비티";
	
	List<Host_Content_Dto> list ;
	
// 	페이지 크기
	int pagesize = 12;
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
	
	String type = request.getParameter("type");
	String keyword = request.getParameter("keyword");
	
	boolean isSearch =(type != null && keyword != null);

	
	if(isSearch){
		list = HCdao.search(type, keyword, start, finish); 
	}
	else{
		list = HCdao.getList(category, start, finish);
	}
	
	
	int count = HCdao.getCount(type, keyword, category);
	
// 	System.out.println(count);
// 	System.out.println(category);
// 	System.out.println(pagesize);
// 	System.out.println(start);
// 	System.out.println(finish);
	
	%>

	<!-- 갤러리 4단 나누기 -->

	
    <style>
        * {
            box-sizing: border-box;
        }
        
        .gallary{
            
        }
        .gallary::after{
            content:"";
            display: block;
            clear: both;
        }
        
        .gallary > .gallary-item{
            float:left;
            width:25% !important;
            padding:10px;
        }
        
        .gallary > .gallary-item > .gallary-image > img{
            width:100%;
            border-radius: 50%;
            opacity: 0.5;
        }
        
        .gallary > .gallary-item:hover{
            
        }
        
        .gallary > .gallary-item:hover > .gallary-image > img{
            opacity: 1;
        }
        
        .gallary > .gallary-item> .gallary-text > h4{
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;            
        }
        
        .gallary > .gallary-item> .gallary-text > p {
            word-break:break-all;
        }
        

        
        
        /* 테스트용 스타일 */
        .gallary, .gallary-text{
            border:1px dotted black;
        }
        .gallary-item{
            border:1px dotted red;
        }
        .gallary-image{
            border:1px dotted blue;
        }

    </style>
	<!-- 갤러리 4단 나누기 종료-->



<jsp:include page="/template/header.jsp"></jsp:include>

<article class="w-60">

<div id="searchForm">
        <form action="host_content_list.jsp" method="get">
            <select name="type">
                <option value="host_content_name">컨텐츠명</option>
                <option value="host_id">호스트아이디</option>
            </select>
            <input type="search" name="keyword" placeholder="검색어" required>&nbsp;
            <input type="submit" value="검색">
        </form>    
    </div>  

  <div class="gallary">

 	<% for (Host_Content_Dto dto : list) {%> 
        <div class="gallary-item">
            <div class="gallary-image">
       			<a href="<%=request.getContextPath()%>/board/host_content_detail_view.jsp?host_content_no=<%=dto.getHost_content_no()%>">
                <img src="http://placeimg.com/480/480/animals">
                </a>                
            </div>            
            <div class="gallary-text">
                <h4><%=dto.getHost_content_name() %></h4>
                <h4>
                    <%=dto.getHost_content_cost() %>
                </h4>
                <h4>
                	<%=dto.getHost_content_view_count() %>
                </h4>
                <h3>
                	<%=dto.getHost_content_category() %>
                </h3>
                
            </div>
        </div>   
	<% } %>  
	
     </div>  
     <div class="row">
		<!-- 네비게이터(navigator) -->
		<jsp:include page="/template/navigator.jsp">
			<jsp:param name="pno" value="<%=pno%>"/>
			<jsp:param name="count" value="<%=count%>"/>
			<jsp:param name="navsize" value="<%=navsize%>"/>
			<jsp:param name="pagesize" value="<%=pagesize%>"/>
		</jsp:include>
			
	</div>             

</article> 
    
<jsp:include page="/template/footer.jsp"></jsp:include>  