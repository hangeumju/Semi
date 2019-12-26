<%@page import="beans.Host_Calculate_Dao"%>


<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%

	//전달 날짜 구하기
	Calendar mon = Calendar.getInstance();
	mon.add(Calendar.MONTH , -1);
	String beforeMonth = new java.text.SimpleDateFormat("yyyy/MM/dd").format(mon.getTime()).substring(2, 7);
	//오늘날짜 구하기 
	SimpleDateFormat format1 = new SimpleDateFormat ("yyyy/MM/dd");
	Date time = new Date();
	String month = format1.format(time).substring(2, 7);
	
// 	System.out.println(beforeMonth);
// 	System.out.println(time1);
	
    String host_id = (String)request.getSession().getAttribute("host_id");
    
    Host_Calculate_Dao HCCdao = new Host_Calculate_Dao();
    
    int total = HCCdao.total_pay(host_id);
    int pmonth = HCCdao.total_pay(host_id, month);
    int bmonth = HCCdao.before_total_pay(host_id, beforeMonth);
    
    System.out.println(total);
    System.out.println(pmonth);
    System.out.println(bmonth);
    %>
    
    
    
<jsp:include page="/template/host_header.jsp"></jsp:include>
	<article>
		<div>총 금액</div>
		<div><%=total %>원</div>
		<div>이번달 금액</div>
		<div><%=pmonth %></div>
		<div>전달 금액</div>
		<div><%=bmonth %></div>
	</article>
<jsp:include page="/template/host_footer.jsp"></jsp:include>