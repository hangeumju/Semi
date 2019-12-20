<%@page import="beans.Users_Get_Dto"%>
<%@page import="beans.Users_Info_Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Users_Info_Dao UIdao = new Users_Info_Dao();
	String user_id = (String)session.getAttribute("user_id");
	Users_Get_Dto UGdto = UIdao.users_get(user_id);
%>
<jsp:include page="/template/header.jsp"></jsp:include>

<style>
 /*박스 넓이가 멋대로 늘어나는것 방지*/
 *{
    box-sizing: border-box;
 }
/* div 자신을 가운데 정렬 */
div{
   margin-left: auto;
   margin-right:auto;
   }
        
/*
	row의 방향 설정
	- 기본값 : center
	- 왼쪽 : row-left
	- 오른쪽 : row-right
*/
.row, .row-left, .row-right, .row-multi{
    margin:10px 0px;
}
.row{
	text-align:center;
}
.row-left{
	text-align:left;
}
.row-right{
	text-align:right;
}

/* 내정보 사이드메뉴를 꾸며주는 css */

.float-wrap:after{
            content: "";
            display: block;
            clear: both;
        }
.float-wrap > .float-item{
       border: 1px solid black;
       float: left;
       /* width: 50%; */
        }
        
.float-wrap {
   
}

/* .float-wrap 이 끝나는 영역을 가상으로 생성하고 clear(가상선택자) */
.float-wrap::after {
   content: "";
   display: block;
   clear: both;
}

     /*
	다단 스타일(.row-multi)
	- 2단 : .row-multi.column-2
	- 3단 : .row-multi.column-3
	- 4단 : .row-multi.column-4
	- 5단 : .row-multi.column-5
*/
.row-multi::after{
    content:"";
    display: block;
    clear:both;
}

.row-multi > *{
    float:left;      
}

.row-multi.column-2 > * { width:50%; }
.row-multi.column-3 > * { width:33.3333%; }
.row-multi.column-4 > * { width:25%; }
.row-multi.column-5 > * { width:20%; }

</style>
<!-- css style 끝 -->

<body>

	<div class="row">
		<h2><%=user_id %>님의 이용 내역입니다</h2>
	</div>
	
		<div class="row-multi column-2">
			<div class="w-30">
				<ul class="custom-list float-item"">
					<li><a href="<%=request.getContextPath() %>/info/users_history.jsp">이용내역</a></li>
					<li><a href="<%=request.getContextPath() %>/info/users_review.jsp">이용후기</a></li>
					<li><a href="users_check.jsp?go=/info/users_change_info.jsp">정보수정</a></li>
					<li><a href="users_check.jsp?go=/info/users_exit.do">회원탈퇴</a></li>
					<li><a href="<%=request.getContextPath() %>/info/users_point.jsp">포인트내역</a></li>
				</ul>
			</div>
			


<div class="w-70">
	<!-- 테이블에 들어갈 내용 : 이용 날짜, 컨텐츠명, 가격, 호스트이름, 호스트 연락처, 장소 -->
		<table class="table" >
			<thead>
				<tr>
				<th>이용날짜</th>
				<th>컨텐츠명</th>
				<th>가격</th>
				<th>호스트이름</th>
				<th>호스트연락처</th>
				<th>위치</th>		
				</tr>		
			</thead>
			<tbody>
            <tr>
                <td>?</td>
                <td>?</td>
                <td>?</td>
                <td>?</td>
                <td>?</td>
                <td>?</td>                 
            </tr>
            <tr>
                <td>?</td>
                <td>?</td>
                <td>?</td>
                <td>?</td>
                <td>?</td>
                <td>?</td>                 
            </tr>
            <tr>
                <td>?</td>
                <td>?</td>
                <td>?</td>
                <td>?</td>
                <td>?</td>
                <td>?</td>                 
            </tr>
            <tr>
                <td>?</td>
                <td>?</td>
                <td>?</td>
                <td>?</td>
                <td>?</td>
                <td>?</td>                 
            </tr>
        </tbody>
		</table>

	</div>
</div>
</body>

<jsp:include page="/template/footer.jsp"></jsp:include>