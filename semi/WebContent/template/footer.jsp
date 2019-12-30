<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%
	String user = (String)session.getAttribute("user_id");
	String host = (String)session.getAttribute("host_id");
%>
<style>
	div a{
		text-decoration: none;
		color: black;
		font-weight: bold;
	}
</style>
    
<footer class="row">
		
      <h4>대표: 한금주

           개인정보 관리 책임자: 이학준</h4>
      <h5>사업자등록번호: 123-12-12345

            통신판매업신고번호: 2019-KH당산-01010

            이메일: contact@KHmember.com

            대표전화: 070-7169-1234

            고객센터: 02-1588-1588

            업무시간: 평일 11:00 - 15:00 (점심: 13:00 - 14:00)

            주소: 서울특별시 당산동 노로 117 염전코딩노예  G601 </h5>
		
      <h4> &copy; KH당일치기 주식회사</h4>      
            
      <div><a href="<%=request.getContextPath()%>/ect/terms_of_use.jsp">이용약관 &nbsp</a>  <a href=<%=request.getContextPath()%>/ect/personal_information_processing.jsp>개인정보 처리방침 &nbsp</a>  <a href="<%=request.getContextPath()%>/ect/location_based_terms_of_service.jsp">위치기반 서비스 이용약관</a> </div>      
</footer>
    </main>
</body></html>