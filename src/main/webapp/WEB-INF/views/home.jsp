<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="layout/header.jsp"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/css.css">

<style>
    .group_box a:link{
     color: black; text-decoration: none;
    }
</style>


<section class="main main-content">

    <div class="container">
        <div class="group_title">
            인기
        </div>
        <div class="group_box">
            <a href = "/discuss/">
                <div class="mdc-card mdc-card--outlined">
                    <div class="mdc-card__primary-action mdc-card--outlined  my-card my-card-content" tabindex="0">
                        <sub>50명 시청 • 29:40</sub>
                        <br>
                        <div class="my-card-body">
                            <div class="contributors">
                                <img src="${pageContext.request.contextPath}/image/user.png" alt="" class="profile">
                            </div>
                            <div class="contributors">
                                <img src="${pageContext.request.contextPath}/image/user.png" alt="" class="profile">
                            </div>
                        </div>
                        <div class="process_bar"><div class="process_left"></div></div>
                        <div><sub>주제</sub></div>
                        <h5 class="font-weight-bold">제목 (1-2)</h5>
                    </div>
                </div>
            </a>
            <div>
<%--                ${recommend}--%>
            </div>

            <div>
                <c:forEach items="${recommend}" var="recommends">
                    <c:out value="${recommends.category}"/>
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
                    </c:forEach>
                    <br/>
                </c:forEach>
            </div>


            <div class="content_box">
                <div class="content_title">
                    <div class="hashTag">
                        <a href="#">#성평등</a>
                        <a href="#">#성평등</a>
                        <a href="#">#성평등</a>
                    </div>
                    <div>당신의 과거는 안녕하십니까?</div>
                </div>
                <div class="content_detail">
                    <div class="user_left"><img src="${pageContext.request.contextPath}/image/user.png" alt="" class="profile"></div>
                    <div class="compare">
                        <div class="score">1-2</div>
                        <div class="process_bar">
                            <div class="process_left"></div>
                        </div>
                        <div class="time">
                            31:40
                        </div>
                    </div>
                    <div class="user_right"><img src="${pageContext.request.contextPath}/image/user.png" alt="" class="profile"></div>
                </div>
                <div class="content_footer">
                    <div class="content_footer_left">
                        <div class="text_center"><img src="${pageContext.request.contextPath}/image/user.png" alt="" width="16px" class="profile"></div>
                        <div class="text_center">User #1</div>
                    </div>
                    <div>시청자 50명</div>
                </div>
            </div>

            <div class="content_box">
                <div class="content_title">
                    <div class="hashTag">
                        <a href="#">#성평등</a>
                        <a href="#">#성평등</a>
                        <a href="#">#성평등</a>
                    </div>
                    <div>당신의 과거는 안녕하십니까?</div>
                </div>
                <div class="content_detail">
                    <div class="user_left"><img src="${pageContext.request.contextPath}/image/user.png" alt="" class="profile"></div>
                    <div class="compare">
                        <div class="score">1-2</div>
                        <div class="process_bar">
                            <div class="process_left"></div>
                        </div>
                        <div class="time">
                            31:40
                        </div>
                    </div>
                    <div class="user_right"><img src="${pageContext.request.contextPath}/image/user.png" alt="" class="profile"></div>
                </div>
                <div class="content_footer">
                    <div class="content_footer_left">
                        <div class="text_center"><img src="${pageContext.request.contextPath}/image/user.png" alt="" width="16px" class="profile"></div>
                        <div class="text_center">User #1</div>
                    </div>
                    <div>시청자 50명</div>
                </div>
            </div>

            <div class="content_box">
                <div class="content_title">
                    <div class="hashTag">
                        <a href="#">#성평등</a>
                        <a href="#">#성평등</a>
                        <a href="#">#성평등</a>
                    </div>
                    <div>당신의 과거는 안녕하십니까?</div>
                </div>
                <div class="content_detail">
                    <div class="user_left"><img src="${pageContext.request.contextPath}/image/user.png" alt="" class="profile"></div>
                    <div class="compare">
                        <div class="score">1-2</div>
                        <div class="process_bar">
                            <div class="process_left"></div>
                        </div>
                        <div class="time">
                            31:40
                        </div>
                    </div>
                    <div class="user_right"><img src="${pageContext.request.contextPath}/image/user.png" alt="" class="profile"></div>
                </div>
                <div class="content_footer">
                    <div class="content_footer_left">
                        <div class="text_center"><img src="${pageContext.request.contextPath}/image/user.png" alt="" width="16px" class="profile"></div>
                        <div class="text_center">User #1</div>
                    </div>
                    <div>시청자 50명</div>
                </div>
            </div>

            <div class="content_box">
                <div class="content_title">
                    <div class="hashTag">
                        <a href="#">#성평등</a>
                        <a href="#">#성평등</a>
                        <a href="#">#성평등</a>
                    </div>
                    <div>당신의 과거는 안녕하십니까?</div>
                </div>
                <div class="content_detail">
                    <div class="user_left"><img src="${pageContext.request.contextPath}/image/user.png" alt="" class="profile"></div>
                    <div class="compare">
                        <div class="score">1-2</div>
                        <div class="process_bar">
                            <div class="process_left"></div>
                        </div>
                        <div class="time">
                            31:40
                        </div>
                    </div>
                    <div class="user_right"><img src="${pageContext.request.contextPath}/image/user.png" alt="" class="profile"></div>
                </div>
                <div class="content_footer">
                    <div class="content_footer_left">
                        <div class="text_center"><img src="img/profile.png" alt="" width="16px" class="profile"></div>
                        <div class="text_center">User #1</div>
                    </div>
                    <div>시청자 50명</div>
                </div>
            </div>

            <div class="content_box">
                <div class="content_title">
                    <div class="hashTag">
                        <a href="#">#성평등</a>
                        <a href="#">#성평등</a>
                        <a href="#">#성평등</a>
                    </div>
                    <div>당신의 과거는 안녕하십니까?</div>
                </div>
                <div class="content_detail">
                    <div class="user_left"><img src="img/profile.png" alt="" class="profile"></div>
                    <div class="compare">
                        <div class="score">1-2</div>
                        <div class="process_bar">
                            <div class="process_left"></div>
                        </div>
                        <div class="time">
                            31:40
                        </div>
                    </div>
                    <div class="user_right"><img src="img/profile.png" alt="" class="profile"></div>
                </div>
                <div class="content_footer">
                    <div class="content_footer_left">
                        <div class="text_center"><img src="img/profile.png" alt="" width="16px" class="profile"></div>
                        <div class="text_center">User #1</div>
                    </div>
                    <div>시청자 50명</div>
                </div>
            </div>
            <div class="content_box">
                <div class="content_title">
                    <div class="hashTag">
                        <a href="#">#성평등</a>
                        <a href="#">#성평등</a>
                        <a href="#">#성평등</a>
                    </div>
                    <div>당신의 과거는 안녕하십니까?</div>
                </div>
                <div class="content_detail">
                    <div class="user_left"><img src="img/profile.png" alt="" class="profile"></div>
                    <div class="compare">
                        <div class="score">1-2</div>
                        <div class="process_bar">
                            <div class="process_left"></div>
                        </div>
                        <div class="time">
                            31:40
                        </div>
                    </div>
                    <div class="user_right"><img src="img/profile.png" alt="" class="profile"></div>
                </div>
                <div class="content_footer">
                    <div class="content_footer_left">
                        <div class="text_center"><img src="img/profile.png" alt="" width="16px" class="profile"></div>
                        <div class="text_center">User #1</div>
                    </div>
                    <div>시청자 50명</div>
                </div>
            </div>
            <div class="content_box">
                <div class="content_title">
                    <div class="hashTag">
                        <a href="#">#성평등</a>
                        <a href="#">#성평등</a>
                        <a href="#">#성평등</a>
                    </div>
                    <div>당신의 과거는 안녕하십니까?</div>
                </div>
                <div class="content_detail">
                    <div class="user_left"><img src="img/profile.png" alt="" class="profile"></div>
                    <div class="compare">
                        <div class="score">1-2</div>
                        <div class="process_bar">
                            <div class="process_left"></div>
                        </div>
                        <div class="time">
                            31:40
                        </div>
                    </div>
                    <div class="user_right"><img src="img/profile.png" alt="" class="profile"></div>
                </div>
                <div class="content_footer">
                    <div class="content_footer_left">
                        <div class="text_center"><img src="img/profile.png" alt="" width="16px" class="profile"></div>
                        <div class="text_center">User #1</div>
                    </div>
                    <div>시청자 50명</div>
                </div>
            </div>
            <div class="content_box">
                <div class="content_title">
                    <div class="hashTag">
                        <a href="#">#성평등</a>
                        <a href="#">#성평등</a>
                        <a href="#">#성평등</a>
                    </div>
                    <div>당신의 과거는 안녕하십니까?</div>
                </div>
                <div class="content_detail">
                    <div class="user_left"><img src="img/profile.png" alt="" class="profile"></div>
                    <div class="compare">
                        <div class="score">1-2</div>
                        <div class="process_bar">
                            <div class="process_left"></div>
                        </div>
                        <div class="time">
                            31:40
                        </div>
                    </div>
                    <div class="user_right"><img src="img/profile.png" alt="" class="profile"></div>
                </div>
                <div class="content_footer">
                    <div class="content_footer_left">
                        <div class="text_center"><img src="img/profile.png" alt="" width="16px" class="profile"></div>
                        <div class="text_center">User #1</div>
                    </div>
                    <div>시청자 50명</div>
                </div>
            </div>

        </div>
    </div>

    <div class="container">
        <div class="group_title">성평등</div>
        <div class="group_box">
            <div class="content_box">
                <div class="content_title">
                    <div class="hashTag">
                        <a href="#">#성평등</a>
                        <a href="#">#성평등</a>
                        <a href="#">#성평등</a>
                    </div>
                    <div>당신의 과거는 안녕하십니까?</div>
                </div>
                <div class="content_detail">
                    <div class="user_left"><img src="img/profile.png" alt="" class="profile"></div>
                    <div class="compare">
                        <div class="score">1-2</div>
                        <div class="process_bar">
                            <div class="process_left"></div>
                        </div>
                        <div class="time">
                            31:40
                        </div>
                    </div>
                    <div class="user_right"><img src="img/profile.png" alt="" class="profile"></div>
                </div>
                <div class="content_footer">
                    <div class="content_footer_left">
                        <div class="text_center"><img src="img/profile.png" alt="" width="16px" class="profile"></div>
                        <div class="text_center">User #1</div>
                    </div>
                    <div>시청자 50명</div>
                </div>
            </div>

            <div class="content_box">
                <div class="content_title">
                    <div class="hashTag">
                        <a href="#">#성평등</a>
                        <a href="#">#성평등</a>
                        <a href="#">#성평등</a>
                    </div>
                    <div>당신의 과거는 안녕하십니까?</div>
                </div>
                <div class="content_detail">
                    <div class="user_left"><img src="img/profile.png" alt="" class="profile"></div>
                    <div class="compare">
                        <div class="score">1-2</div>
                        <div class="process_bar">
                            <div class="process_left"></div>
                        </div>
                        <div class="time">
                            31:40
                        </div>
                    </div>
                    <div class="user_right"><img src="img/profile.png" alt="" class="profile"></div>
                </div>
                <div class="content_footer">
                    <div class="content_footer_left">
                        <div class="text_center"><img src="img/profile.png" alt="" width="16px" class="profile"></div>
                        <div class="text_center">User #1</div>
                    </div>
                    <div>시청자 50명</div>
                </div>
            </div>

            <div class="content_box">
                <div class="content_title">
                    <div class="hashTag">
                        <a href="#">#성평등</a>
                        <a href="#">#성평등</a>
                        <a href="#">#성평등</a>
                    </div>
                    <div>당신의 과거는 안녕하십니까?</div>
                </div>
                <div class="content_detail">
                    <div class="user_left"><img src="img/profile.png" alt="" class="profile"></div>
                    <div class="compare">
                        <div class="score">1-2</div>
                        <div class="process_bar">
                            <div class="process_left"></div>
                        </div>
                        <div class="time">
                            31:40
                        </div>
                    </div>
                    <div class="user_right"><img src="img/profile.png" alt="" class="profile"></div>
                </div>
                <div class="content_footer">
                    <div class="content_footer_left">
                        <div class="text_center"><img src="img/profile.png" alt="" width="16px" class="profile"></div>
                        <div class="text_center">User #1</div>
                    </div>
                    <div>시청자 50명</div>
                </div>
            </div>

            <div class="content_box">
                <div class="content_title">
                    <div class="hashTag">
                        <a href="#">#성평등</a>
                        <a href="#">#성평등</a>
                        <a href="#">#성평등</a>
                    </div>
                    <div>당신의 과거는 안녕하십니까?</div>
                </div>
                <div class="content_detail">
                    <div class="user_left"><img src="img/profile.png" alt="" class="profile"></div>
                    <div class="compare">
                        <div class="score">1-2</div>
                        <div class="process_bar">
                            <div class="process_left"></div>
                        </div>
                        <div class="time">
                            31:40
                        </div>
                    </div>
                    <div class="user_right"><img src="img/profile.png" alt="" class="profile"></div>
                </div>
                <div class="content_footer">
                    <div class="content_footer_left">
                        <div class="text_center"><img src="img/profile.png" alt="" width="16px" class="profile"></div>
                        <div class="text_center">User #1</div>
                    </div>
                    <div>시청자 50명</div>
                </div>
            </div>

            <div class="content_box">
                <div class="content_title">
                    <div class="hashTag">
                        <a href="#">#성평등</a>
                        <a href="#">#성평등</a>
                        <a href="#">#성평등</a>
                    </div>
                    <div>당신의 과거는 안녕하십니까?</div>
                </div>
                <div class="content_detail">
                    <div class="user_left"><img src="img/profile.png" alt="" class="profile"></div>
                    <div class="compare">
                        <div class="score">1-2</div>
                        <div class="process_bar">
                            <div class="process_left"></div>
                        </div>
                        <div class="time">
                            31:40
                        </div>
                    </div>
                    <div class="user_right"><img src="img/profile.png" alt="" class="profile"></div>
                </div>
                <div class="content_footer">
                    <div class="content_footer_left">
                        <div class="text_center"><img src="img/profile.png" alt="" width="16px" class="profile"></div>
                        <div class="text_center">User #1</div>
                    </div>
                    <div>시청자 50명</div>
                </div>
            </div>
            <div class="content_box">
                <div class="content_title">
                    <div class="hashTag">
                        <a href="#">#성평등</a>
                        <a href="#">#성평등</a>
                        <a href="#">#성평등</a>
                    </div>
                    <div>당신의 과거는 안녕하십니까?</div>
                </div>
                <div class="content_detail">
                    <div class="user_left"><img src="img/profile.png" alt="" class="profile"></div>
                    <div class="compare">
                        <div class="score">1-2</div>
                        <div class="process_bar">
                            <div class="process_left"></div>
                        </div>
                        <div class="time">
                            31:40
                        </div>
                    </div>
                    <div class="user_right"><img src="img/profile.png" alt="" class="profile"></div>
                </div>
                <div class="content_footer">
                    <div class="content_footer_left">
                        <div class="text_center"><img src="img/profile.png" alt="" width="16px" class="profile"></div>
                        <div class="text_center">User #1</div>
                    </div>
                    <div>시청자 50명</div>
                </div>
            </div>
            <div class="content_box">
                <div class="content_title">
                    <div class="hashTag">
                        <a href="#">#성평등</a>
                        <a href="#">#성평등</a>
                        <a href="#">#성평등</a>
                    </div>
                    <div>당신의 과거는 안녕하십니까?</div>
                </div>
                <div class="content_detail">
                    <div class="user_left"><img src="img/profile.png" alt="" class="profile"></div>
                    <div class="compare">
                        <div class="score">1-2</div>
                        <div class="process_bar">
                            <div class="process_left"></div>
                        </div>
                        <div class="time">
                            31:40
                        </div>
                    </div>
                    <div class="user_right"><img src="img/profile.png" alt="" class="profile"></div>
                </div>
                <div class="content_footer">
                    <div class="content_footer_left">
                        <div class="text_center"><img src="img/profile.png" alt="" width="16px" class="profile"></div>
                        <div class="text_center">User #1</div>
                    </div>
                    <div>시청자 50명</div>
                </div>
            </div>
            <div class="content_box">
                <div class="content_title">
                    <div class="hashTag">
                        <a href="#">#성평등</a>
                        <a href="#">#성평등</a>
                        <a href="#">#성평등</a>
                    </div>
                    <div>당신의 과거는 안녕하십니까?</div>
                </div>
                <div class="content_detail">
                    <div class="user_left"><img src="img/profile.png" alt="" class="profile"></div>
                    <div class="compare">
                        <div class="score">1-2</div>
                        <div class="process_bar">
                            <div class="process_left"></div>
                        </div>
                        <div class="time">
                            31:40
                        </div>
                    </div>
                    <div class="user_right"><img src="img/profile.png" alt="" class="profile"></div>
                </div>
                <div class="content_footer">
                    <div class="content_footer_left">
                        <div class="text_center"><img src="img/profile.png" alt="" width="16px" class="profile"></div>
                        <div class="text_center">User #1</div>
                    </div>
                    <div>시청자 50명</div>
                </div>
            </div>

        </div>
    </div>

    <div class="container">
        <div class="group_title">게임</div>
        <div class="group_box">
            <div class="content_box">
                <div class="content_title">
                    <div class="hashTag">
                        <a href="#">#성평등</a>
                        <a href="#">#성평등</a>
                        <a href="#">#성평등</a>
                    </div>
                    <div>당신의 과거는 안녕하십니까?</div>
                </div>
                <div class="content_detail">
                    <div class="user_left"><img src="img/profile.png" alt="" class="profile"></div>
                    <div class="compare">
                        <div class="score">1-2</div>
                        <div class="process_bar">
                            <div class="process_left"></div>
                        </div>
                        <div class="time">
                            31:40
                        </div>
                    </div>
                    <div class="user_right"><img src="img/profile.png" alt="" class="profile"></div>
                </div>
                <div class="content_footer">
                    <div class="content_footer_left">
                        <div class="text_center"><img src="img/profile.png" alt="" width="16px" class="profile"></div>
                        <div class="text_center">User #1</div>
                    </div>
                    <div>시청자 50명</div>
                </div>
            </div>

            <div class="content_box">
                <div class="content_title">
                    <div class="hashTag">
                        <a href="#">#성평등</a>
                        <a href="#">#성평등</a>
                        <a href="#">#성평등</a>
                    </div>
                    <div>당신의 과거는 안녕하십니까?</div>
                </div>
                <div class="content_detail">
                    <div class="user_left"><img src="img/profile.png" alt="" class="profile"></div>
                    <div class="compare">
                        <div class="score">1-2</div>
                        <div class="process_bar">
                            <div class="process_left"></div>
                        </div>
                        <div class="time">
                            31:40
                        </div>
                    </div>
                    <div class="user_right"><img src="img/profile.png" alt="" class="profile"></div>
                </div>
                <div class="content_footer">
                    <div class="content_footer_left">
                        <div class="text_center"><img src="img/profile.png" alt="" width="16px" class="profile"></div>
                        <div class="text_center">User #1</div>
                    </div>
                    <div>시청자 50명</div>
                </div>
            </div>

            <div class="content_box">
                <div class="content_title">
                    <div class="hashTag">
                        <a href="#">#성평등</a>
                        <a href="#">#성평등</a>
                        <a href="#">#성평등</a>
                    </div>
                    <div>당신의 과거는 안녕하십니까?</div>
                </div>
                <div class="content_detail">
                    <div class="user_left"><img src="img/profile.png" alt="" class="profile"></div>
                    <div class="compare">
                        <div class="score">1-2</div>
                        <div class="process_bar">
                            <div class="process_left"></div>
                        </div>
                        <div class="time">
                            31:40
                        </div>
                    </div>
                    <div class="user_right"><img src="img/profile.png" alt="" class="profile"></div>
                </div>
                <div class="content_footer">
                    <div class="content_footer_left">
                        <div class="text_center"><img src="img/profile.png" alt="" width="16px" class="profile"></div>
                        <div class="text_center">User #1</div>
                    </div>
                    <div>시청자 50명</div>
                </div>
            </div>

            <div class="content_box">
                <div class="content_title">
                    <div class="hashTag">
                        <a href="#">#성평등</a>
                        <a href="#">#성평등</a>
                        <a href="#">#성평등</a>
                    </div>
                    <div>당신의 과거는 안녕하십니까?</div>
                </div>
                <div class="content_detail">
                    <div class="user_left"><img src="img/profile.png" alt="" class="profile"></div>
                    <div class="compare">
                        <div class="score">1-2</div>
                        <div class="process_bar">
                            <div class="process_left"></div>
                        </div>
                        <div class="time">
                            31:40
                        </div>
                    </div>
                    <div class="user_right"><img src="img/profile.png" alt="" class="profile"></div>
                </div>
                <div class="content_footer">
                    <div class="content_footer_left">
                        <div class="text_center"><img src="img/profile.png" alt="" width="16px" class="profile"></div>
                        <div class="text_center">User #1</div>
                    </div>
                    <div>시청자 50명</div>
                </div>
            </div>

            <div class="content_box">
                <div class="content_title">
                    <div class="hashTag">
                        <a href="#">#성평등</a>
                        <a href="#">#성평등</a>
                        <a href="#">#성평등</a>
                    </div>
                    <div>당신의 과거는 안녕하십니까?</div>
                </div>
                <div class="content_detail">
                    <div class="user_left"><img src="img/profile.png" alt="" class="profile"></div>
                    <div class="compare">
                        <div class="score">1-2</div>
                        <div class="process_bar">
                            <div class="process_left"></div>
                        </div>
                        <div class="time">
                            31:40
                        </div>
                    </div>
                    <div class="user_right"><img src="img/profile.png" alt="" class="profile"></div>
                </div>
                <div class="content_footer">
                    <div class="content_footer_left">
                        <div class="text_center"><img src="img/profile.png" alt="" width="16px" class="profile"></div>
                        <div class="text_center">User #1</div>
                    </div>
                    <div>시청자 50명</div>
                </div>
            </div>
            <div class="content_box">
                <div class="content_title">
                    <div class="hashTag">
                        <a href="#">#성평등</a>
                        <a href="#">#성평등</a>
                        <a href="#">#성평등</a>
                    </div>
                    <div>당신의 과거는 안녕하십니까?</div>
                </div>
                <div class="content_detail">
                    <div class="user_left"><img src="img/profile.png" alt="" class="profile"></div>
                    <div class="compare">
                        <div class="score">1-2</div>
                        <div class="process_bar">
                            <div class="process_left"></div>
                        </div>
                        <div class="time">
                            31:40
                        </div>
                    </div>
                    <div class="user_right"><img src="img/profile.png" alt="" class="profile"></div>
                </div>
                <div class="content_footer">
                    <div class="content_footer_left">
                        <div class="text_center"><img src="img/profile.png" alt="" width="16px" class="profile"></div>
                        <div class="text_center">User #1</div>
                    </div>
                    <div>시청자 50명</div>
                </div>
            </div>
            <div class="content_box">
                <div class="content_title">
                    <div class="hashTag">
                        <a href="#">#성평등</a>
                        <a href="#">#성평등</a>
                        <a href="#">#성평등</a>
                    </div>
                    <div>당신의 과거는 안녕하십니까?</div>
                </div>
                <div class="content_detail">
                    <div class="user_left"><img src="img/profile.png" alt="" class="profile"></div>
                    <div class="compare">
                        <div class="score">1-2</div>
                        <div class="process_bar">
                            <div class="process_left"></div>
                        </div>
                        <div class="time">
                            31:40
                        </div>
                    </div>
                    <div class="user_right"><img src="img/profile.png" alt="" class="profile"></div>
                </div>
                <div class="content_footer">
                    <div class="content_footer_left">
                        <div class="text_center"><img src="img/profile.png" alt="" width="16px" class="profile"></div>
                        <div class="text_center">User #1</div>
                    </div>
                    <div>시청자 50명</div>
                </div>
            </div>
            <div class="content_box">
                <div class="content_title">
                    <div class="hashTag">
                        <a href="#">#성평등</a>
                        <a href="#">#성평등</a>
                        <a href="#">#성평등</a>
                    </div>
                    <div>당신의 과거는 안녕하십니까?</div>
                </div>
                <div class="content_detail">
                    <div class="user_left"><img src="img/profile.png" alt="" class="profile"></div>
                    <div class="compare">
                        <div class="score">1-2</div>
                        <div class="process_bar">
                            <div class="process_left"></div>
                        </div>
                        <div class="time">
                            31:40
                        </div>
                    </div>
                    <div class="user_right"><img src="img/profile.png" alt="" class="profile"></div>
                </div>
                <div class="content_footer">
                    <div class="content_footer_left">
                        <div class="text_center"><img src="img/profile.png" alt="" width="16px" class="profile"></div>
                        <div class="text_center">User #1</div>
                    </div>
                    <div>시청자 50명</div>
                </div>
            </div>

        </div>
    </div>


    <script>

    </script>
</section>




