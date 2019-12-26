<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 네비게이터(navigator) -->
<!-- 
   반드시 받아야 하는 데이터 : type, keyword, pno, count, navsize, pagesize
 -->
 <%
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
%>
 
<h4>
   <!-- 이전 버튼 -->
   <%if(startBlock > 1){ %>
         <a href="<%=request.getRequestURI()%>?pno=<%=startBlock - 1%>">[이전]</a>
   <%} %>
   
   <%for(int i=startBlock; i <= finishBlock; i++){ %>
      <%if(i == pno){ %>
         <%=i%>
      <%}else{ %>
            <a href="<%=request.getRequestURI()%>?pno=<%=i%>"><%=i%></a>
      <%} %>
   <%} %>
   <!-- 다음 버튼 -->
   <%if(finishBlock < pagecount){ %>
         <a href="<%=request.getRequestURI()%>?pno=<%=finishBlock + 1%>">[다음]</a>
   <%} %>
</h4>