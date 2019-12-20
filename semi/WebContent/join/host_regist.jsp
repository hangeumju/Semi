<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>






<jsp:include page="/template/header.jsp"></jsp:include>  

	<!-- 호스트 가입 우편번호 API -->

	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script type="text/javascript">
		function postcode() {
		    new daum.Postcode({
		        oncomplete: function(data) {
		            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
		
		            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
		            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
		            var addr = ''; // 주소 변수
		            var extraAddr = ''; // 참고항목 변수
		
		            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
		            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
		                addr = data.roadAddress;
		            } else { // 사용자가 지번 주소를 선택했을 경우(J)
		                addr = data.jibunAddress;
		            }
		
		            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
		            if(data.userSelectedType === 'R'){
		                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
		                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
		                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
		                    extraAddr += data.bname;
		                }
		                // 건물명이 있고, 공동주택일 경우 추가한다.
		                if(data.buildingName !== '' && data.apartment === 'Y'){
		                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
		                }
		                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
		                if(extraAddr !== ''){
		                    extraAddr = ' (' + extraAddr + ')';
		                }
		                // 조합된 참고항목을 해당 필드에 넣는다.
		                // document.getElementById("sample6_extraAddress").value = extraAddr;
		                // 아래와 같이 변경이 가능
		                // extraAddress 창을 비활성화 했기 때문에 필요 없음
		                // document.querySelector("input[name=extra_addr]").value =  extraAddr;
		            
		            } else {
		                // document.querySelector("input[name=extra_addr]").value = '';
		            }
		
		            // 우편번호와 주소 정보를 해당 필드에 넣는다.
		            // document.getElementById('sample6_postcode').value = data.zonecode;
		            document.querySelector("input[name=host_post]").value = data.zonecode;
		            // document.getElementById("sample6_address").value = addr;
		            document.querySelector("input[name=host_basic_addr]").value = addr;
		            // 커서를 상세주소 필드로 이동한다.
		            // document.getElementById("sample6_detailAddress").focus();
		            document.querySelector("input[name=host_extra_addr]").focus();
		        }
		    }).open();
		}
	</script>
	<!-- 우편번호 API 종료 -->	



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
