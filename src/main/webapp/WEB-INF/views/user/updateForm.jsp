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
    .box2 {
        margin: 16px 0 52px 0;
        width: 100%;
        max-width: 861px;
        border: 1px  rgba(0,0,0,0.3);
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
    .mdc-card__primary-action mdc-card--outlined  my-card my-card-content{
        width: 100%;
        height: 172px;
        padding: 16px;
        display: flex;
        align-items: center;
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

    <div class="box2">
        <c:forEach items="${myRoom}" var="rooms">

                <div class="mdc-card mdc-card--outlined"  onclick="location.href = '/discuss/${rooms.roomId}'">
                    <div class="mdc-card__primary-action mdc-card--outlined  my-card my-card-content" tabindex="0">
                        <c:choose>
                            <c:when test="${rooms.opponent.id == null}">
                                <sub class="mdc-theme--error">대기중 (토론자 참여 안함)</sub>
                            </c:when>
                            <c:otherwise>
                                <sub>50명 시청 • ${rooms.startDebate}</sub>
                            </c:otherwise>
                        </c:choose>


                        <br>
                        <div class="my-card-body">
                            <div class="contributors">
                                <c:choose>
                                    <c:when test="${rooms.owner.image == null}">
                                        <img src="${pageContext.request.contextPath}/image/user.png" alt="" class="profile">
                                    </c:when>
                                    <c:otherwise>
                                        <img src=${rooms.owner.image} alt="" class="profile">
                                    </c:otherwise>
                                </c:choose>

                            </div>
                            <div class="contributors">
                                <c:choose>
                                    <c:when test="${rooms.opponent.id == null}">
                                        <h2>대기</h2>
                                    </c:when>
                                    <c:otherwise>
                                        <c:choose>
                                            <c:when test="${rooms.opponent.img = null}">
                                                <img src="${pageContext.request.contextPath}/image/user.png"  class="profile">
                                            </c:when>
                                            <c:otherwise>
                                                    <img src="${rooms.opponent.img}" class="profile">

                                            </c:otherwise>
                                        </c:choose>
                                    </c:otherwise>
                                </c:choose>




                            </div>
                        </div>
                        <div class="process_bar"><div class="process_left"></div></div>
                        <div><sub>${rooms.roomCategory}</sub></div>
                        <h5 class="font-weight-bold">${rooms.roomName}(1-2)</h5>
                    </div>
                </div>
            </a>

          <%--  <c:out value = "${rooms.owner.id}" />
            <c:out value = "${rooms.owner.name}" />


            <c:out value = "${rooms.opponent.name}" />--%>



<%--
            <c:forEach items= "${recommends.rooms}" var = "roomList">
                <c:out value = "${roomList.roomId}" />
                <c:out value = "${roomList.owner.id}" />
                <c:out value = "${roomList.owner.name}" />
                <c:out value = "${roomList.owner.image}" />
                <c:out value = "${roomList.opponent.id}" />
                <c:out value = "${roomList.opponent.name}" />
                <c:out value = "${roomList.opponent.image}" />
                <c:out value = "${roomList.roomName}" />
                <c:out value = "${roomList.roomCategory}" />
                <c:out value = "${roomList.startDebate}" />
            </c:forEach>--%>
            <br/>
        </c:forEach>
    </div>
</div>



<%@ include file="../../component/dialog/nickname.jsp"%>
<%@ include file="../../component/dialog/age.jsp"%>
<%@ include file="../../component/dialog/gender.jsp"%>

<script src="${pageContext.request.contextPath}/js/user.js"></script>

<%@ include file="../layout/footer.jsp"%>