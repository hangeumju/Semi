<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:include page="/template/header.jsp"></jsp:include>

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
        /*
        내부 영역 스타일
        - section 내부에 화면을 배치할 때 필요한 구성요소들을 미리 디자인
        - 영역(article) - 폭을 숫자로 지정할 수 있도록 구성
        */
        .w-100{ width: 100%; }
        .w-90{ width: 90%; }
        .w-80{ width: 80%; }
        .w-70{ width: 70%; }
        .w-60{ width: 60%; }
        .w-50{ width: 50%; }
        .w-40{ width: 40%; }
        .w-30{ width: 30%; }
        .w-20{ width: 20%; }
        .w-10{ width: 10%; }
        
        .row{
            margin:10px 0px;
            text-align: center;
        }
        .row > *{
            width:100%;
        }
        
        main{
        width:1000px;
        margin: auto;
        }
        h1{
            text-align: center;
        }
    
    </style>
    

    
</head>
<body>
   <main>
        <h1>공지사항</h1>
        <div>
            <table class="notice_table">
                <tbody>
                    <tr>
                        <td>공지</td>
                        <td>공지제목이들어갈자리</td>    
                        <td align="right">공지작성일자가들어갈자리</td>
                    </tr>                    
                </tbody>
                
            </table>
            <div></div>
            
        </div>
    </main> 
</body>


<jsp:include page="/template/footer.jsp"></jsp:include>