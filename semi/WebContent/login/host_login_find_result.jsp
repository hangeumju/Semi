<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--계정 찾기 결과 페이지
host_id 파라미터를 받아서 결과를 화면에 표시--%>

<% String host_id = request.getParameter("host_id");%>

<jsp:include page ="/template/header.jsp"></jsp:include>
<% if(host_id!=null){%>
<!-- 검색 성공시 -->
<h2>회원님의 ID는 <%=host_id%> 입니다</h2>
<h3><a href = "host_login.jsp">Login</a></h3>


<!-- 검색 실패시 -->
<%}else{%>
<h2>해당하는 정보의 회원이 존재하지 않습니다.</h2>
<h3><a href = "host_login_find.jsp">다시 입력하기</a></h3>
<%} %>
<jsp:include page ="/template/footer.jsp"></jsp:include>