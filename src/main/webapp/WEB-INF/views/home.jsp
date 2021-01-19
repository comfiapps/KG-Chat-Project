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

    .contributor-name {
        width: 100%;
        flex-grow: 1;
        text-align: center;
    }
</style>

<section class="main-content">

    <c:set var="categoryNum" value="0" />
    <c:forEach items="${recommend}" var="recommends">
        <h4 class="font-weight-bold category-title">${recommends.category}</h4>

        <div class="scrollmenu-wrapper">
            <div class="scrollmenu" id="scrollmenu-${categoryNum}">
                <c:forEach items= "${recommends.rooms}" var = "roomList">
                    <div class="mdc-card mdc-card--outlined my-card room-card" onclick="location.href = '/discuss/${roomList.roomId}'">
                        <div class="mdc-card__primary-action my-card-content" tabindex="0">
                            <c:choose>
                                <c:when test="${roomList.opponent.id == null}">
                                    <sub>.</sub>
                                </c:when>
                                <c:when test="${roomList.startDebate == null}">
                                    <sub class="mdc-theme--error">준비중...</sub>
                                </c:when>
                                <c:otherwise>
                                    <sub>--명 시청 • ${roomList.startDebate}</sub>
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
                            <div class="process_bar"><div class="process_left"></div></div>
                            <div><sub>${roomList.roomCategory}</sub></div>
                            <h5 class="font-weight-bold">(1-2) ${roomList.roomName}</h5>
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
        <c:set var="categoryNum" value="${categoryNum + 1}" />
    </c:forEach>
    <br>
</section>

<script src="${pageContext.request.contextPath}/js/scroll.js"></script>




