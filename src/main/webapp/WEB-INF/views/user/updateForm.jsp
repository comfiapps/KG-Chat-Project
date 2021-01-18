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
        border-bottom: 1px solid rgba(0,0,0,0.1);
        padding: 15px 12px 16px 24px;
        display: flex;
        align-items: center;
    }

    .arrow {
        width: 24px;
        height: 24px;
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
                       <img src="${principal.user.image}" alt="profile"
                            class="update_profile_img target_img">
                    </c:when>
                    <c:otherwise>
                        <img src="${pageContext.request.contextPath}/image/user.png" alt="profile"
                             class="update_profile_img target_img">
                    </c:otherwise>
                </c:choose>
                <input accept="image/jpeg, image/png" type = "file" id = "fileSelector" style = "display:none;">
            </div>
        </div>

        <div class="small-box mdc-ripple-surface" data-toggle="modal" data-target="#modifyName">
            <h6 class="hint">닉네임</h6>
            <h6>${principal.user.name}</h6>
            <img class="arrow"
                 src="${pageContext.request.contextPath}/image/round_keyboard_arrow_right_black_48dp.png">
        </div>
        <div class="small-box mdc-ripple-surface" data-toggle="modal" data-target="#modifyAge">
            <h6 class="hint">나이</h6>
            <c:choose>
                <c:when test="${principal.user.ageRange == null}">
                    <h6 style="opacity: .5">(설정 안함)</h6>
                </c:when>
                <c:otherwise>
                    <h6>${principal.user.ageRange}</h6>
                </c:otherwise>
            </c:choose>

            <img class="arrow"
                 src="${pageContext.request.contextPath}/image/round_keyboard_arrow_right_black_48dp.png">
        </div>
        <div class="small-box border-0 mdc-ripple-surface" data-toggle="modal" data-target="#modifyGender">
            <h6 class="hint">성별</h6>
            <c:choose>
                <c:when test="${principal.user.gender == 'female'}">
                    <h6>여성</h6>
                </c:when>
                <c:when test="${principal.user.gender == 'male'}">
                    <h6>남성</h6>
                </c:when>
                <c:otherwise>
                    <h6 style="opacity: .5">(선택 안함)</h6>
                </c:otherwise>
            </c:choose>

            <img class="arrow"
                    src="${pageContext.request.contextPath}/image/round_keyboard_arrow_right_black_48dp.png">
        </div>
    </div>

    <h4>참여한 토론</h4>

    <div>${myRoom}</div>

</div>



<%@ include file="../../component/dialog/nickname.jsp"%>
<%@ include file="../../component/dialog/age.jsp"%>
<%@ include file="../../component/dialog/gender.jsp"%>

<script src="${pageContext.request.contextPath}/js/user.js"></script>

<%@ include file="../layout/footer.jsp"%>