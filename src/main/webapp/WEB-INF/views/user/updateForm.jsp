<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

<style>
    .update-content {
        padding-top: 36px;
        height: 100vh;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .box {
        margin: 16px 0 52px 0;
        width: 100%;
        max-width: 720px;
        border: 1px solid rgba(0,0,0,0.3);
        padding: 24px;
        border-radius: 8px;
    }

    .small-box {
        width: 100%;
        height: 52px;
        border-bottom: 1px solid rgba(0,0,0,0.3);
        padding: 15px 12px 16px 24px;
        display: flex;
        align-items: center;
    }

    .img-box {
        height: 93px;
    }

    .hint {
        width: 30%;
        min-width: 100px;
        max-width: 174px;
        font-size: 10px;
    }

    .small-box h6 {
        flex-grow: 1;
    }

</style>

<div class="main-content update-content">
    <h4>개인정보</h4>

    <div class="box">
        <div class="small-box img-box">
            <h6 class="hint">사진</h6>
            <div>
                <c:choose>
                    <c:when test="${principal.user.image != null}">
                       <img src="${principal.user.image}" alt="profile" class="update_profile_img target_img">
                    </c:when>
                    <c:otherwise>
                        <img src="${pageContext.request.contextPath}/image/user.png" alt="profile"
                             class="update_profile_img target_img"></a>
                    </c:otherwise>
                </c:choose>
                <input accept="image/jpeg, image/png" type = "file" id = "fileSelector" style = "display:none;">
            </div>
        </div>

        <div class="small-box" data-toggle="modal" data-target="#modifyName">
            <h6 class="hint">닉네임</h6>
            <h6>${principal.user.name}</h6>
            <img src="${pageContext.request.contextPath}/image/round_keyboard_arrow_right_black_48dp.png">
        </div>
        <div class="small-box">
            <h6 class="hint">나이</h6>
            <h6>${principal.user.ageRange}</h6>
            <img src="${pageContext.request.contextPath}/image/round_keyboard_arrow_right_black_48dp.png">
        </div>
        <div class="small-box border-0">
            <h6 class="hint">성별</h6>
            <h6>${principal.user.gender}</h6>
            <img src="${pageContext.request.contextPath}/image/round_keyboard_arrow_right_black_48dp.png">
        </div>
    </div>
</div>


<!-- Modal -->
<div class="modal fade2" id="modifyName">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header border-bottom-0">
                <h5 class="modal-title">이름 변경</h5>
            </div>
            <div class="modal-body">
                <label class="mdc-text-field mdc-text-field--filled mdc-text-field--no-label w-100">
                    <span class="mdc-text-field__ripple"></span>
                    <input class="mdc-text-field__input" type="text" placeholder="변경할 이름" aria-label="Label"
                           id="nicknameInput" value="${principal.user.name}">
                    <span class="mdc-line-ripple"></span>
                </label>
            </div>

            <div class="modal-footer border-top-0">
                <button id="createRoomClose" class="mdc-button no-outline" data-dismiss="modal"/>
                <span class="mdc-button__ripple"></span>
                <span class="mdc-button__label">취소</span>
                </button>
                <button id="nicknameSubmit" class="mdc-button mdc-button--raised no-outline">
                    <span class="mdc-button__label">적용</span>
                </button>
            </div>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/js/user.js"></script>

<%@ include file="../layout/footer.jsp"%>