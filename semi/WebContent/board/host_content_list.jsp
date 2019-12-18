<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
// 컨텐츠 불러오기
/* 	Host_Content_Dao HCdao = new Host_Content_Dao();
	Host_Content_Dto HCdto = new Host_Content_Dto();
	List<Host_Content_Dto> list = dao.getList(HCdto);
 */
%>
	<!-- 갤러리 4단 나누기 -->

	
    <style>
        * {
            box-sizing: border-box;
        }
        
        .gallary{
            
        }
        .gallary::after{
            content:"";
            display: block;
            clear: both;
        }
        
        .gallary > .gallary-item{
            float:left;
            width:25% !important;
            padding:10px;
        }
        
        .gallary > .gallary-item > .gallary-image > img{
            width:100%;
            border-radius: 50%;
            opacity: 0.5;
        }
        
        .gallary > .gallary-item:hover{
            
        }
        
        .gallary > .gallary-item:hover > .gallary-image > img{
            opacity: 1;
        }
        
        .gallary > .gallary-item> .gallary-text > h4{
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;            
        }
        
        .gallary > .gallary-item> .gallary-text > p {
            word-break:break-all;
        }
        

        
        
        /* 테스트용 스타일 */
        .gallary, .gallary-text{
            border:1px dotted black;
        }
        .gallary-item{
            border:1px dotted red;
        }
        .gallary-image{
            border:1px dotted blue;
        }

    </style>
	<!-- 갤러리 4단 나누기 종료-->



<jsp:include page="/template/header.jsp"></jsp:include>

<article class="w-60">


  <div class="gallary">
	<%--  <% for (int i = 0; i < list.length; i++) {%> --%>
	
        <div class="gallary-item">
            <div class="gallary-image">
                <img src="http://placeimg.com/480/480/animals">                
            </div>            
            <div class="gallary-text">
                <h4>Lorem Ipsum</h4>
                <p>
                    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                </p>
            </div>
        </div>    
        
	<%-- <% } %>  --%>
     </div>                

	
</article> 
    
<jsp:include page="/template/footer.jsp"></jsp:include>  