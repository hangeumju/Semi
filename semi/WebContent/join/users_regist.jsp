<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>
<body>
<form action="users_regist.do" method="post">
<!-- css 디자인 설정함 -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/common.css">

	 <article class="w-50">
		<div class="row">
			<h2>회원가입</h2>
		</div>
		<div class="row-left">
  			<label for="id-input">아이디:</label>
  			<input id="id-input" class="block-item input-item" type="text" name="user_id"  required>			
		</div>
		<div class="row-left">
	  		<label for="pw-input">비밀번호:</label>
	  		<input id="pw-input" class="block-item input-item" type="password" name="user_pw"  required>
		</div>
		<div class="row-left">
	  		<label for="name-input">이름:</label>
	  		<input id="name-input" class="block-item input-item" type="text" name="user_name"  required>
		</div>
		<div class="row-left">
	  		<label for="phone-input">전화번호:</label>
	  		<input id="phone-input"" class="block-item input-item" type="tel" name="user_phone"  required>
		</div>
		
		<div class="row-left">
			<label for="email_id-input">이메일:</label><br>
			<input id="email_id" type="text" name=user_email_id required>
			<select name="user_email_domain">
				<option value="">도메인을 선택하세요</option>
				<option>@naver.com</option>
				<option>@nate.com</option>
				<option>@gmail.com</option>
				<option>@daum.net</option>
				<option>@hanmail.net</option>
			</select>			
		</div>
		
		<div>
			<label for="user_interest">관심사:</label>
			<select name="user_interest">
				<option value="">관심사를 선택하세요</option>
				<option>액티비티</option>
				<option>배움</option>
				<option>건강/뷰티</option>
				<option>모임</option>
				<option>여행</option>
			</select>			
		</div>
		
		<div>
			<label for="user_birth">생년월일:</label>
			<input  id="birth-input"" class="block-item input-item type="text" name=user_birth required placeholder="생년월일 8자리를 입력하세요">
		</div>
		<div class="row">
			<input class="btn" type="submit" value="가입하기">
		</div>		
	</div>
	
	</article>
	</form>
<jsp:include page="/template/footer.jsp"></jsp:include>