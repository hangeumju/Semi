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
	
	%>
<style>
	.join_btn {
		font-size: 13px;
		padding: 4px;
		background-color: #F98967;
		color: white;
		border: none;
		border-radius: 5px;
		padding: 6px;
	}
</style>	

<jsp:include page="/template/header.jsp"></jsp:include>
<hr color="#F98967">
<section>
<article>

<div id="searchForm">
        <form action="host_content_list.jsp" method="get">
            <select name="type">
                <option value="host_content_name">컨텐츠명</option>
                <option value="host_id">호스트아이디</option>
            </select>
            <input type="search" name="keyword" required>&nbsp;
            <input class="join_btn" type="submit" value="검색">
        </form>    
    </div>  
     
     <div class="gallary">
         <%for(Host_Content_Dto dto : list){ %>
         <div class="gallary-item">
            <a href="<%=request.getContextPath()%>/board/host_content_detail_view.jsp?host_content_no=<%=dto.getHost_content_no()%>">
               <img style="height: 138px;" src="<%=request.getContextPath()%>/board/download1.do?Host_content_no=<%=dto.getHost_content_no()%>"></a>
            <!-- 카테고리 -->
            <div class="gallary-text-category">
               <span><%=dto.getHost_content_category() %></span>
            </div>
            <!-- 컨텐츠 제목 -->
            <div class="gallary-text-content">
            <%System.out.println(dto.getHost_content_name()); %>
            <%System.out.println(dto.getHost_content_ticket()); %>
               <p><%=dto.getHost_content_name() %></p>
                  <%if(dto.getHost_content_ticket() > 0){ %>
                     <span>(예약 가능)</span>
                     <%System.out.println(dto.getHost_content_ticket()); %>
                  <%} else{ %>
                     <span>(마감)</span>
                  <%} %>
            </div>
            <!-- 컨텐츠 가격 -->
            <div class="gallary-text-cost">
               <span><%=dto.getHost_content_cost() %>원</span>
            </div>
         </div>
         <%} %>
      </div> 
      
     <div class="row">
		<!-- 네비게이터(navigator) -->
		<jsp:include page="/template/list_navigator.jsp">
			<jsp:param name="pno" value="<%=pno%>"/>
			<jsp:param name="count" value="<%=count%>"/>
			<jsp:param name="navsize" value="<%=navsize%>"/>
			<jsp:param name="pagesize" value="<%=pagesize%>"/>
		</jsp:include>
			
	</div>             

</article> 
</section>
<hr color="#F98967">   
<jsp:include page="/template/footer.jsp"></jsp:include> 