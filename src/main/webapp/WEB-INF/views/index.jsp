<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="layout/header.jsp"%>

<style>

    .mainbox{
        border-radius: 8px;
        box-shadow: 0 3px 6px #00000029;
        padding: 16px;
    }

    .mainbox h6 {
        margin: 0 0 4px 0;
        font-weight: normal;
    }

    .input {
        background-color: rgba(0, 0, 0, 0.1);
        border-radius: 4px;
        border-style: none;
        padding: 16px 8px;
    }

    .subject {
        margin-top: 16px;
    }

    .btn {
        margin-top: 30px;
        padding-left: 20px;
        display: flex;
        justify-content: flex-end;
    }

    .btn button{
        border-radius: 4px;
        border-style: none;
        height: 32px;
        padding: 4px 8px;
        font-size: 14px;
    }

    .btn1 {
        background-color: #70A9FF;
        margin-left: 8px;
    }

    .btn2 {
        background-color: transparent;
    }

</style>
</head>

<body>

    <div class="modal-dialog modal-dialog-centered">

        <div class ="mainbox">
            <h6>방제목</h6>
            <input class="input" type="text" name="title" >

            <div class ="subject">
                <h6>토론 주제</h6>
                <select class="input form-select">
                    <option>청소년 연예인</option>
                    <option>백신 접종 의무화</option>
                    <option>인공지능 개발</option>
                    <option>착한 사마리아인법</option>
                    <option>사형제도</option>
                    <option>청소년 복장 규제</option>
                    <option>남북통일</option>
                    <option>낙태죄 폐지</option>
                    <option>동물 약물 실험</option>
                    <option>안락사</option>
                    <option>동성결혼 합법화</option>
                    <option>민식이법 개정</option>
                    <option>게임중독의 질병분류</option>
                    <option>반려동물의 중성화</option>
                </select>
            </div>

            <ul class="btn">
                <button class ="btn2">취소</button>
                <button class ="btn1" type = "submit" name = "btn1">만들기</button>
            </ul>

    </div>
</div>

<%@ include file="layout/footer.jsp"%>


