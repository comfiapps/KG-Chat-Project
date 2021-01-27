<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="layout/header.jsp"%>

<style>
    .scrollmenu {
        overflow: auto;
        white-space: nowrap;
        padding-inline-start: 32px;
        padding-inline-end: 32px;
        -ms-overflow-style: none;
        scrollbar-width: none;
    }

    .scrollmenu::-webkit-scrollbar {
        display: none;
    }

    .category-title {
        padding: 32px 32px 0;
    }

    .scrollmenu-wrapper {
        position:relative;
    }

    .panner {
        margin: 0 16px;
        background: white;
        color: black;
        position:absolute;
        top: 50%;
        transform: translate(0, -50%);
    }

    #panLeft {
        left: 0;
        display: none;
    }

    #panRight {
        right: 0;
        display: none;
    }

    .contributors span {
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .home-tab {
        max-width: 700px;
        margin: 0 auto;
    }

    .contributor-name {
        width: 100%;
        flex-grow: 1;
        text-align: center;
    }
    .line{
        width: 95%;
        margin: 0 auto;
        margin-top: 25px;
        height: 1px;
        background-color: RGBA(0,0,0,.1);
    }


</style>

<section class="main-content">
    <div class="mdc-tab-bar home-tab" role="tablist">
        <div class="mdc-tab-scroller">
            <div class="mdc-tab-scroller__scroll-area">
                <div class="mdc-tab-scroller__scroll-content">
                    <button class="mdc-tab mdc-tab--active" role="tab" aria-selected="true" tabindex="0" onclick="location.href = '/home?c=o'">
                        <span class="mdc-tab__content">
                            <span class="mdc-tab__text-label">진행</span>
                        </span>
                        <span class="mdc-tab-indicator" id="tab_1">
                            <span class="mdc-tab-indicator__content mdc-tab-indicator__content--underline"></span>
                        </span>
                        <span class="mdc-tab__ripple"></span>
                    </button>
                    <button class="mdc-tab mdc-tab--active" role="tab" aria-selected="true" tabindex="0" onclick="location.href = '/home?c=w'">
                        <span class="mdc-tab__content">
                            <span class="mdc-tab__text-label">대기</span>
                        </span>
                        <span class="mdc-tab-indicator" id="tab_2">
                            <span class="mdc-tab-indicator__content mdc-tab-indicator__content--underline"></span>
                        </span>
                        <span class="mdc-tab__ripple"></span>
                    </button>
                    <button class="mdc-tab mdc-tab--active" role="tab" aria-selected="true" tabindex="0" onclick="location.href = '/home?c=d'">
                        <span class="mdc-tab__content">
                            <span class="mdc-tab__text-label">완료</span>
                        </span>
                        <span class="mdc-tab-indicator" id="tab_3">
                            <span class="mdc-tab-indicator__content mdc-tab-indicator__content--underline"></span>
                        </span>
                        <span class="mdc-tab__ripple"></span>
                    </button>
                </div>
            </div>
        </div>
    </div>

    <c:set var="categoryNum" value="0" />
    <c:forEach items="${recommend}" var="recommends" varStatus="e">
        <h4 class="font-weight-bold category-title">${recommends.category}</h4>

        <div class="scrollmenu-wrapper">
            <div class="scrollmenu" id="scrollmenu-${categoryNum}">
                <c:forEach items= "${recommends.rooms}" var = "roomList" varStatus="i">
                    <div class="mdc-card mdc-card--outlined my-card room-card" onclick="location.href = '/discuss/${roomList.roomId}'">
                        <div class="mdc-card__primary-action my-card-content" tabindex="0">
                            <c:choose>
                                <c:when test="${roomList.opponent.id == null}">
                                    <sub>.</sub>
                                </c:when>
                                <c:when test="${roomList.endDebate == null}">
                                    <sub class="mdc-theme--error">준비중...</sub>
                                </c:when>
                                <c:otherwise>
                                    <sub>${roomCounter[roomList.roomId] == null?0:roomCounter[roomList.roomId]}명 조회 • <fmt:formatDate value="${roomList.endDebate}" pattern="YYYY-MM-DD HH:mm"/></sub>
                                </c:otherwise>
                            </c:choose>

                            <br>
                            <div class="my-card-body">
                                <div class="contributors">
<%--                                    <span>--%>
                                        <c:choose>
                                            <c:when test="${roomList.owner.image != null}">
                                                <img src="${roomList.owner.image}" class="profile">
                                            </c:when>
                                            <c:otherwise>
                                                <img src="${pageContext.request.contextPath}/image/user.png" class="profile">
                                            </c:otherwise>
                                        </c:choose>
<%--                                        <sub>${roomList.owner.name}</sub>--%>
<%--                                    </span>--%>
                                </div>
                                <div class="contributors">
                                    <c:choose>
                                        <c:when test="${roomList.opponent.id == null}">
                                            <h4>대기</h4>
                                        </c:when>
                                        <c:otherwise>
<%--                                            <span>--%>
                                                <c:choose>
                                                    <c:when test="${roomList.opponent.image != null}">
                                                        <img src="${roomList.opponent.image}" class="profile">
                                                    </c:when>
                                                    <c:otherwise>
                                                        <img src="${pageContext.request.contextPath}/image/user.png" class="profile">
                                                    </c:otherwise>
                                                </c:choose>
<%--                                                <sub>${roomList.opponent.name}</sub>--%>
<%--                                            </span>--%>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                            <c:choose>
                                <c:when test="${roomList.endDebate == null}">
                                    <div class="score_bar" style="height: 0.5em">
                                        <div class="score_bar_right hidden">
                                        </div>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="score_bar" style="height: 0.5em">
                                        <c:choose>
                                            <c:when test="${roomList.countOwnerVote != 0 || roomlist.countOpponentVote !=0}">
                                                <div class="score_bar_right" >
                                                    <div class="score_bar_left" style="width:${(roomList.countOwnerVote/(roomList.countOwnerVote+roomList.countOpponentVote))*100}%; ${roomList.countOwnerVote/(roomList.countOwnerVote+roomList.countOpponentVote)== 1?'border-radius: 5px 5px 5px 5px;':''}"></div>                                                </div>
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
                            <div><sub>${roomList.roomCategory}</sub></div>

                            <c:choose>
                                <c:when test="${roomList.endDebate == null}">
                                    <h5 class="font-weight-bold">${roomList.roomName}</h5>
                                </c:when>
                                <c:otherwise>
                                    <h5 class="font-weight-bold">(${roomList.countOwnerVote}-${roomList.countOpponentVote}) ${roomList.roomName}</h5>
                                </c:otherwise>
                            </c:choose>

                        </div>
                    </div>
    <%--                                <c:out value = "${roomList.owner.id}" />--%>
    <%--                                --%>
    <%--                            <c:out value = "${roomList.opponent.id}" />--%>
    <%--                            <c:out value = "${roomList.opponent.name}" />--%>

                </c:forEach>

                <button class="mdc-fab mdc-fab--mini panner" id="panLeft" data-scroll-modifier='-1'>
                    <div class="mdc-fab__ripple"></div>
                    <span class="mdc-fab__icon material-icons">chevron_left</span>
                </button>

                <button class="mdc-fab mdc-fab--mini panner" id="panRight" data-scroll-modifier='1'>
                    <div class="mdc-fab__ripple"></div>
                    <span class="mdc-fab__icon material-icons">chevron_right</span>
                </button>
            </div>
        </div>

<%--
        <c:if test="${e.index==0}">
            <div class="line"></div>
        </c:if>
--%>

        <c:set var="categoryNum" value="${categoryNum + 1}" />
    </c:forEach>
    <br>
</section>

<script src="${pageContext.request.contextPath}/js/scroll.js"></script>




