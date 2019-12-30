<%@page import="beans.Notice_Board_Dto"%>
<%@page import="java.util.List"%>
<%@page import="beans.Notice_Board_Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>

<%
	Notice_Board_Dao NBdao = new Notice_Board_Dao();	

	//[1] 번호를 받고 
	int no = Integer.parseInt(request.getParameter("no"));
	//[2] 번호에 해당하는 게시글을 불러오고
	Notice_Board_Dto NBdto = NBdao.notice_board_datail(no); //게시글 불러오기
	//[3] 아래에 출력

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
        div{
            padding: 30px;
        }
</style>
    
<section>
<hr color="#F98967">
<article>
        <div>
            <table class="notice_table">
                <tbody>              
                    <tr>
                    	<td><%=NBdto.getNotice_no()  %></td>
                        <td>공지</td>
                        <td><%=NBdto.getNotice_title() %></td>    
                        <td align="right"><%=NBdto.getNotice_writer() %></td>
                        <td align="right" width="250"><%=NBdto.getNotice_date() %></td>
                    </tr>             
                </tbody>
                
            </table>
            <div><%=NBdto.getNotice_content() %></div>
        </div>
</article>
<hr color="#F98967">
</section>

<jsp:include page="/template/footer.jsp"></jsp:include>