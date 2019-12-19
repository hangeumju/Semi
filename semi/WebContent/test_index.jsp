<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>

<div class="row">
	<a href="<%=request.getContextPath()%>/login/users_login.jsp">로그인</a>
	<a href="<%=request.getContextPath()%>/join/users_regist.jsp">회원가입</a>
	<a href="<%=request.getContextPath()%>/login/users_logout.do">로그아웃</a>
	<a href="<%=request.getContextPath()%>/info/users_info.jsp">내정보</a>

<!-- 홈페이지 세션 상태값 출력 -->
            <h5>session user_id = <%=session.getId()%></h5>
            <h5> id =<%=session.getAttribute("user_id")%></h5>
            
            <%
            String id = (String)session.getAttribute("user_id");
            %>
            <h5>id = <%=id%></h5>
            <h5>로그인 상태 = <%=id !=null%></h5>
</div>

<jsp:include page="/template/footer.jsp"></jsp:include>