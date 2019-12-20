<%@page import="beans.Host_Info_Dto"%>
<%@page import="beans.Host_Info_Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    Host_Info_Dao HIdao = new  Host_Info_Dao();
    String host_id = (String)session.getAttribute("host_id");
    Host_Info_Dto HIdto = HIdao.get(host_id);
    %>
<jsp:include page="/template/header.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/common.css">
<html>
<head>
    
    <style type="text/css">
        #wrap {
            width: 800px;
            margin: 0 auto 0 auto;
        }
        #top{
            text-align :right;
        }
        #board, #pageForm, #searchForm{
            text-align :center;
        }
        
        #boardList{
            text-align :center;
        }
    </style>
    
    <script type="text/javascript">
        function writeForm(){
            location.href="";
        }
    </script>
    
</head>
<body>    
 
<div id="wrap">
    <br>
    <div id="top"> 
    </div>
    <br>
    <div id="board">
        <table id="#boardList" width="800" border="3" bordercolor="lightgray">
            <h3>(<%=host_id %>) 님의 예약자 관리</h3>
            <tr heigh="30">
                <td>예약번호</td>
                <td>예약자</td>
                <td>휴대전화 번호</td>
                <td>티켓수량</td>
                <td>예약날짜</td>
            </tr>    
            <tr>
                <td>1</td>
                <td>1</td>
                <td>1</td>
                <td>1</td>
            </tr>
        </table>
    </div>
    <br>
    <div id="pageForm">
        페이지 번호
    </div>
    <br>
    <div id="searchForm">
        <form>
            <select name="opt">
                <option value="1">예약번호</option>
                <option value="2">예약자</option>
                <option value="3">예약날짜</option>
            </select>
            <input type="text" size="20" name="condition"/>&nbsp;
            <input type="submit" value="검색"/>
        </form>    
    </div>
</div>    
 
</body>
</html>
<jsp:include page="/template/footer.jsp"></jsp:include>
