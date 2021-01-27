<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
    .backdrop {
        -webkit-transition: background-color 0.2s ease;
        -moz-transition: background-color 0.2s ease;
        -o-transition: background-color 0.2s ease;
        transition: background-color 0.2s ease;
        position: fixed;
        display: none;
        width: 100vw;
        height: 100vh;
        background: rgba(0,0,0, 0.5);
        z-index: 5000;
        align-items: center;
        justify-content: center
    }

    .backdrop > div {
        margin: 0;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center
    }

    .backdrop h3 {
        color: white;
        margin-bottom: 12px;
        font-weight: bold;
    }

    .backdrop h6 {
        color: white;
        margin-bottom: 8px;
    }

    .code-content input{
        -webkit-transition: background-color 0.2s ease;
        -moz-transition: background-color 0.2s ease;
        -o-transition: background-color 0.2s ease;
        transition: background-color 0.2s ease;
        background: white;
        border-radius: 8px;
        width: 50px;
        height: 70px;
        margin: 3px;
        border: none;
        outline: none;
        color: black;
        text-align: center;
        font-size: 24px;
    }

</style>

<div class="backdrop">
    <div>
        <h3 class="backdrop-title">인증번호 입력</h3>
        <h6 class="backdrop-title">입력하신 이메일로 인증번호를 보냈습니다</h6>
        <div class="code-content">
            <input class="fd-code" id="code1" type="text" maxlength="1">
            <input class="fd-code" id="code2" type="text" maxlength="1">
            <input class="fd-code" id="code3" type="text" maxlength="1">
            <input class="fd-code" id="code4" type="text" maxlength="1">
        </div>
    </div>
</div>
