<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/profile.css">

<div class="main-content">
    <div class="update-content">
        <h4>개인정보</h4>

        <div class="box">
            <div class="small-box img-box h-100">
                <span class="hint">사진</span>
                <div>
                    <c:choose>
                        <c:when test="${principal.user.image != null}">
                           <img src="${principal.user.image}" alt="profile"
                                class="target_img">
                        </c:when>
                        <c:otherwise>
                            <img src="${pageContext.request.contextPath}/image/user.png" alt="profile"
                                 class="target_img">
                        </c:otherwise>
                    </c:choose>
                    <input accept="image/jpeg, image/png" type = "file" id = "fileSelector" style = "display:none;">
                </div>
            </div>

            <div class="small-box mdc-ripple-surface" data-toggle="modal" data-target="#modifyName">
                <span class="hint">닉네임</span>
                <span class="privacy_detail">${principal.user.name}</span>
                <span class="material-icons md-16">chevron_right</span>
            </div>
            <div class="small-box mdc-ripple-surface" data-toggle="modal" data-target="#modifyEmail">
                <span class="hint">이메일</span>
                <c:choose>
                    <c:when test="${principal.user.email == null}">
                        <span class="privacy_detail" style="opacity: .5">(설정 안함)</span>
                    </c:when>
                    <c:otherwise>
                        <span class="privacy_detail">${principal.user.email}</span>
                    </c:otherwise>
                </c:choose>
                <span class="material-icons md-16">chevron_right</span>
            </div>
            <div class="small-box mdc-ripple-surface" data-toggle="modal" data-target="#modifyAge">
                <span class="hint">나이</span>
                <c:choose>
                    <c:when test="${principal.user.ageRange == null}">
                        <span class="privacy_detail" style="opacity: .5">(설정 안함)</span>
                    </c:when>
                    <c:otherwise>
                        <span class="privacy_detail">${principal.user.ageRange}</span>
                    </c:otherwise>
                </c:choose>
                <span class="material-icons md-16">chevron_right</span>
            </div>
            <div class="small-box border-0 mdc-ripple-surface" data-toggle="modal" data-target="#modifyGender">
                <span class="hint">성별</span>
                <c:choose>
                    <c:when test="${principal.user.gender == 'female'}">
                        <span class="privacy_detail">여성</span>
                    </c:when>
                    <c:when test="${principal.user.gender == 'male'}">
                        <span class="privacy_detail">남성</span>
                    </c:when>
                    <c:otherwise>
                        <span class="privacy_detail" style="opacity: .5">(선택 안함)</span>
                    </c:otherwise>
                </c:choose>
                <span class="material-icons md-16">chevron_right</span>
            </div>
        </div>

        <c:choose>
            <c:when test="${myRoom.size() > 0}">
                <h4>참여한 토론</h4>

                <div class="container">
                    <div class="row">
                        <c:forEach items="${myRoom}" var="rooms">
                            <div class="col" style="display: flex; justify-content: center">
                                <div class="mdc-card mdc-card--outlined my-card" onclick="location.href = '/discuss/${rooms.roomId}'">
                                    <div class="mdc-card__primary-action my-card-content" tabindex="0">
                                        <c:choose>
                                            <c:when test="${roomList.opponent.id == null}">
                                                <sub>.</sub>
                                            </c:when>
                                            <c:when test="${roomList.endDebate == null}">
                                                <sub class="mdc-theme--error">준비중...</sub>
                                            </c:when>
                                            <c:otherwise>
                                                <sub>--명 시청 • ${roomList.endDebate}</sub>
                                            </c:otherwise>
                                        </c:choose>

                                        <br>
                                        <div class="my-card-body">
                                            <div class="contributors">
                                                <c:choose>
                                                    <c:when test="${rooms.owner.image != null}">
                                                        <img src="${rooms.owner.image}" class="profile">
                                                    </c:when>
                                                    <c:otherwise>
                                                        <img src="${pageContext.request.contextPath}/image/user.png" class="profile">
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
                                                            <c:when test="${rooms.opponent.image != null}">
                                                                <img src="${rooms.opponent.image}" class="profile">
                                                            </c:when>
                                                            <c:otherwise>
                                                                <img src="${pageContext.request.contextPath}/image/user.png" class="profile">
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                        <c:choose>
                                            <c:when test="${rooms.endDebate == null}">
                                                <div class="score_bar" style="height: 0.5em">
                                                    <div class="score_bar_right hidden">
                                                    </div>
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="score_bar" style="height: 0.5em">
                                                    <c:choose>
                                                        <c:when test="${rooms.countOwnerVote != 0 || rooms.countOpponentVote !=0}">
                                                            <div class="score_bar_right" >
                                                                <div class="score_bar_left" style="width:${(rooms.countOwnerVote/(rooms.countOwnerVote+rooms.countOpponentVote))*100}%; ${rooms.countOwnerVote/(rooms.countOwnerVote+rooms.countOpponentVote)== 1?'border-radius: 5px 5px 5px 5px;':''}"></div>                                                </div>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <div class="score_bar_right" >
                                                                <div class="score_bar_left" style="width:50%;"></div>
                                                            </div>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                        <div><sub>${rooms.roomCategory}</sub></div>
                                        <h5 class="font-weight-bold">(${rooms.countOwnerVote}-${rooms.countOpponentVote}) ${rooms.roomName}</h5>
                                        <div>
                                            <sub>${roomCounter[rooms.roomId] == null?0:roomCounter[rooms.roomId]}명 조회 • <fmt:formatDate value="${rooms.endDebate}" pattern="YYYY-MM-DD HH:mm"/></sub>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </c:forEach>

                    </div>
                </div>
            </c:when>

            <c:otherwise>
                <h4 class="mdc-theme--error font-weight-bold">참여한 토론이 없습니다</h4>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<%@ include file="../../component/dialog/nickname.jsp"%>
<%@ include file="../../component/dialog/email.jsp"%>
<%@ include file="../../component/dialog/age.jsp"%>
<%@ include file="../../component/dialog/gender.jsp"%>

<script>
    let updateForm_original_nick = "${principal.user.name}";
    let updateForm_original_email = "${principal.user.email}";
    let updateForm_original_age = "${principal.user.ageRange}";
    let updateForm_original_gender = "${principal.user.gender}";

    let date = new Date(${rooms.createDate});
</script>

<script src="${pageContext.request.contextPath}/js/user.js"></script>

<%@ include file="../layout/footer.jsp"%>