<%@page import="beans.Host_Info_Dao"%>
<%@page import="beans.Host_Info_Dto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 	<%
 	String host_id = (String)session.getAttribute("host_id"); 
 	Host_Info_Dao HIdao = new Host_Info_Dao();
 	//기존 정보 불러오기 !
 	Host_Info_Dto HIdto = HIdao.get(host_id);
    %>
    
   <style>
  table {
    width: 100%;
    border-top: 1px solid #444444;
    border-collapse: collapse;
    font-family : NanumSquareR;
    font-size : 2rem;
  }
  th {
    border-bottom: 1px solid #444444;
    padding: 10px;
    font-family : NanumSquareR;
     font-size : 2rem;
  }
  td {
    border-bottom: 1px solid #444444;
    padding: 10px;
    font-family : NanumSquareR;
     font-size : 1rem;
  }
</style>

<jsp:include page="/template/header.jsp"></jsp:include>
<div align="center">
<h2><font size ="8" style="font-family:NanumSquareR"><%=HIdto.getHost_id() %>님의 정보</font></h2>
<br>
<!-- 회원정보 출력 -->
	<table border="1" width="700" >
	<!-- 히든정보 -->
			<tr>
				<th>아이디</th>
				<td><%=HIdto.getHost_id()%></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><%=HIdto.getHost_name()%></td>
			</tr>
			<tr>
				<th>휴대전화</th>
				<td><%=HIdto.getHost_phone()%></td>
			</tr>
			<tr>
				<th>가입일</th>
				<td><%=HIdto.getHost_joindatewithFormat()%></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><%=HIdto.getHost_totalmail()%></td>
			</tr>
			<tr>
				<th>최종로그인시간</th>
				<td><%=HIdto.getHost_lastloginwithFormat()%></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><%=HIdto.getHost_address()%></td>
			</tr>
			<tr>
				<th>은행</th>
				<td><%=HIdto.getHost_bankaccount()%></td>
			</tr>
	</table>
	<br><br>
<h4><a href="host_check.jsp?go=/info/host_change_pw.jsp">
<font size ="5" style="font-family:NanumSquareR">비밀번호 변경</font></a></h4>
<h4><a href="host_check.jsp?go=/info/host_change_info.jsp">
<font size ="5" style="font-family:NanumSquareR">회원정보 수정</font></a></h4>
<h4><a href="host_check.jsp?go=/info/host_exit.jsp">
<font size ="5" style="font-family:NanumSquareR">회원 탈퇴</font></a></h4>
</div>
<jsp:include page="/template/footer.jsp"></jsp:include>