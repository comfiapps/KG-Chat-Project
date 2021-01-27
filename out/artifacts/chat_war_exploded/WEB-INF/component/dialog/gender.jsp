<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
    .custom {
        max-width: 240px;
    }
</style>

<div class="modal fade2" id="modifyGender">
    <div class="modal-dialog modal-dialog-centered custom">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">성별 변경</h5>
            </div>
            <div class="modal-body">
                <ul class="mdc-list">
                    <li class="mdc-list-item" tabindex="0">
                    <span class="mdc-list-item__graphic">
                        <div class="mdc-radio">
                        <input class="mdc-radio__native-control"
                               type="radio"
                               id="gender-select-0"
                               name="genderInput"
                               value="null"
                               <c:if test="${principal.user.gender == null}">checked</c:if>
                        >
                        <div class="mdc-radio__background">
                        <div class="mdc-radio__outer-circle"></div>
                        <div class="mdc-radio__inner-circle"></div>
                        </div>
                        </div>
                    </span>
                        <label id="gender-select-0-label"
                               for="gender-select-0"
                               class="mdc-list-item__text">선택 안함</label>
                    </li>

                    <li class="mdc-list-item" tabindex="0">
                    <span class="mdc-list-item__graphic">
                        <div class="mdc-radio">
                        <input class="mdc-radio__native-control"
                               type="radio"
                               value="female"
                               id="gender-select-1"
                               name="genderInput"
                               <c:if test="${principal.user.gender == 'female'}">checked</c:if>
                        >
                        <div class="mdc-radio__background">
                        <div class="mdc-radio__outer-circle"></div>
                        <div class="mdc-radio__inner-circle"></div>
                        </div>
                        </div>
                    </span>
                        <label id="gender-select-1-label"
                               for="gender-select-1"
                               class="mdc-list-item__text">여성</label>
                    </li>

                    <li class="mdc-list-item" tabindex="0">
                    <span class="mdc-list-item__graphic">
                        <div class="mdc-radio">
                        <input class="mdc-radio__native-control"
                               type="radio"
                               value="male"
                               id="gender-select-2"
                               name="genderInput"
                               <c:if test="${principal.user.gender == 'male'}">checked</c:if>
                        >
                        <div class="mdc-radio__background">
                        <div class="mdc-radio__outer-circle"></div>
                        <div class="mdc-radio__inner-circle"></div>
                        </div>
                        </div>
                    </span>
                        <label id="gender-select-2-label"
                               for="gender-select-2"
                               class="mdc-list-item__text">남성</label>
                    </li>
                </ul>
            </div>

            <div class="modal-footer">
                <button  class="mdc-button" data-dismiss="modal"/>
                <span class="mdc-button__ripple"></span>
                <span class="mdc-button__label">취소</span>
                </button>
                <button id="genderSubmit" class="mdc-button mdc-button--raised no-outline" disabled>
                    <span class="mdc-button__label">변경</span>
                </button>
            </div>
        </div>
    </div>
</div>