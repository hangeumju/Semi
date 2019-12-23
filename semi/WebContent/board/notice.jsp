<%@page import="beans.Notice_Board_Dao"%>
<%@page import="beans.Notice_Board_Dto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>

<%
	Notice_Board_Dao NBdao = new Notice_Board_Dao();	
	List<Notice_Board_Dto> list = NBdao.notice_board_list();
%>

<style>
        .notice_table {
            width: 100%;
            border-top: 1px solid #444444;
            border-collapse: collapse;
          }
          th, td {
            border-bottom: 1px solid #444444;
            padding: 10px;
          }
    
    </style>
</head>

<body>
    <main>
        <h1>공지사항</h1>
        <div>
            <table class="notice_table">
                <tbody>
                <%for(Notice_Board_Dto NBdto : list){%>
                    <tr>
                        <td>공지</td>
                        <td><%=NBdto.getNotice_title() %></td>    
                        <td align="right"><%=NBdto.getNotice_writer() %></td>
                        <td align="right" width="250"><%=NBdto.getNotice_date() %></td>
                    </tr>
                <%} %>
                </tbody>
                
            </table>
            
        </div>
    </main>
</body>


<jsp:include page="/template/footer.jsp"></jsp:include>