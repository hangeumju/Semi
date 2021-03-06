<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>

<%

	String host_content_name = request.getParameter("host_content_name");// 호스트 컨텐츠 이름
	String host_name = request.getParameter("host_name");//호스트 이름
	String host_phone = request.getParameter("host_phone");//호스트 번호
	int host_content_no = Integer.parseInt(request.getParameter("host_content_no"));//호스트 컨텐츠 넘버
	String host_content_location = request.getParameter("host_content_location");//호스트 컨텐츠 위치
	int host_content_cost = Integer.parseInt(request.getParameter("host_content_cost"));//호스트 컨텐츠 가격
	int ticketing = Integer.parseInt(request.getParameter("ticketing"));//유저가 구매하려는 티켓수
	String start_date = request.getParameter("start_date");//유저가 원하는 날짜
// 	System.out.println(host_content_name);
// 	System.out.println(host_content_no);
// 	System.out.println(host_name);
// 	System.out.println(host_phone);
	
	
%>

<style>
    /*박스 넓이가 멋대로 늘어나는것 방지*/
    * {
        box-sizing: border-box;
    }

    div {
        /* div 자신을 가운데 정렬 */
        margin-left: auto;
        margin-right: auto;
    }

    .pick {
        padding: 0.3rem;
    }

    .class_name {
        padding: 30px;
    }

    .payment {
        display: inline-block;
        width: 170px;
    }



    /*
	다단 스타일(.row-multi)
	- 2단 : .row-multi.column-2
	- 3단 : .row-multi.column-3
	- 4단 : .row-multi.column-4
	- 5단 : .row-multi.column-5
*/
    .row-multi::after {
        content: "";
        display: block;
        clear: both;
    }

    .row-multi>* {
        float: left;
    }

    .row-multi.column-2>* {
        width: 50%;
    }

    /*
	row의 방향 설정
	- 기본값 : center
	- 왼쪽 : row-left
	- 오른쪽 : row-right
*/
    .row,
    .row-left,
    .row-right,
    .row-multi {
        margin: 10px 0px;
    }

    .row {
        text-align: center;
    }

    .row-left {
        text-align: left;
    }

    .row-right {
        text-align: right;
    }
    
   

/*
	Title 스타일 : 제목에는 그라데이션 추가
*/
	.title{
	background: rgb(24,222,137);
	background: linear-gradient(93deg, rgba(249,137,103,1) 0%, rgba(252,158,129,1) 47%, rgba(251,199,183,1) 100%);
	color:white;
	text-align:left;
    padding: 0rem 1.5rem 0rem 1.5rem;
	}
    
/* 버튼 스타일 */    
  .btn_style1{
    height: 50px;
    line-height: 13px;
    background-color: transparent;
    text-align: center;
    cursor: pointer;
    font-size: 13px;
    padding: 0px 13px;
    border-width: 1px;
    border-style: solid;
    border-color: rgb(238, 238, 238);
    border-image: initial;
    border-radius: 5px;
}

    .btn_pay{
    width: 290px;
    height: 50px;
    line-height: normal;
    background-color: #F98967;
    text-align: center;
    cursor: pointer;
    color: white;
    font-size: 14px;
    padding: 0px 13px;
    border-radius: 5px;
    border-style: solid;
    border-width: 1px;    
    }
    
  
    

</style>
</head>

<body>
    <div class="w-60, row">
        <div class="row-left">
            <h2>결제</h2>
        </div>
        <hr>
        <div class="row-left">
            선택한 클래스내역
        </div>
        <hr>
        <div class="row-left">
            <div class="class_name">
                <%=host_content_name %>
            </div>
            <hr>
            <div>
               <ul>
                  <li>
                    옵션1) 선택한 날짜 <%=start_date %>
                  </li>
                  <li>
                    옵션2) 선택한 수량  <%=ticketing %> 개
                  </li>
               </ul>                
            </div>
        </div>
        <hr>
        <div class="row-multi column-2">
            <div class="row-left">상품 가격 </div>
            <div class="row-right"><%=host_content_cost %> 원</div>
        </div>
        <hr>
        <div class="row-multi column-2 title">
            <div class="row-left">최종 결제 금액</div>
            <div class="row-right"><%=host_content_cost * ticketing %>원</div>
        </div>
        <br>
        <div class="row-left" >결제수단</div>
        <hr>
       
        <button class="btn_style1">체크/신용카드</button>
        <button class="btn_style1">핸드폰 결제</button>
        <button class="btn_style1">무통장 입금</button>
        <button class="btn_style1">실시간 계좌이체</button>
        <button class="btn_style1">무통장 입금</button>
        <button class="btn_style1"><img src="../image/payco.png"></button>
        <br><br>
		<form action="<%=request.getContextPath()%>/board/user_pay.do" method="post">
			<input type="hidden" name="host_content_name" value="<%=host_content_name %>"><!--컨텐츠 제목 -->
			<input type="hidden" name="host_name" value="<%=host_name%>"><!--호스트 이름 -->
			<input type="hidden" name="host_phone" value="<%=host_phone%>"><!--호스트 폰번호 -->
			<input type="hidden" name="host_content_no" value="<%=host_content_no%>"><!-- 호스트 컨텐트 넘버 -->
			<input type="hidden" name="host_content_location" value="<%=host_content_location %>"><!--호스트 지역 -->
			<input type="hidden" name="host_content_cost" value="<%=host_content_cost %>"> <!--호스트 컨텐츠 가격 -->
        	<input type="hidden" name="ticketing" value="<%=ticketing %>">
        	<input type="hidden" name="start_date" value="<%=start_date %>">
        <div>
            <input type="checkbox">개인정보 제 3자 제공 동의, 결제 대행 서비스 이용 약관 등 모든 약관에 동의합니다.
        </div><br>
        <div>
            <input class="btn_pay" type="submit" value="결제">
        </div>
        </form>
    </div>

</body>

<jsp:include page="/template/footer.jsp"></jsp:include>