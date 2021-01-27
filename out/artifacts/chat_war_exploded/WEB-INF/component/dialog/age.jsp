<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>
    .custom {
        max-width: 240px;
    }
</style>

<div class="modal fade2" id="modifyAge">
    <div class="modal-dialog modal-dialog-centered custom">
        <div class="modal-content">
            <div class="modal-header border-bottom-0">
                <h5 class="modal-title">나이 변경</h5>
            </div>
            <div class="modal-body">
                <label class="mdc-text-field mdc-text-field--filled mdc-text-field--no-label w-100">
                    <span class="mdc-text-field__ripple"></span>
                    <input class="mdc-text-field__input" type="number" min="0" max="99" placeholder="변경할 나이" aria-label="Label"
                           id="ageInput" value="${principal.user.ageRange}">
                    <span class="mdc-line-ripple"></span>
                </label>
            </div>

            <div class="modal-footer border-top-0">
                <button  class="mdc-button no-outline" data-dismiss="modal"/>
                <span class="mdc-button__ripple"></span>
                <span class="mdc-button__label">취소</span>
                </button>
                <button id="ageSubmit" class="mdc-button mdc-button--raised no-outline" disabled>
                    <span class="mdc-button__label">변경</span>
                </button>
            </div>
        </div>
    </div>
</div>
