<%@page import="beans.Host_Content_Dto"%>
<%@page import="beans.Host_Content_Dao"%>
<%@page import="beans.Users_Get_Dto"%>
<%@page import="beans.Users_Info_Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	//유저 정보를 불러오는 코드 
	Users_Info_Dao UIdao = new Users_Info_Dao();
	String user_id = (String) session.getAttribute("user_id");
	Users_Get_Dto UGdto = UIdao.users_get(user_id);
%>

<jsp:include page="/template/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/common.css">
<body>
	<div class="float-wrap">
		<div class="float-item">
			<ul class="custom-list float-item"">
				<li><a
					href="<%=request.getContextPath()%>/info/users_history.jsp">이용내역</a></li>
				<li><a
					href="<%=request.getContextPath()%>/info/users_review.jsp">이용후기</a></li>
				<li><a href="users_check.jsp?go=/info/users_change_info.jsp">정보수정</a></li>
				<li><a href="users_check.jsp?go=/info/users_exit.do">회원탈퇴</a></li>
				<li><a
					href="<%=request.getContextPath()%>/info/users_point.jsp">포인트내역</a></li>
			</ul>

			<!-- 들어갈 내용 : 컨텐츠 넘버/ 유저 이름(작성자) / 작성일 / 리뷰내용/ 컨텐츠 넘버   -->


			<div align="row">
				<h2><%=UGdto.getUser_id()%>님의 프립 후기입니다
				</h2>


				<!-- 작성자 이름과 작성날짜가 들어갈 자리  -->
				<div class="float-item">
					<div font-size="16"><%=UGdto.getUser_name()%>: 작성자자리
					</div>
					<div>
						<!-- 작성일이 들어갈 자리 / 지금은 본인(소희)가 날짜를 수기 작성 / 
			 추후에 리뷰 테이블 만들어지면 변수로 넣을 예정 , -->
						"2019-12-20 19:14" "작성"
					</div>

					<br>

					<!-- 컨텐츠 내용 (리뷰내용) / 지금은 본인(소희)가 내용을 수기 작성 / 
		추후에 리뷰 테이블만들어지면 변수로 넣을 예정 -->
					<div class="float-item" font-size="14">작성내용:좋아요좋아요</div>

					<br>
					<!--  컨텐츠 넘버 또는 넘버명 자리 / 지금은 본인(소희)가 내용을 수기 작성 / 
		추후에 리뷰 테이블만들어지면 변수로 넣을 예정 -->
					<div class="float-item" font-size="12">컨텐츠 넘버</div>


				</div>
			</div>
		</div>
	</div>

</body>

<jsp:include page="/template/footer.jsp"></jsp:include>