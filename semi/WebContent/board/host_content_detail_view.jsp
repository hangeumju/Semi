<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <style>
		  div{
		  border: 1px dotted black;
		  float:left;
		  width:50%
		  }  
		  .w-70::after {
            content: "";
            display: block;
            clear: both;
        }
		  .main{
		  	width:50%;
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
