<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
    #emailSubmit{
       float: right;
    }
</style>
<div class="modal fade2" id="modifyEmail">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header border-bottom-0">
                <h5 class="modal-title">이메일 변경</h5>
            </div>
            <div class="modal-body">

                <div>
                    <label class="mdc-text-field mdc-text-field--filled mdc-text-field--no-label w-100" style="margin-bottom: 4px">
                        <span class="mdc-text-field__ripple"></span>
                        <input class="mdc-text-field__input" type="text" maxlength="100" placeholder="변경할 이메일" aria-label="Label"
                               id="emailInput" value="${principal.user.email}">
                        <span class="mdc-line-ripple"></span>
                        <button id="emailSubmit" class="mdc-button mdc-button--raised no-outline" disabled>
                            <span class="mdc-button__label">요청</span>
                        </button>
                    </label>

                    <span id = "msgEmail"></span>

                </div>

                <div>
                    <label class="mdc-text-field mdc-text-field--filled mdc-text-field--no-label w-100 mdc-text-field--disabled" id = "emailLabel">
                        <span class="mdc-text-field__ripple"></span>
                        <input class="mdc-text-field__input" type="text" maxlength="6" placeholder="인증번호" aria-label="Label"
                               id="codeInput" disabled>
                        <span class="mdc-line-ripple"></span>
                    </label>

                    <span id = "msgCode"></span>
                </div>
            </div>

            <div class="modal-footer border-top-0">
                <button  class="mdc-button no-outline" id = "emailCancel" data-dismiss="modal"/>
                <span class="mdc-button__ripple"></span>
                <span class="mdc-button__label">취소</span>
                </button>
                <button id="codeSubmit" class="mdc-button mdc-button--raised no-outline" disabled>
                    <span class="mdc-button__label">확인</span>
                </button>
            </div>
        </div>
    </div>
</div>