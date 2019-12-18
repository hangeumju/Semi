<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>






<jsp:include page="/template/header.jsp"></jsp:include>  



	<form action="host_regist.do" method="post">
	<article class="w-40">
		<div class="row"> 		
			<h2> 호스트 회원 가입</h2>
		</div>
		<div class="row-left">
			<input class="block-item input-item" type="text" name= "host_id" placeholder= "아이디" required>	
		</div>
		<div class="row-left">
			<input class="block-item input-item" type="password" name= "host_pw" placeholder= "비밀번호" required>	
		</div>
		<div class="row-left">
			<input class="block-item input-item" type="text" name= "host_name" placeholder= "이름" required>
		</div>
		<div class="row-left">
			<input class="block-item input-item" type="text" name= "host_phone" placeholder= "휴대전화" required>
		</div>
		<span class="row-left">
			<input class="input-item" type="text" name= "host_email_id" placeholder= "이메일아이디" required>
		</span>
		<span class="row-left">
			<select class="input-item" name="host_email_domain">
				<option value="" selected disabled hidden >이메일선택</option>
				<option>@naver.com</option>
				<option>@nate.com</option>
				<option>@gmail.com</option>
				<option>@daum.net</option>
				<option>@hanmail.net</option>
			</select>
		</span>
		<p class="row-left">			
			<select class="block-item input-item" name="host_Interest">
				<option value="" selected disabled hidden >관심분야</option>
				<option>액티비티</option>
				<option>배움</option>
				<option>건강/뷰티</option>
				<option>모임</option>
				<option>여행</option>
			</select>
		</p>
		<div class="row-left">
			<p>
				<input class="input-item" type="text" name="host_post"placeholder="우편번호">
		    	<input class="input-item" type="button" onclick="postcode()" value="우편번호 찾기">
		    <p>	
		    	<input class="block-item input-item" type="text" name="host_basic_addr" placeholder="기본주소">
		    	<input class="block-item input-item" type="text" name="host_extra_addr" placeholder="상세주소">
		</div>
		<div class="row-left">
				<select class="block-item input-item" name="host_bank_name">
				<option value="" selected disabled hidden >은행선택</option>
				<option>기업은행</option>
				<option>국민은행</option>
				<option>우리은행</option>
				<option>신한은행</option>
				<option>KEB하나은행</option>
				<option>농협은행</option>
				<option>SC제일은행</option>
				<option>한국씨티은행</option>
				<option>우체국</option>
				<option>경남은행</option>
				<option>광주은행</option>
				<option>대구은행</option>
				<option>산업은행</option>
				<option>새마을금고</option>
				<option>수협</option>
				<option>신협</option>
				<option>전북은행</option>
				<option>제주은행</option>
				<option>카카오뱅크</option>
				<option>케이뱅크</option>
			</select>
		</div>
		<div class="row-left">
			<input class="block-item input-item" type="text" name= "host_bank_account" placeholder=  "계좌번호">
		</div>
		<div class="row-right">
			<input class="block-item input-item" type="submit" value= "가입하기" >	
		</div>	
	</article>	
	</form>	


<jsp:include page="/template/footer.jsp"></jsp:include>  
