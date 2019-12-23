<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<footer class="row">
		
		
				<%
					String user_id = (String)session.getAttribute("user_id");
					String host_id = (String)session.getAttribute("host_id");
				%>
				
				<h5>user = <%=user_id %></h5>
				<h5>host = <%=host_id %></h5>
		
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
            
      <div>이용약관 &nbsp  개인정보 처리방침 &nbsp  위치기반 서비스 이용약관 </div>      
</footer>
    </main>
</body></html>