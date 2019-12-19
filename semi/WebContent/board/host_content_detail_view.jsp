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
		  }
		  
		  .sub{
			width:232px;
		  	position: fixed;
		  	top: 26.3%;
            right: 27.05%;
            height : 400px;
		  }
    </style>
    
<jsp:include page="/template/header.jsp"></jsp:include>
	
	<article class="w-70">
		
			<div class="main">
			a
			</div>
			<div class="sub">
			b
			</div>
		
	
	</article>
<jsp:include page="/template/footer.jsp"></jsp:include>
