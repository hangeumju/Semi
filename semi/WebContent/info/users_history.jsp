<%@page import="beans.Users_Get_Dto"%>
<%@page import="beans.Users_Info_Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Users_Info_Dao UIdao = new Users_Info_Dao();
	String user_id = (String)session.getAttribute("user_id");
	Users_Get_Dto UGdto = UIdao.users_get(user_id);
%>
<jsp:include page="/template/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">

<body>
	<div align="center">
	<h2><%=user_id %>님의 이용 내역입니다</h2>
	<!-- 테이블에 들어갈 내용 : 이용 날짜, 컨텐츠명, 가격, 호스트이름, 호스트 연락처, 장소 -->
		<table class="table">
			<thead>
				<th>이용날짜</th>
				<th>컨텐츠명</th>
				<th>가격</th>
				<th>호스트이름</th>
				<th>호스트연락처</th>
				<th>위치</th>				
			</thead>
			<tbody>
            <tr>
                <td>?</td>
                <td>?</td>
                <td>?</td>
                <td>?</td>
                <td>?</td>
                <td>?</td>                 
            </tr>
            <tr>
                <td>?</td>
                <td>?</td>
                <td>?</td>
                <td>?</td>
                <td>?</td>
                <td>?</td>                 
            </tr>
            <tr>
                <td>?</td>
                <td>?</td>
                <td>?</td>
                <td>?</td>
                <td>?</td>
                <td>?</td>                 
            </tr>
            <tr>
                <td>?</td>
                <td>?</td>
                <td>?</td>
                <td>?</td>
                <td>?</td>
                <td>?</td>                 
            </tr>
        </tbody>
		</table>

	</div>
</body>

<jsp:include page="/template/footer.jsp"></jsp:include>