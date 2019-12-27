<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%
//host_id 는 hidden 으로 넘김
String host_id = (String)request.getSession().getAttribute("host_id");

/////////////절대경로 변수
String context = request.getContextPath();
%>

<style>
       *{
           box-sizing: border-box;
       }
             div{
/*        border: 1px solid black;    */
       }
       .side{
           width: 170px;
           float: left;         
       }
       
       .side .side_menu > ul > li > a {
            margin: 0;
            padding: 0;
            border: 0;
            font-size: 16px;
            font-weight: 500;
            color: black;
            line-height: 40px;
            display: block;
            text-decoration: none;
       }
       
       ul{
           list-style: none;
       }
       .side .side_menu > ul > li:hover{
            background-color: antiquewhite;
            color: black;
       }
       .side .side_menu > ul > li{
            padding: 0px 0px 0px 10px;
           
       }
        .content{
           float: left;
           width: 1000px;
           font-size: 16px;
           font-weight: 500;
           color: black;
           line-height: 40px;
           display: block;
           padding: 0px 0px 0px 100px;
/*            text-align: center; */
       }
         /* 여백 주기 */
        .row-empty{
            height: 80px;
        }
        #dd{
           margin: auto;
           width: 1200px;
        }
         /* .float끝나는 영역을 가상으로 생성하고 clear(가상선택자) */
        #dd::after{
            content:"";
            display: block;
            clear: both;
        }   
        
         .join_btn{
            width:300px;
            font-size:1.5rem;
            padding:0.5rem;
            background-color: #F98967;
            color:white;
            border:none;
            border-radius: 10px;
        }       
</style>




<!-- style , script 정의 공간 -->

   <!-- 호스트 가입 우편번호 API -->

   <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   <script type="text/javascript">
      function postcode() {
          new daum.Postcode({
              oncomplete: function(data) {
                  // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
      
                  // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                  // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                  var addr = ''; // 주소 변수
                  var extraAddr = ''; // 참고항목 변수
      
                  //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                  if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                      addr = data.roadAddress;
                  } else { // 사용자가 지번 주소를 선택했을 경우(J)
                      addr = data.jibunAddress;
                  }
      
                  // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                  if(data.userSelectedType === 'R'){
                      // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                      // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                      if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                          extraAddr += data.bname;
                      }
                      // 건물명이 있고, 공동주택일 경우 추가한다.
                      if(data.buildingName !== '' && data.apartment === 'Y'){
                          extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                      }
                      // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                      if(extraAddr !== ''){
                          extraAddr = ' (' + extraAddr + ')';
                      }
                      // 조합된 참고항목을 해당 필드에 넣는다.
                      // document.getElementById("sample6_extraAddress").value = extraAddr;
                      // 아래와 같이 변경이 가능
                      // extraAddress 창을 비활성화 했기 때문에 필요 없음
                      // document.querySelector("input[name=extra_addr]").value =  extraAddr;
                  
                  } else {
                      // document.querySelector("input[name=extra_addr]").value = '';
                  }
      
                  // 우편번호와 주소 정보를 해당 필드에 넣는다.
                  // document.getElementById('sample6_postcode').value = data.zonecode;
                  document.querySelector("input[name=host_post]").value = data.zonecode;
                  // document.getElementById("sample6_address").value = addr;
                  document.querySelector("input[name=host_basic_addr]").value = addr;
                  // 커서를 상세주소 필드로 이동한다.
                  // document.getElementById("sample6_detailAddress").focus();
                  document.querySelector("input[name=host_extra_addr]").focus();
              }
          }).open();
      }
   </script>
   <!-- 우편번호 API 종료 -->   

    <!-- Content 날자 지정 API  -->
    <link rel="stylesheet" type="text/css" href="../css/datepicker.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
    <script src="../js/datepicker.js"></script>
    <script>    
       function loadPicker(){
            var options = {
                //날짜가 입력될 첫 번째 칸 설정
                field:document.querySelector(".start_date"),
                //날짜가 입력될 두 번째 칸 설정
                secondField:document.querySelector(".last_date"),
                //표시될 월의 개수를 설정
                numberOfMonths:2,
                //날짜 선택이 아닌 범위 선택으로 설정
                singleDate:false,
                //최초 선택일 이후로만 종료일을 선택하도록 설정
                selectForward:true,
                //날짜 구분자 설정
                seperator:'-',
               
                //문서 내에 표시되도록 설정
                // inline:true,
                //선택 시작일 설정(현재일로 설정하거나 'YYYY-MM-DD' 형태로 설정)
                minDate:moment(new Date()).add(1, 'days'),//내일부터 선택 가능
                // minDate:new Date(),//오늘부터 선택가능
                
                //날짜형식설정
                format:'YYYY-MM-DD'
            };
            var picker = new Lightpick(options);
        }
       //이 페이지에서 예약 실행
       window.onload=loadPicker;       
    </script>
    <!-- Content 날자 지정 API 종료  -->
    
<!-- style , script 정의 공간 -->

<jsp:include page="/template/host_header.jsp"></jsp:include>
<body>
   <div id="dd">
   
    <h2 style="margin: 20px 50px 10px"><%=host_id %>님의 컨텐츠 관리</h2>
     <div class="row-empty"></div>
      <!-- side_menu시작 -->
       <div class="side">
         
          <div class="side_menu">             
              <ul>
                <div style="margin: 0px 10px;">내 컨텐츠</div>
                 <hr color="#F98967">
                  <li>
                      <a href="<%=context%>/board/host_content_produce.jsp" >컨텐츠 등록</a>
                  </li>
                  <li>                     
                      <a href="<%=context%>/board/host_confirm_list.jsp" >내 컨텐츠 목록</a>
                  </li>
                  <li>                     
                      <a href="<%=context%>/board/reservation_chart.jsp">예약자관리</a>
                  </li>                  
              </ul>
          </div>
          <!-- side_menu끝 -->
       </div>
       <!-- side끝 -->
       

