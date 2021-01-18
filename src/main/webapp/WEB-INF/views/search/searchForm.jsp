<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

<div class="main-content">
    <c:forEach items= "${searchResult}" var = "result">
        <div class="mdc-card mdc-card--outlined room-card" onclick="location.href = '/discuss/${result.roomId}'">
            <div class="mdc-card__primary-action mdc-card--outlined  my-card my-card-content" tabindex="0">
                <c:choose>
                    <c:when test="${result.startDebate == null}">
                        <sub class="mdc-theme--error">대기중 (토론자 참여 안함)</sub>
                    </c:when>
                    <c:otherwise>
                        <sub>--명 시청 • ${result.startDebate}</sub>
                    </c:otherwise>
                </c:choose>

                <br>
                <div class="my-card-body">
                    <div class="contributors">
                        <c:choose>
                            <c:when test="${result.owner.image != null}">
                                <img src="${result.owner.image}" class="profile">
                            </c:when>
                            <c:otherwise>
                                <img src="${pageContext.request.contextPath}/image/user.png" class="profile">
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div class="contributors">
                        <c:choose>
                            <c:when test="${result.opponent.id == null}">
                                <h4>대기</h4>
                            </c:when>
                            <c:otherwise>
                                <c:choose>
                                    <c:when test="${result.opponent.image != null}">
                                        <img src="${result.opponent.image}" class="profile">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="${pageContext.request.contextPath}/image/user.png" class="profile">
                                    </c:otherwise>
                                </c:choose>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
                <div class="process_bar"><div class="process_left"></div></div>
                <div><sub>${result.roomCategory}</sub></div>
                <h5 class="font-weight-bold">${result.roomName} (1-2)</h5>
            </div>
        </div>
        <%--                                <c:out value = "${result.owner.id}" />--%>
        <%--                                <c:out value = "${result.owner.name}" />--%>
        <%--                            <c:out value = "${result.opponent.id}" />--%>
        <%--                            <c:out value = "${result.opponent.name}" />--%>

    </c:forEach>
</div>

<%@ include file="../layout/footer.jsp"%>