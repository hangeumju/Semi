<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>

<style>
       *{
           box-sizing: border-box;
       }
       
       #container, #footer, #header {
        margin: 0 auto;
        width: 400px;  
    }       
       .join_content{
           width: 100%; 
/*            border: 1px solid black; */
       }
       
        .join_title {
        margin: 19px 0 8px;
        font-size: 14px;
        font-weight: 700;
/*         border: 1px solid black; */
    }
       .join_box *{
           border: solid 1px darkgray;
           padding: 10px;
           width: 100%; 
       }
       .email_box *{
           height: 32px;          
       }
       #email_id{
           width: 220px;
           border: solid 1px darkgray;
       }
       .join_btn{
            font-size:1.5rem;
            padding:0.5rem;
            background-color: #F98967;
            color:white;
            border:none;
            border-radius: 10px;
        }       
</style>

<section>
<form action="users_regist.do" method="post">

    <div id="container">
       <div class="join_content">
           <div class="row_group">
              <div class="join_content" style="text-align: center">
                  <h2>회원가입</h2>
              </div>
               <div class="join_row">
                   <h3 class="join_title">
                       <div>아이디</div>
                   </h3>
                   <span class="join_box">
                       <input id="id" class="block-item input-item" type="text" name="user_id" required>			
                   </span>
               </div> 
               <div class="join_row">
                   <h3 class="join_title">
                       <div>비밀번호</div>
                   </h3>
                   <span class="join_box">
                       <input id="pw" class="block-item input-item" type="password" name="user_pw" required>			
                   </span>
               </div>
               <div class="join_row">
                   <h3 class="join_title">
                       <div>이름</div>
                   </h3>
                   <span class="join_box">
                       <input id="name" class="block-item input-item" type="text" name="user_name" required>			
                   </span>
               </div> 
               <div class="join_row">
                   <h3 class="join_title">
                       <div>휴대전화</div>
                   </h3>
                   <span class="join_box">
                       <input id="phone" class="block-item input-item" type="text" name="user_phone" required>			
                   </span>
               </div> 
               <div class="join_row">
                   <h3 class="join_title">
                       <div>이메일</div>
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
                       <div>관심사</div>
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
                       <div>생년월일</div>
                   </h3>
                   <span class="join_box">
                       <input id="birth" class="block-item input-item" type="text" name="user_birth" required placeholder="생년월일 8자리를 입력하세요">			
                   </span>
               </div>
              
                  <br>
                   <span class="join_box">
                       <input class="join_btn" type="submit" value="가입하기">			
                   </span>
               </div> 
               
           </div>
       </div>        
	</form>
</section>
<jsp:include page="/template/footer.jsp"></jsp:include>