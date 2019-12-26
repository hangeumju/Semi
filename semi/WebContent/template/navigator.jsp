<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 네비게이터(navigator) -->
<!-- 
	반드시 받아야 하는 데이터 : type, keyword, pno, count, navsize, pagesize
 -->
 <%
	String type = request.getParameter("type");
	String keyword = request.getParameter("keyword");
	String category = request.getParameter("category");
	boolean isSearch = type != null && keyword != null;
	int pno = Integer.parseInt(request.getParameter("pno"));
	int count = Integer.parseInt(request.getParameter("count"));
	int navsize = Integer.parseInt(request.getParameter("navsize"));
	int pagesize = Integer.parseInt(request.getParameter("pagesize"));
	int pagecount = (count + pagesize) / pagesize;
	int startBlock = (pno - 1) / navsize * navsize + 1;
	int finishBlock = startBlock + (navsize - 1);
	//만약 마지막 블록이 페이지 수보다 크다면 수정 처리
	if(finishBlock > pagecount){
		finishBlock = pagecount;
	}
	
// 	System.out.println(category);
// 	System.out.println(pno);
// 	System.out.println(count);
// 	System.out.println(navsize);
// 	System.out.println(pagesize);
// 	System.out.println(type);
// 	System.out.println(keyword);
%>
 
<h4>
	<!-- 이전 버튼 -->
	<%if(startBlock > 1){ %>
		<%if(isSearch){ %>
			<a href="<%=request.getRequestURI()%>?type=<%=type%>&keyword=<%=keyword%>&pno=<%=startBlock - 1%>">[이전]</a>  
		<%}else{ %>
			<a href="<%=request.getRequestURI()%>?pno=<%=startBlock - 1%>&category=<%=category %>">[이전]</a>
		<%} %>
	<%} %>
	
	<%for(int i=startBlock; i <= finishBlock; i++){ %>
		<%if(i == pno){ %>
			<%=i%>
		<%}else{ %>
			<%if(isSearch){ %>
				<a href="<%=request.getRequestURI()%>?type=<%=type%>&keyword=<%=keyword%>&pno=<%=i%>"><%=i%></a>
			<%}else{ %>
				<a href="<%=request.getRequestURI()%>?pno=<%=i%>&category=<%=category %>"><%=i%></a>
			<%} %>
		<%} %>
	<%} %>
	<!-- 다음 버튼 -->
	<%if(finishBlock < pagecount){ %>
		<%if(isSearch){ %>
			<a href="<%=request.getRequestURI()%>?type=<%=type%>&keyword=<%=keyword%>&pno=<%=finishBlock + 1%>">[다음]</a>
		<%}else{ %>
			<a href="<%=request.getRequestURI()%>?pno=<%=finishBlock + 1%>&category=<%=category %>">[다음]</a>
		<%} %>
	<%} %>
</h4>