<%@page import="beans.Users_Get_Dto"%>
<%@page import="beans.Users_Change_Info_Dto"%>
<%@page import="beans.Users_Info_Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   
<%
   //유저 정보 수정 페이지
   //사용자의 아이디를 이용하여 정보를 불러와서 출력
   String user_id = (String)session.getAttribute("user_id");
   Users_Info_Dao UIdao = new Users_Info_Dao();
   Users_Change_Info_Dto UCIdto = new Users_Change_Info_Dto();
   Users_Get_Dto UGdto = UIdao.users_get(user_id);   
   
%>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
<jsp:include page="/template/header.jsp"></jsp:include>
<form action ="users_change_info.do" method="post">
<article class = "w-40">
<div class="row">
<h2><%=UGdto.getUser_id() %>님의 정보를 수정하시나요?</h2>
<!-- 전화번호 수정 -->
      <div class="row-left">
         <input class="block-item input-item" type="text" name= "user_phone" placeholder= "휴대전화" required>
      </div>
      <!-- 이메일 계정 수정 -->
      <span class="row-left">
         <input class="input-item" type="text" name= "user_email_id" placeholder= "이메일아이디" required>
      </span>
      <span class="row-left">
         <select class="input-item" name="user_email_domain">
            <option value="" selected disabled hidden >이메일선택</option>
            <option>@naver.com</option>
            <option>@nate.com</option>
            <option>@gmail.com</option>
            <option>@daum.net</option>
            <option>@hanmail.net</option>
         </select>
      </span>
      <!-- 관심분야 수정 -->
      <p class="row-left">         
         <select class="block-item input-item" name="user_Interest">
            <option value="" selected disabled hidden >관심분야</option>
            <option>액티비티</option>
            <option>배움</option>
            <option>건강/뷰티</option>
            <option>모임</option>
            <option>여행</option>
         </select>
         
      <!-- 정보 수정 및 지우기 -->
      <div class="row-right">
         <input class="block-item input-item" type="reset" value="지우기">
         <input class="block-item input-item" type="submit" value= "수정하기" >
         <h4><a href="users_spare_pw.do?user_id=<%=user_id%>">비밀번호 변경</a></h4>
      </div>   

</div>
</article>
</form>

<jsp:include page="/template/footer.jsp"></jsp:include>