<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>

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
	background-image: linear-gradient(277deg, rgb(98, 201, 255), rgb(51, 151, 255));
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
    background-color: rgb(51, 151, 255);
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
            선택한 내역
        </div>
        <hr>
        <div class="row-left">
            <div class="class_name">
                클래스 이름이 들어갈 자리
            </div>
            <hr>
            <div>
               <ul>
                  <li>
                    옵션1) 케이크 캔들 + 티라이트 캔들 4개 제작(1인) x 1개  
                  </li>
                  <li>
                    옵션2) 케이크 캔들 4개 제작(1인) x 1개  
                  </li>
               </ul>                
            </div>
        </div>
        <hr>
        <div class="row-multi column-2">
            <div class="row-left">상품 금액</div>
            <div class="row-right">????원</div>
        </div>
        <hr>
        <div class="row-multi column-2 title">
            <div class="row-left">최종 결제 금액</div>
            <div class="row-right">????원</div>
        </div>
        <br>
        <div class="row-left">결제수단</div>
        <hr>
       
        <button class="btn_style1">체크/신용카드</button>
        <button class="btn_style1">핸드폰 결제</button>
        <button class="btn_style1">무통장 입금</button>
        <button class="btn_style1">실시간 계좌이체</button>
        <button class="btn_style1">무통장 입금</button>
        <button class="btn_style1"><img src="../image/payco.png"></button>
        <br><br>

        <div class="row">
            <input type="checkbox">개인정보 제 3자 제공 동의, 결제 대행 서비스 이용 약관 등 모든 약관에 동의합니다.
        </div><br>
        <div>
            <input class="btn_pay" type="submit" value="300000000원 결제하기">
        </div>
    </div>

</body>

<jsp:include page="/template/footer.jsp"></jsp:include>