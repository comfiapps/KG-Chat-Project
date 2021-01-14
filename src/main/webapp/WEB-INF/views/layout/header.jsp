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
							<input type="text">
							<a href=""><img src="${pageContext.request.contextPath}/image/pngwing.com.png" alt="" width="16px"></a>
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
							<input type="text">
							<a href=""><img src="${pageContext.request.contextPath}/image/pngwing.com.png" alt="" width="16px"></a>
						</div>
					</div>
				</div>
			</div>
		</header>
	</c:if>


	<!-- Modal -->
	<div class="modal fade2" id="createModal">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header border-bottom-0">
					<h5 class="modal-title">토론방 생성하기</h5>
				</div>
				<div class="modal-body">
					<label class="mdc-text-field mdc-text-field--filled mdc-text-field--no-label w-100">
						<span class="mdc-text-field__ripple"></span>
						<input class="mdc-text-field__input" type="text" placeholder="방 제목" aria-label="Label"
							   id="createRoom_name">
						<span class="mdc-line-ripple"></span>
					</label>

					<div class ="subject">
						<h6>토론 주제</h6>
						<select class="input form-select no-outline" id="createRoom_category">
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

				<div class="modal-footer border-top-0">

					<button id="createRoomClose" class="mdc-button no-outline" data-dismiss="modal"/>
						<span class="mdc-button__ripple"></span>
						<span class="mdc-button__label">취소</span>
					</button>
					<button id="createRoomBtn" class="mdc-button mdc-button--raised no-outline">
						<span class="mdc-button__label">확인</span>
					</button>
				</div>
			</div>
		</div>
	</div>

	<script src="${pageContext.request.contextPath}/js/room.js"></script>