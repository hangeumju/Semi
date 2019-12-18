<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<jsp:include page="/template/header.jsp"></jsp:include>  
<style>
	 	.custom-menu {
            list-style: none;
            margin: 0;
            padding: 0;
            display: block;

            width: 150px;
        }

        .custom-menu>li {
            background-color: black;
            padding: 15px;
            cursor: pointer;
        }
        
        .custom-menu a {
        	text-decoration: none;
        	color:white;
        }

        .custom-menu li:click {
            background-color: gray;
            color: black;
        }

        .custom-menu ul {
            list-style: none;
            padding: 0;
            margin: 0;

			position:relative;
            display: none;
        }

        .custom-menu ul > li {
            background-color: black;
            color: white;
            padding: 15px;
            width: 150px;
        }


        .custom-menu li:hover>ul {

            display: block;
        }
        
        .custom-menu li{
            overflow: hidden;
            white-space: nowrap; /* 공백 */
            text-overflow: ellipsis; /* 글자가 넘어갔을 경우*/
        }
        
        .gallary > .gallary-item {
    		float: left;
    		width: 33.333% !important;
    		padding: 10px;
		}	
        
</style>
    
    
    
    <article class="w-60">
    <div class="gallary">
    <div class="row-left gallary-item">
    	<ul class="custom-menu">
        <li>
        	<a href="#">컨텐츠 관리</a>
        	<ul>
        		<li><a href="#">상품 등록</a></li>
        		<li><a href="#">상품 리스트</a></li>
        		<li><a href="#">리뷰 관리</a></li>
        		<li><a href="#">예약자 관리</a></li>
        	</ul>
        </li>
        <li>
        	<a href="#">호스트내정보</a>
        	<ul>
        		<li><a href="#">정보 수정</a></li>
        		<li><a href="#">탈퇴</a></li>
         	</ul>
        </li>
        <li>
        	<a href="#">정산</a>
        </li>
       
    </ul>
    </div>
    <div class="gallary-item">
    ddd
    </div>
    <div class="gallary-item">
    ddd
    </div>
    </div>
    
    </article>
<jsp:include page="/template/footer.jsp"></jsp:include>  