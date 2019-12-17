<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반 회원가입</title>
</head>
<body>
	<div align="center">
		<h2>회원가입</h2>
		
		<form action="users_regist.do" method="post">
		
		<div>
			<input type="text" name=user_id required placeholder="아이디">
		</div>
		<div>
			<input type="password" name=user_pw required placeholder="비밀번호">
		</div>
		<div>
			<input type="text" name=user_name required placeholder="이름">
		</div>
		<div>
			<input type="text" name=user_phone required placeholder="핸드폰번호">
		</div>
		<div>
			<input type="text" name=user_email_id required placeholder="이메일">
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
			<input type="text" name=user_birth required placeholder="생년월일 - 없이 8자 입력">
		</div>
		<div>
			<input type="submit" value="가입하기">
		</div>		
	</div>
	
	</form>
	
</body>
</html>