<!-- 컨텐츠 정보 입력 -->
<div class="content">
   <form action="host_content_produce.do" method="post">

   <!-- host_id 는 hidden 으로 넘김 -->
   <!-- host_id 대신에 rlawldms 넣어놨으니 나중에 변경 -->
   <%-- <input  type="hidden" name= "host_id" value="<%=host_id%>">    --%>   
   <input  type="hidden" name= "host_id" value="rlawldms">   

   <div>       
      <h2>컨텐츠 만들기</h2>

      </div>
      <div class="row-left">
      </div>
      <div class="row-left">
         <p class="row-left">
         <span style="color: black; margin: 0 15px 0 0px;">카테고리</span>
         <select class="block-item input-item" name="host_content_category">
            <option value="" selected disabled hidden >카테고리 선택</option>
            <option>액티비티</option>
            <option>배움</option>
            <option>건강/뷰티</option>
            <option>모임</option>
            <option>여행</option>
         </select>
      </p>   
      </div>
      <div style ="height: 10px"></div>
      
      <div class="row-left">
      <span style="color: black; margin: 0 40px 0 0px; font-size: 12.8px">가격</span>
         <input class="block-item input-item" type="number" name= "host_content_cost"  required>
      </div>
      <div style ="height: 10px"></div>
      
      <div class="row-left">
      <span style="color: black; margin: 0 15px 0 0px; font-size: 12.8px">컨텐츠명</span>
         <input class="block-item input-item" type="text" name= "host_content_name"  required>
      </div>
      <div style ="height: 10px"></div>
   
      <div class="row-left">
      <span style="color: black; margin: 0 15px 0 0px; font-size: 12.8px">판매수량</span>
         <input class="block-item input-item" type="number" name= "host_content_ticket"  required>
      </div>
      <div style ="height: 30px"></div>
      
      <div class="row-left">
      <h4 style="color: black; font-size: 16px; margin: 0 0 7px 0;">컨텐츠 소개글을 작성해주세요</h4>               
         <textarea class="block-item input-item" rows="10"  rows="15" cols="100" name="host_content_info" 
         placeholder="(필수) 진행장소에 대한 소개 & 세부일정에 대한 설명 & 배우는 컨텐츠 소개 & 난이도 설명"></textarea>
      </div>
      <div style ="height: 10px"></div>
      
      <h4 style="color: black; font-size: 16px;  margin: 0 0 7px 0;">사진을 업로드해주세요</h4>         
      <div>
         <input type="file" name="host_content_file1" accept=".jpg, png, .gif" value="첨부파일">
         <input type="file" name="host_content_file2" accept=".jpg, png, .gif" value="첨부파일">
         <input type="file" name="host_content_file3" accept=".jpg, png, .gif" value="첨부파일">
      </div>
      
      <div class="row-empty"></div>
      <div class="row-empty"></div>
      
      <div class="row-left">   
         <h4 style="color: black; font-size: 16px;  margin: 0 0 7px 0;">클래스 진행 기간을 설정해주세요</h4>         
            <div>
                <input type="text" name="start_date" class="start_date" placeholder="시작하는 날">
                ~
             <input type="text" name="last_date" class="last_date" placeholder="끝나는 날">
            </div>         
      </div>
      <div style ="height: 10px"></div>
      
   <div class="row-empty"></div>
   <div class="row-empty"></div>
          
          <div class="join_row">
                   <h3 class="join_title">
                       <h4 style="color: black; font-size: 16px;  margin: 0 0 7px 0;">클래스 진행장소를 입력해주세요</h4>
                   </h3>
                   <span class="email_box">
                  <input class="input-item" type="text" name="host_post" placeholder="우편번호">
                  <input class="input-item" type="button" onclick="postcode()" value="우편번호 찾기">
                   </span>
               </div>  
          
          <p>   
             <input class="block-item input-item" type="text" name="host_basic_addr" placeholder="기본주소">
             <input class="block-item input-item" type="text" name="host_extra_addr" placeholder="상세주소">
         </p>
      </span>
      
      <div style ="height: 10px"></div>
            
      <div class="row-empty"></div>
      <div class="row-empty"></div>
            
      <div class="row-left">         
      <h4 style="color: black; font-size: 16px;  margin: 0 0 7px 0;">준비물 및 유의사항을 작성해주세요</h4>      
         <textarea class="block-item input-item" rows="15" cols="100"  name="host_content_ect_info"></textarea>
      </div>
      <div style ="height: 20px"></div>

      
      <div style ="height: 20px"></div>
      <div class="row-empty"></div>
      <div class="row-empty"></div>
         
         
      <div class="row-left">   
      <h4 style="color: black; font-size: 16px;  margin: 0 0 7px 0;">추가사항을 작성해주세요</h4>         
         <textarea class="block-item input-item" rows="15" cols="100"  name="host_content_QA" placeholder="(필수) 세부일정 & 포함사항 및 불포함사항 & 자주묻는질문에 대한 답변(Q&A)"></textarea>
      </div>
      <div style ="height: 10px"></div>
      
      <div style="text-align: center; margin: 0 180px 0 0;">
         <div class="row-empty"></div>
         <div class="row-empty"></div>
         <input class="join_btn" type="submit" value= "컨텐츠 등록하기" >   
      </div>

   </form>
</div>
</div>
<div class="row-empty"></div>
<div class="row-empty"></div>
<div class="row-empty"></div>
<div class="row-empty"></div>

   <hr color="#F98967">   
</body>   


<jsp:include page="/template/host_footer.jsp"></jsp:include>