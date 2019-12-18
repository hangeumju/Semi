<%@page import="beans.Users_Regist_Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
 	//회원 정보를 불러오는 코드
 	//1. session에서 id에 들어있는 데이터를 꺼낸다
 	//2. id를 주고dao를 이용하여 회원정보(Dto)를 꺼낸다
 	//3. 원하는 위치에 출력한다.
 	
 	String id = (String)session.getAttribute("user_id");
 	 Users_Regist_Dao URdao = new Users_Regist_Dao();
 	 
 %>    
 
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
<jsp:include page="/template/header.jsp"></jsp:include>

<body>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/common.css">
<div class="row">
<div class="float-wrap">
       	<div class="float-item">
       		<ul class="custom-list float-item"">
		       <li>이용내역</li>
		       <li>이용후기</li>
		       <li><a href ="users_check.jsp?go=/info/users_change_info.jsp" >정보수정</a></li> 
		       <li>회원탈퇴</li>
		       <li>포인트내역</li>
		   </ul>
		</div>
       	<div class="float-item">
       		<div>
				아이디
			</div>
			<div>
				이름
			</div>
			<div>
				권한
			</div>
			<div>
				휴대폰번호
			</div>
			<div>
				포인트
			</div>
			<div>
				이메일
			</div>
			<div>
				관심사
			</div>		
		</div>
   </div>   
</div>
<jsp:include page="/template/footer.jsp"></jsp:include>