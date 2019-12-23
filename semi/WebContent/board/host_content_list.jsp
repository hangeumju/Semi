<%@page import="java.util.HashSet"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.List"%>
<%@page import="beans.Host_Content_Dto"%>
<%@page import="beans.Host_Content_Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
// 컨텐츠 불러오기

// 	오류나오는 영역을 고치기 위해 타입을 받았습니다 나중에 고치면 됩니다
// 	String type = request.getParameter("type");
	String category = "건강/뷰티";
	Host_Content_Dao HCdao = new Host_Content_Dao();
	

	List<Host_Content_Dto> list = HCdao.getList(category);

	
 
	
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
 	<% for (Host_Content_Dto dto : list) {%> 
        <div class="gallary-item">
            <div class="gallary-image">
       			<a href="<%=request.getContextPath()%>/board/host_content_detail_view.jsp?host_content_no=<%=dto.getHost_content_no()%>">
                <img src="http://placeimg.com/480/480/animals">
                </a>                
            </div>            
            <div class="gallary-text">
                <h4><%=dto.getHost_content_name() %></h4>
                <h4>
                    <%=dto.getHost_content_cost() %>
                </h4>
                <h4>
                	<%=dto.getHost_content_view_count() %>
                </h4>
                
            </div>
        </div>   
	<% } %>  
     </div>               

</article> 
    
<jsp:include page="/template/footer.jsp"></jsp:include>  