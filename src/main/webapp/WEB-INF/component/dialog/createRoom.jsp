<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<div class="modal fade2" id="createModal">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header border-bottom-0">
                <h5 class="modal-title">토론방 생성하기</h5>
            </div>
            <div class="modal-body">
                <label class="mdc-text-field mdc-text-field--filled mdc-text-field--no-label w-100">
                    <span class="mdc-text-field__ripple"></span>
                    <input class="mdc-text-field__input" type="text" placeholder="방 제목" aria-label="Label"
                           id="createRoom_name">
                    <span class="mdc-line-ripple"></span>
                </label>

                <div class ="subject">
                    <h6>토론 주제</h6>
                    <select class="input form-select no-outline" id="createRoom_category">
                        <option value = "청소년 연예인" selected = "selected">청소년 연예인</option>
                        <option value = "백신 접종 의무화">백신 접종 의무화</option>
                        <option value = "인공지능 개발">인공지능 개발</option>
                        <option value = "착한 사마리아인법">착한 사마리아인법</option>
                        <option value="사형제도">사형제도</option>
                        <option value = "청소년 복장 규제">청소년 복장 규제</option>
                        <option value = "남북통일">남북통일</option>
                        <option value = "낙태죄 폐지">낙태죄 폐지</option>
                        <option value = "동물 약물 실험">동물 약물 실험</option>
                        <option value = "안락사">안락사</option>
                        <option value = "동성결혼 합법화">동성결혼 합법화</option>
                        <option value = "민식이법 개정">민식이법 개정</option>
                        <option value = "게임중독의 질병분류">게임중독의 질병분류</option>
                        <option value = "반려동물의 중성화">반려동물의 중성화</option>
                        <option value = "기타">기타</option>
                    </select>
                    <label class="mdc-text-field mdc-text-field--filled mdc-text-field--no-label w-100 mdc-text-field--disabled" id = "labelStyle">
                        <span class="mdc-text-field__ripple"></span>
                        <input class="mdc-text-field__input" type="text" placeholder="주제를 입력하세요" aria-label="Label" id = "sub_input" disabled>
                        <span class="mdc-line-ripple"></span>
                    </label>
                </div>
            </div>

            <div class="modal-footer border-top-0">

                <button id="createRoomClose" class="mdc-button no-outline" data-dismiss="modal"/>
                <span class="mdc-button__ripple"></span>
                <span class="mdc-button__label">취소</span>
                </button>
                <button id="createRoomBtn" class="mdc-button mdc-button--raised no-outline" disabled>
                    <span class="mdc-button__label">확인</span>
                </button>
            </div>
        </div>
    </div>
</div>