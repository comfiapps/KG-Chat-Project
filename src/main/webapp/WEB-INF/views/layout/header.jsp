<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal" var="principal"/>
</sec:authorize>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Discussion</title>
	<meta charset="utf-8">
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

</head>
<body>
	<c:if test="${principal.user != null}">
		<header>
			<div class="nav_content">
				<div class="web">
					<div class="nav_logo">
						<div>
							<a href="/">DISCUSSION</a>
						</div>
					</div>
					<div class="nav_search">
						<div>
							<input placeholder="토론방 검색하기" class="searchInput" type="text" id="desktopSearchInput" value="${keyword}">
							<img class="searchBtn" src="${pageContext.request.contextPath}/image/baseline_search_black_48dp.png" alt="search">
						</div>
					</div>
					<div class="nav_profile">
						<div>
							<button class="mdc-button no" onclick="location.href = '/logout'"/>
								<span class="mdc-button__ripple"></span>
								<span class="mdc-button__label">로그아웃</span>
							</button>
							<button class="mdc-button mdc-button--raised no-outline" data-toggle="modal" data-target="#createModal">
								<span class="mdc-button__label">방 생성</span>
							</button>
							</button>
							<a href="/profile">
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
							</a>

						</div>
					</div>

				</div>

				<div class="phone">
					<div class="nav_logo">
						<div>
							<a href="/">DISCUSSION</a>
						</div>
					</div>
					<div class="nav_profile">
						<div>
							<button class="mdc-button no-outline" onclick="location.href = '/logout'"/>
								<span class="mdc-button__ripple"></span>
								<span class="mdc-button__label">로그아웃</span>
							</button>
							<button class="mdc-button mdc-button--raised no-outline" data-toggle="modal" data-target="#createModal">
								<span class="mdc-button__label">방 생성</span>
							</button>
							<a href="/profile">
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
							</a>
						</div>
					</div>

					<div class="nav_search">
						<div>
							<input placeholder="토론방 검색하기" class="searchInput" type="text" id="mobileSearchInput" value="${keyword}">
							<img class="searchBtn" src="${pageContext.request.contextPath}/image/baseline_search_black_48dp.png" alt="search">
						</div>
					</div>
				</div>
			</div>
		</header>
	</c:if>

	<%@ include file="../../component/dialog/createRoom.jsp"%>

	<script>let searchKeyword = "";</script>
	<script src="${pageContext.request.contextPath}/js/room.js"></script>