<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%--유저 아이디  찾기 페이지 --%>    
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">   

<jsp:include page="/template/header.jsp"></jsp:include>

<form action="users_find_id.do" method="post">

<article class="w-50">
<div class="row">
<h2>아이디를 잊으셨나요?</h2>

<!-- 정보입력 : 이름, 전화번호 -->
<div class="row-left">
	<label for="user_name-input">이름:</label>
	<input id="user_name-input" class="block-item input item"  type="text" name="user_name" required>
</div>
<!-- 전화번호 입력란 -->
<div class="row-left">
	<label for="user_phone-input">전화번호: </label>
	<input id="user_phone-input" class="block-item input item" type="tel" name="user_phone" required>
</div>
<!-- 입력 및 찾기 버튼 -->
<div class="row-left">
	<input class="btn" type="submit" value="확인">
</div>
<!-- 각종링크( 회원가입 . 비번찾기) --> 
<div class="row-left">
<a href="/semi/join/users_regist.jsp">회원가입</a><br>

</div>

</div>
</article>	
</form>
<jsp:include page="/template/footer.jsp"></jsp:include>


		
		
	




