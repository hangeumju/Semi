<%@page import="beans.Host_Info_Dao"%>
<%@page import="beans.Host_Info_Dto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <style>
        .float-wrap{            
        }
        
        /* .float-wrap 이 끝나는 영역을 가상으로 생성하고 clear(가상선택자) */
        .float-wrap::after{
            content:"";
            display: block;
            clear: both;
        }
        
        .float-wrap > .float-item{
            border: 1px dotted black;
            float: left;    
        }
       
    </style>    
 
 	<%
 	String host_id = (String)session.getAttribute("host_id"); 
 	Host_Info_Dao HIdao = new Host_Info_Dao();
 	//기존 정보 불러오기 !
    Host_Info_Dto HIdto = HIdao.get(host_id);
    %>
    
<jsp:include page="/template/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/CSS/common.css">
       	<div class="float-item">
       		<ul class="host-list float-item">
		       <li>내 컨텐츠 보기</li>
		       <li>이용후기</li>
		       <li>정보수정</li>
		       <li>회원탈퇴</li>
		   </ul>
		</div>	
<form action="host_info.do" method="post">
<article class="w-40">
<div class="row">
<!-- 회원정보 출력 -->
<h2><%=HIdto.getHost_id() %>님의 정보</h2>
	<div class="row-left">
	<!-- 히든정보 -->
	<input type="hidden" name="go" value="<%=HIdto.getHost_id()%>" >
			<div>
				<h1>아이디</h1>
				<div><%=HIdto.getHost_id()%></div>
			</div>
			
			<div>
				<h1>이름</h1>
				<p><%=HIdto.getHost_name()%></p>
			</div>
			<div>
				<h1>휴대전화</h1>
				<p><%=HIdto.getHost_phone()%></p>
			</div>
			<div>
			<div>
				<h1>가입일</h1>
				<p><%=HIdto.getHost_joindatewithFormat()%></p>
			</div>
				<h1>이메일</h1>
				<p><%=HIdto.getHost_totalmail()%></p>
			</div>
			
			<div>
				<h1>최종로그인시간</h1>
				<p><%=HIdto.getHost_lastloginwithFormat()%></p>
			</div>
			<div>
				<h1>주소</h1>
				<p><%=HIdto.getHost_address()%></p>
			</div>
			
			<div>
				<h1>은행</h1>
				<p><%=HIdto.getHost_bankaccount()%></p>
			</div>
			</div>
			</div>
<h4><a href="host_check.jsp?go=/info/host_change_pw.jsp">비밀번호 변경</a></h4>
<h4><a href="host_check.jsp?go=/info/host_change_info.jsp">회원정보 수정</a></h4>
<h4><a href="host_check.jsp?go=/info/host_exit.jsp">회원 탈퇴</a></h4>
   </article>
   </form>
<jsp:include page="/template/footer.jsp"></jsp:include>