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
                                <sub>${roomCounter[result.roomId] == null?0:roomCounter[result.roomId]}명 조회 • <fmt:formatDate value="${result.endDebate}" pattern="YYYY-MM-DD HH:mm"/></sub>
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
                        <c:choose>
                            <c:when test="${result.endDebate == null}">
                                <div class="score_bar" style="height: 0.5em">
                                    <div class="score_bar_right hidden">
                                    </div>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="score_bar" style="height: 0.5em">
                                    <c:choose>
                                        <c:when test="${result.countOwnerVote != 0 || result.countOpponentVote !=0}">
                                            <div class="score_bar_right" >
                                                <div class="score_bar_left" style="width:${(result.countOwnerVote/(result.countOwnerVote+result.countOpponentVote))*100}%; ${result.countOwnerVote/(result.countOwnerVote+result.countOpponentVote)== 1?'border-radius: 5px 5px 5px 5px;':''}"></div>                                                </div>
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
                        <div><sub>${result.roomCategory}</sub></div>
                        <h5 class="font-weight-bold" style="white-space: nowrap">(${result.countOwnerVote}-${result.countOpponentVote}) ${result.roomName}</h5>
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