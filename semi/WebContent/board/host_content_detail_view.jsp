<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <style>
		  div{
		  border: 1px dotted black;
		  float:left;
		  width:25%
		  }  
		  .w-70::after {
            content: "";
            display: block;
            clear: both;
            height : 500px;
        }
		  .main{
		  	width:465px;
			/* 		  	글 안넘어가게 하는 명령어 */
		  	word-break:break-all; 
		  	
		  }
		  
		  .sub{
			width:232px;
		  	position: fixed;
		  	top: 26.3%;
            right: 27.05%;
            height : 400px;
            /* 		  	글 안넘어가게 하는 명령어 */
            word-break:break-all;
		  }
    </style>
    
<jsp:include page="/template/header.jsp"></jsp:include>
	
	<article class="w-70">
		
			<div class="main">
			aaaaaaaaaaaaaaa
			</div>
			<div class="sub">
			bㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠㅠbbbbbbbbbbbbbbbbbbbbbbbbb
			</div>
		
	
	</article>
<jsp:include page="/template/footer.jsp"></jsp:include>
