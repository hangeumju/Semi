<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/CSS/common.css">
<jsp:include page="/template/header.jsp"></jsp:include>

<div align="center">

	<h2>임시 비밀번호 발급이 완료되었습니다.</h2>
	<h3>비밀번호 = <%=request.getParameter("host_pw")%></h3>

</div>
<jsp:include page="/template/footer.jsp"></jsp:include>