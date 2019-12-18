<%@page import="beans.Users_Get_Dao"%>
<%@page import="beans.Users_Get_Dto"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 내정보 사이드메뉴를 꾸며주는 css -->
<style>
.float-wrap {
	
}

/* .float-wrap 이 끝나는 영역을 가상으로 생성하고 clear(가상선택자) */
.float-wrap::after {
	content: "";
	display: block;
	clear: both;
}

.float-wrap>.float-item {
	border: 1px dotted black;
	float: left;
}
</style>
<!-- css style 끝 -->

<%
	//회원 정보를 불러오는 코드
	//1. session에서 id에 들어있는 데이터를 꺼낸다
	//2. id를 주고dao를 이용하여 회원정보(Dto)를 꺼낸다
	//3. 원하는 위치에 출력한다. 	
	String id = (String) session.getAttribute("user_id");
	Users_Get_Dto UGdto = new Users_Get_Dto();
%>

<jsp:include page="/template/header.jsp"></jsp:include>

<body>

	<link rel="stylesheet" type="text/css"
		href="<%=request.getContextPath()%>/css/common.css">
	<div class="row">
		<h2><%=id %>님의 정보입니다</h2>

		<div class="float-wrap">
			<div class="float-item">
				<ul class="custom-list float-item"">
					<li>이용내역</li>
					<li>이용후기</li>
					<li>정보수정</li>
					<li>회원탈퇴</li>
					<li>포인트내역</li>
				</ul>
			</div>

			<div class="float-item">
				<div>
					<p>
						아이디<%=UGdto.getUser_id()%>
					</p>
				</div>
				<div>
					<p>
						이름<%=UGdto.getUser_name()%>
					</p>
				</div>
				<div>
					<p>권한 : ???</p>
				</div>
				<div>
					<p>
						휴대폰번호<%=UGdto.getUser_phone()%>
					</p>
				</div>
				<div>
					<p>
						포인트<%=UGdto.getUser_point()%>
					</p>
				</div>
				<div>
					<p>
						이메일<%=UGdto.getUser_email_id()%><%=UGdto.getUser_email_domain()%>
					</p>
				</div>
				<div>
					<p>
						관심사<%=UGdto.getUser_interest()%>
					</p>
				</div>
			</div>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/common.css">
<div class="row">
<div class="float-wrap">
       	<div class="float-item">
       		<ul class="custom-list float-item"">
		       <li>이용내역</li>
		       <li>이용후기</li>
		       <li><a href ="users_check.jsp?go=/info/users_change_info.jsp" >정보수정</a></li> 
		       <li>회원탈퇴</li>
		       <li>포인트내역</li>
		   </ul>

		</div>
	</div>
	<jsp:include page="/template/footer.jsp"></jsp:include>