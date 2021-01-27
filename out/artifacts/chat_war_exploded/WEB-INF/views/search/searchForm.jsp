<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

<c:choose>
    <c:when test="${searchResult.size() <= 0}">
        <div class="vh-100 justify-content-center align-items-center" style="display: flex; ">
            <h3>검색 결과가 없습니다</h3>
        </div>
    </c:when>

    <c:otherwise>
        <div class="main-content">
            <c:forEach items= "${searchResult}" var = "result">
                <div class="mdc-card mdc-card--outlined my-card room-card" onclick="location.href = '/discuss/${result.roomId}'">
                    <div class="mdc-card__primary-action my-card-content" tabindex="0">
                        <c:choose>
                            <c:when test="${result.opponent.id == null}">
                                <sub>.</sub>
                            </c:when>
                            <c:when test="${result.endDebate == null}">
                                <sub class="mdc-theme--error">준비중...</sub>
                            </c:when>
                            <c:otherwise>
                                <sub>--명 시청 • ${result.endDebate}</sub>
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
                        <h5 class="font-weight-bold" style="white-space: nowrap">(1-2) ${result.roomName}</h5>
                    </div>
                </div>
                <%--                                <c:out value = "${result.owner.id}" />--%>
                <%--                                <c:out value = "${result.owner.name}" />--%>
                <%--                            <c:out value = "${result.opponent.id}" />--%>
                <%--                            <c:out value = "${result.opponent.name}" />--%>

            </c:forEach>
        </div>
    </c:otherwise>
</c:choose>

<%@ include file="../layout/footer.jsp"%>