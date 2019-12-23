<%@page import="beans.Users_Info_Dao"%>
<%@page import="beans.Users_Review_Dto"%>

<%@page import="beans.Users_Get_Dto"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	//유저 정보를 불러오는 코드 
	Users_Info_Dao UIdao = new Users_Info_Dao();
 	String user_id = (String) session.getAttribute("user_id"); 
	Users_Get_Dto UGdto = UIdao.users_get(user_id); 
	
	//유저 리뷰테이블 정보를 불러오는 코드 (작성자=유저아이디 기준으로 작성일,컨텐츠넘버,리뷰넘버,리뷰내용을 불러온다)
	String review_writer = "dladnwls";
	Users_Review_Dto URdto = UIdao.users_review_get(review_writer);
%>

<jsp:include page="/template/header.jsp"></jsp:include>

<hr>

		<div class="row">
		<h2><%=URdto.getReview_writer() %>님의 리뷰게시판입니다</h2>
		</div>
<!-- 				후기 내용이 들어갈 자리 -->
<!-- 				들어갈 내용 : 컨텐츠 넘버/ 유저 이름(작성자) / 작성일 / 리뷰내용/ 컨텐츠 넘버   -->
		

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
<div class="row">
<%-- <div class="float-item" >작성넘버:<%=URdto.getReview_no() %></div> --%>
<%-- <div class="float-item">컨텐츠넘버:<%=URdto.getContent_original_no() %></div> --%>
<div class="float-item">컨텐츠이름:<%=URdto.getReview_title() %></div>
<div class="float-item">컨텐츠내용:<%=URdto.getReview_content() %></div>
<div class="float-item">작성자:<%=URdto.getReview_writer() %></div>
<div class="float-item">작성일:<%=URdto.getReview_date() %></div>
</div>
			</div>
			</div>

<!-- 추후에 네비게이터 넣을 자리 -->
<jsp:include page="/template/footer.jsp"></jsp:include>