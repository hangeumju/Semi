<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
//host_id 는 hidden 으로 넘김
String host_id = (String)request.getSession().getAttribute("host_id");
%>


 <jsp:include page="/template/header.jsp"></jsp:include>  



	<form action="host_content_list.do" method="post">
	<article class="w-40">
	
	<!-- host_id 는 hidden 으로 넘김 -->
	<!-- host_id 대신에 rlawldms 넣어놨으니 나중에 변경 -->
	<%-- <input  type="hidden" name= "host_id" value="<%=host_id%>">	 --%>
	<input  type="hidden" name= "host_id" value="rlawldms">	

		<div class="row"> 		
			<h2> 호스트 컨텐츠 생성</h2>
		</div>
		<div class="row-left">
		</div>
		<div class="row-left">
			<input class="block-item input-item" type="text" name= "host_content_category" placeholder= "카테고리" required>	
		</div>
		<div class="row-left">
			<input class="block-item input-item" type="number" name= "host_content_cost" placeholder= "가격" required>
		</div>
		<div class="row-left">
			<input class="block-item input-item" type="text" name= "host_content_name" placeholder= "컨텐츠 이름" required>
		</div>
	
		<div class="row-left">
			<input class="block-item input-item" type="number" name= "host_content_ticket" placeholder= "컨텐츠 수량" required>
		</div>
		
		<div class="row-left">			
			<textarea class="block-item input-item" rows="10"  name="host_content_info"> 컨탠츠 내용을 작성해주세요 </textarea>
		</div>
		
		<div class="row-left">			
			<input class="block-item input-item" type="text" name= "host_content_date" placeholder= "예시 : 2019-12-20 am 12:12~14:12" required>		
		</div>
		
		<div>
			<p> 모집위치 </p>		
			    <input class="block-item input-item" type="text" id="address-input" name="host_content_location" placeholder="주소 입력" onblur="loadMap();">
   				<div  id="map" style="width:100%;height:400px;display:none;" ></div>
		</div>
				
		<div class="row-left">			
			<textarea class="block-item input-item" rows="10"  name="host_content_ect_info"> 컨탠츠 추가 내용을 작성해주세요 </textarea>
		</div>
		<div>
			<input type="file" name="host_content_file" accept=".jpg, png, .gif" value="첨부파일">
		</div>	
		<div class="row-left">			
			<textarea class="block-item input-item" rows="10"  name="host_content_QA"> QA 내용을 작성해주세요 </textarea>
		</div>
		
		<div class="row-right">
			<input class="block-item input-item" type="submit" value= "컨텐츠 등록하기" >	
		</div>	
	</article>	
	</form>	


<jsp:include page="/template/footer.jsp"></jsp:include>  