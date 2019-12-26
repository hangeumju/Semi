
<%@page import="beans.Host_Info_Dao"%>
<%@page import="beans.Host_Info_Dto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String host_id = (String)session.getAttribute("host_id");
    Host_Info_Dao HIdao = new Host_Info_Dao();
    Host_Info_Dto HIdto = HIdao.get(host_id);
    %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/CSS/common.css">
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
        }       
</style>

<jsp:include page="/template/host_header.jsp"></jsp:include>
<article>
<form action="host_change_pw.do" method="post">

	<!-- 비밀번호 입력 -->
<div id="container">
       <div class="join_content">
              <div class="join_content" style="text-align: center">
		<h3> 호스트 <%=HIdto.getHost_id()%> 님의 비밀번호 변경</h3>
	<div class="join_row">
          <h3 class="join_title">
                <div>변경할 비밀번호를 입력해주세요.</div>
           </h3>
               <span class="join_box">
	 	<input id="pw" class="block-item input-item" type="password" name="host_pw"  required>
	</span>
	 </div>
	</div>
<!-- 저장 버튼 -->
<br><br>
 <span class="join_box">
      <input class="join_btn" type="submit" value="변경하기">
     </span>
   </div>
  </div>
</form>
</article>
<jsp:include page="/template/host_footer.jsp"></jsp:include>