<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/>
</sec:authorize>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Discussion</title>
	<meta charset="utf-8">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css"
		  integrity="sha384-r4NyP46KrjDleawBgD5tp8Y7UzmLA05oM1iAEQ17CSuDqnUK2+k9luXQOfXJCJ4I"
		  crossorigin="anonymous" />
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
			integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
			crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/js/bootstrap.min.js"
			integrity="sha384-oesi62hOLfzrys4LxRF63OJCXdXDipiYWBnvTl9Y9/TRlw5xlKIEHpNyvvDShgf/"
			crossorigin="anonymous"></script>

	<link href="https://unpkg.com/material-components-web@latest/dist/material-components-web.min.css" rel="stylesheet">
	<script src="https://unpkg.com/material-components-web@latest/dist/material-components-web.min.js"></script>
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">

	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/css.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/profile.css">
</head>
<body>
	<c:if test="${principal.user != null}">
		<header>
			<div class="nav_content">
				<div class="web nav_content_inner">
					<div class="nav_logo">
						<a href="/">DISCUSSION</a>
					</div>
					<div class="nav_search">
						<input placeholder="토론방 통합 검색 - 제목, 주제, 참여자" class="searchInput" type="text" id="desktopSearchInput" value="${keyword}">
						<span class="material-icons md-16 searchBtn" style="cursor: pointer;">search</span>
					</div>
					<div class="nav_profile">
						<div>
							<button class="mdc-button mdc-button--raised no-outline" data-toggle="modal" data-target="#createModal">
								<span class="mdc-button__label">방 생성</span>
							</button>
							<span class="popover-btn">
								<c:choose>
									<c:when test="${principal.user.image != null}">
										<img src="${principal.user.image}" alt="profile" class="profile_img">
									</c:when>
									<c:otherwise>
										<img src="${pageContext.request.contextPath}/image/user.png"
											 alt="profile"
											 class="profile_img">
									</c:otherwise>
								</c:choose>
							</span>
						</div>
					</div>

				</div>

				<div class="phone nav_content_inner">
					<div class="nav_logo">
						<div>
							<a href="/">DISCUSSION</a>
						</div>
					</div>
					<div class="nav_profile">
						<div>
							<button class="mdc-button mdc-button--raised no-outline" data-toggle="modal" data-target="#createModal">
								<span class="mdc-button__label">방 생성</span>
							</button>
							<span class="popover-btn">
								<c:choose>
									<c:when test="${principal.user.image != null}">
										<img src="${principal.user.image}" alt="profile" class="profile_img">
									</c:when>
									<c:otherwise>
										<img src="${pageContext.request.contextPath}/image/user.png"
											 alt="profile"
											 class="profile_img">
									</c:otherwise>
								</c:choose>
							</span>
						</div>
					</div>

					<div class="nav_search">
						<input placeholder="토론방 통합 검색 - 제목, 주제, 참여자" class="searchInput" type="text" id="mobileSearchInput" value="${keyword}">
						<span class="material-icons md-16 searchBtn" style="cursor: pointer">search</span>
					</div>
				</div>
			</div>

			<div class="profile-popover">
				<c:choose>
					<c:when test="${principal.user.image != null}">
						<img src="${principal.user.image}" alt="profile"
							 onclick="location.href = '/profile'"
							 class="profile popover-img">
					</c:when>
					<c:otherwise>
						<img src="${pageContext.request.contextPath}/image/user.png" alt="profile"
							 onclick="location.href = '/profile'"
							 class="profile popover-img">
					</c:otherwise>
				</c:choose>

				<div class="popover-content">
					<p>${principal.user.name}</p>
					<div><sub>${principal.user.email}</sub></div>

					<button class="mdc-button w-100 mdc-button--outlined" onclick="location.href = '/profile'"
							style="text-align: center">
						<span class="mdc-button__ripple"></span>
						<span class="mdc-button__label">프로필 정보 수정하기</span>
					</button>
				</div>

				<div class="divider w-100"></div>

				<button class="mdc-button w-100" onclick="location.href = '/logout'">
					<span class="mdc-button__ripple"></span>
					<span class="mdc-button__label">로그아웃</span>
				</button>
			</div>
		</header>
	</c:if>

	<%@ include file="../../component/dialog/createRoom.jsp"%>

	<script>let searchKeyword = "";</script>
	<script src="${pageContext.request.contextPath}/js/profile_popover.js"></script>
	<script src="${pageContext.request.contextPath}/js/room.js"></script>