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
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
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
			width: 32px;
			height: 32px;
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
		.nav_profile button {
			border-radius: 5px;
			margin: 0 10px;
			border-style: none;
			padding: 5px 20px;
			background-color: black;
			color:white;
		}

		/*dialog start */
		.mainbox h6 {
			margin: 0 0 4px 0;
			font-weight: normal;
		}

		.title {
			background-color: rgba(0, 0, 0, 0.1);
			border-radius: 4px;
			border-style: none;
			padding: 16px 8px;
		}
		.input {
			background-color: rgba(0, 0, 0, 0.1);
			border-radius: 4px;
			border-style: none;
		}

		.subject {
			margin-top: 16px;
		}
		/*dialog end*/


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
							<a href="/">DISCUSSION</a>
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
							<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
								방 생성
							</button>
							<a href="/profile">
								<c:choose>
									<c:when test="${principal.user.image == null}">
										<img src="${principal.user.image}" class="profile_img">
									</c:when>
									<c:otherwise>
										<img src="${pageContext.request.contextPath}/static/image/profile.png"
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
							<a class="" href="/logout">로그아웃</a>
							<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
								방 생성
							</button>
							<a href="/profile">
								<c:choose>
									<c:when test="${principal.user.image == null}">
										<img src="${principal.user.image}" class="profile_img">
									</c:when>
									<c:otherwise>
										<img src="${pageContext.request.contextPath}/static/image/profile.png"
											 class="profile_img">
									</c:otherwise>
								</c:choose>
							</a>
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

	<!-- Modal -->
	<div class="modal fade" id="exampleModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">토론방 생성하기</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<form id = "roomForm">
				<div class="modal-body">
						<h6>방제목</h6>

						<input class="title" type="text" name="name">

						<div class ="subject">
							<h6>토론 주제</h6>
							<select class="input form-select" name = "category">
								<option value = "청소년 연예인" selected = "selected">청소년 연예인</option>
								<option value = "백신 접종 의무화">백신 접종 의무화</option>
								<option value = "인공지능 개발">인공지능 개발</option>
								<option value = "착한 사마리아인법">착한 사마리아인법</option>
								<option value="사형제도">사형제도</option>
								<option value = "청소년 복장 규제">청소년 복장 규제</option>
								<option value = "남북통일">남북통일</option>
								<option value = "낙태죄 폐지">낙태죄 폐지</option>
								<option value = "동물 약물 실험">동물 약물 실험</option>
								<option value = "안락사">안락사</option>
								<option value = "동성결혼 합법화">동성결혼 합법화</option>
								<option value = "민식이법 개정">민식이법 개정</option>
								<option value = "게임중독의 질병분류">게임중독의 질병분류</option>
								<option value = "반려동물의 중성화">반려동물의 중성화</option>
							</select>
						</div>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
					<button type="submit" class="btn btn-primary">만들기</button>
				</div>
				</form>
			</div>
		</div>
	</div>

<script>
	$(document).ready(function() {

		$("#roomForm").submit(function() { // intercepts the submit event
			$.ajax({ // make an AJAX request
				type: "POST",
				url: "/api/room", //
				data: JSON.stringify($("#roomForm").serializeArray()), // serializes the form's elements
				success: function(data)
				{
					console.log(data)
				}
			});
			e.preventDefault(); // avoid to execute the actual submit of the form
		});

	});


</script>