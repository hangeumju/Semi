<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>
<body>
<form action="users_regist.do" method="post">
<!-- css 디자인 설정함 -->
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/common.css">

	<body>
    <div id="container">
       <div class="join_content">
           <div class="row_group">
              <div class="join_content" style="text-align: center">
                  <h2>회원가입</h2>
              </div>
               <div class="join_row">
                   <h3 class="join_title">
                       <label for="id">아이디</label>
                   </h3>
                   <span class="join_box">
                       <input id="id" class="block-item input-item" type="text" name="user_id" required>			
                   </span>
               </div> 
               <div class="join_row">
                   <h3 class="join_title">
                       <label for="pw">비밀번호</label>
                   </h3>
                   <span class="join_box">
                       <input id="pw" class="block-item input-item" type="password" name="user_pw" required>			
                   </span>
               </div>
               <div class="join_row">
                   <h3 class="join_title">
                       <label for="name">이름</label>
                   </h3>
                   <span class="join_box">
                       <input id="name" class="block-item input-item" type="text" name="user_name" required>			
                   </span>
               </div> 
               <div class="join_row">
                   <h3 class="join_title">
                       <label for="phone">휴대전화</label>
                   </h3>
                   <span class="join_box">
                       <input id="phone" class="block-item input-item" type="text" name="user_phone" required>			
                   </span>
               </div> 
               <div class="join_row">
                   <h3 class="join_title">
                       <label for="email_id">이메일</label>
                   </h3>
                   <span class="email_box">
                       <input id="email_id" type="text" name=user_email_id required>
                       <select name="user_email_domain">
                          <option value="">도메인을 선택하세요</option>
                          <option>@naver.com</option>
                          <option>@nate.com</option>
                          <option>@gmail.com</option>
                          <option>@daum.net</option>
                          <option>@hanmail.net</option>
                       </select>			
                   </span>
               </div>  
               <div class="join_row">
                   <h3 class="join_title">
                       <label for="interest">관심사</label>
                   </h3>
                   <span class="join_box">
                      <select name="user_interest">
                        <option value="">관심사를 선택하세요</option>
                        <option>액티비티</option>
                        <option>배움</option>
                        <option>건강/뷰티</option>
                        <option>모임</option>
                        <option>여행</option>
                      </select>					
                   </span>
               </div> 
               <div class="join_row">
                   <h3 class="join_title">
                       <label for="birth">생년월일</label>
                   </h3>
                   <span class="join_box">
                       <input id="birth" class="block-item input-item" type="text" name="user_birth" required placeholder="생년월일 8자리를 입력하세요">			
                   </span>
               </div>
              
                  <br>
                   <span class="join_box">
                       <input class="btn" type="submit" value="가입하기">			
                   </span>
               </div> 
               
           </div>
       </div>        
	</form>
<jsp:include page="/template/footer.jsp"></jsp:include>