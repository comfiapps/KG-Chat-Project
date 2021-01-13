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
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
		  integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
	<style>

		* {
			margin: 0px;
			padding: 0px;
			box-sizing: border-box;
		}

		body,
		html {
			font-family: 'Noto Sans KR', sans-serif;
			width: 100%;
			height: 100%;
			min-width: 320px;
		}

		img {
			/* 이미지가 반응형으로 넣다보면 일그러질 확률이 높음 */
			/* 길이는 100% 높이는 길이에 맞춰서 하도록 설정 */
			max-width: 100%;
			height: auto;
			/* 사이즈가 변하면 높이는 넓이에 따라서 변경 */
		}

		input,
		textarea,
		button,
		select {
			/*
            고유하게 적용되어 있는 form관련 요소들을 제거하여
            여러 브라우저에서 동일한 form관련 디자인이 보여지도록 처리
            */
			-webkit-appearance: none;
			-moz-appearance: none;
			-o-appearance: none;
			-ms-appearance: none;
			appearance: none;
		}

		ul,
		li,
		ol,
		dl {
			list-style-type: none;
		}

		.profile_img{
			border-radius: 100%;
		}

		.web{
			height: 56px;
			display: grid;
			grid-template-columns: 25% 50% 25%;
			grid-template-rows: 56px;
			justify-items: center;
			align-items: center;
			background: #F7F7F7 0% 0% no-repeat padding-box;
		}

		.phone{
			height: 112px;
			display: grid;
			grid-template-columns: 50% 50%;
			grid-template-rows: 1fr 1fr;
			justify-items: center;
			align-items: center;
			background: #F7F7F7 0% 0% no-repeat padding-box;

		}

		.nav_content a{
			text-decoration: none;
			color: black;
		}

		.nav_content .nav_logo{
			font: normal normal normal 24px/32px Segoe UI;
			justify-self: start;
		}
		.nav_content .nav_logo div{
			margin-left: 30px;
		}

		.nav_content .nav_search{
			width: 100%;
			height: 60%;
		}

		.nav_content .nav_search input{
			background: #E5E5E5 0% 0% no-repeat padding-box;
			border: 0;
			border-radius: 4px;

			width: 100%;
			height: 100%;
		}

		.nav_search div{
			position: relative;
			width: 50%;
			height: 100%;
			text-align: center;;
			margin: 0 auto;
		}

		.nav_search div a{
			position: absolute;
			right: 3%;
			top : 2px;
		}

		.nav_content .nav_profile{
			justify-self: end;
		}
		.nav_content .nav_profile div{
			margin-right: 30px;

		}

		@media(min-width: 1281px){
			.web{
				display: grid;
			}
			.phone{
				display: none;
			}
		}

		@media(min-width: 768px) and (max-width: 1280px){
			.web{
				display: grid;
			}
			.phone{
				display: none;
			}
			.nav_content .nav_search div{
				width:80%
			}
		}

		@media(max-width: 767px){
			.web{
				display: none;
			}
			.phone{
				display: grid;
			}
			.nav_content .nav_search div{
				width:80%
			}
			.phone div:nth-child(3){
				grid-column: 1/3;
			}
		}

	</style>
</head>
<body>
	<c:if test="${principal.user != null}">
		<header>
			<div class="nav_content">
				<div class="web">
					<div class="nav_logo">
						<div>
							<a href="#">DISCUSSION</a>
						</div>
					</div>
					<div class="nav_search">
						<div>
							<input type="text">
							<a href=""><img src="${pageContext.request.contextPath}/static/image/pngwing.com.png" alt="" width="16px"></a>
						</div>
					</div>
					<div class="nav_profile">
						<div>
							<a class="" href="/logout">로그아웃</a>
							<a><img src="${principal.user.image}" alt="" class="profile_img"></a>
						</div>
					</div>
				</div>

				<div class="phone">
					<div class="nav_logo">
						<div>
							<a href="#">DISCUSSION</a>
						</div>
					</div>
					<div class="nav_profile">
						<div>
							<a class="" href="/logout">로그아웃</a>
							<a><img src="${principal.user.image}" alt="" class="profile_img"></a>
						</div>

					</div>
					<div class="nav_search">
						<div>
							<input type="text">
							<a href=""><img src="${pageContext.request.contextPath}/static/image/pngwing.com.png" alt="" width="16px"></a>
						</div>
					</div>
				</div>
			</div>

		</header>
	</c:if>