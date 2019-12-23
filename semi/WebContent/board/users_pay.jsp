<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>
<style>
/*박스 넓이가 멋대로 늘어나는것 방지*/
 *{
    box-sizing: border-box;
 }
div{
/* div 자신을 가운데 정렬 */
    margin-left: auto;
    margin-right:auto;
}
     .pick{
     	padding : 0.3rem;
     }
     .class_name{
     	padding : 30px;
     }
    
      .payment{
     	  display: inline-block;
            width:170px;    
     }
     
     .checkbox{
     	 display: inline;
     }
     /*
	다단 스타일(.row-multi)
	- 2단 : .row-multi.column-2
	- 3단 : .row-multi.column-3
	- 4단 : .row-multi.column-4
	- 5단 : .row-multi.column-5
*/
.row-multi::after{
    content:"";
    display: block;
    clear:both;
}

.row-multi > *{
    float:left;      
}

.row-multi.column-2 > * { width:50%; }
.row-multi.column-3 > * { width:33.3333%; }
.row-multi.column-4 > * { width:25%; }
.row-multi.column-5 > * { width:20%; }

/*
	row의 방향 설정
	- 기본값 : center
	- 왼쪽 : row-left
	- 오른쪽 : row-right
*/
.row, .row-left, .row-right, .row-multi{
    margin:10px 0px;
}
.row{
	text-align:center;
}
.row-left{
	text-align:left;
}
.row-right{
	text-align:right;
}

.two{
     background-color:url();
 
</style>

<body>
	<div class="w-60">
		<div class="row-left">
			<h4>결제</h4>
		</div>
		<hr>
		<div class="row-left">
			선택한 내역
		</div>
		<hr>
		<div class="row-left">
			<div class="class_name">
				클래스 이름이 들어갈 자리
			</div>
			<hr>
			<div>
				옵션이 들어갈 자리(예약날짜)
			</div>
		</div>
		<hr>
		<div class="row-multi column-2">
				<div class="row-left">상품 금액</div>
				<div class="row-right">????원</div>	
		</div>
		<hr>
		<div class="row-multi column-2">
			<div class="row-left">최종 결제 금액</div>
			<div class="row-right">????원</div>	
		</div>
		<br><br>
		<div>
			<div>결제수단</div>
			<hr>
		</div>
			<button class="one">체크/신용카드</button>
    		<button class="one">핸드폰 결제</button>
    		<button class="one">무통장 입금</button>
    		<button class="one">실시간 계좌이체</button>
    		<button class="one">무통장 입금</button>
			<button class="two"><img src="../image/payco.png"></button>
			<br><br>
		
		<div class="row">
			<div class="checkbox">
				<input type="checkbox">
			</div>
			<span class="agree">개인정보 제 3자 제공 동의, 결제 대행 서비스 이용 약관 등 모든 약관에 동의합니다.<span>
		</div>
		<div class="row">
			<input type="button" value="???원 결제하기">
		</div>
	
</body>

<jsp:include page="/template/footer.jsp"></jsp:include>