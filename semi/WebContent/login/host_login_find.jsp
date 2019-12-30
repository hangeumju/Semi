<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/host_main.css">
<jsp:include page="/template/host_header.jsp"></jsp:include>
<form action ="host_login_find.do" method="post">
<article class="w-50">
<div class="row">
<h2>Host 계정을 찾으시나요 ?</h2>
<!-- 이름 입력란 -->
<div class="row-left">
	<label for="host_name-input">이름 :</label>
	<input id="host_name-input" class="block-item input item" type="text" name="host_name" required>
</div>
<!-- 전화번호 입력란 -->
<div class="row-left">
	<label for="host_phone-input">전화번호: </label>
	<input id="host_phone-input" class="block-item input item" type="tel" name="host_phone" required>
</div>
<!-- 입력 및 찾기 버튼 -->
<div class="row-left">
	<input class="btn" type="submit" value="계정 찾기">
	<input class="btn" type="submit" value="지우기">
</div>

</div>
</article>
</form>
<jsp:include page="/template/footer.jsp"></jsp:include>
