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
										<img src="${pageContext.request.contextPath}/image/profile.png"
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
										<img src="${pageContext.request.contextPath}/image/profile.png"
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
	<div class="modal fade" id="exampleModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">토론방 생성하기</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">×</span>
					</button>
				</div>
				<div class="modal-body">
						<h6>방제목</h6>
						<input class="input" type="text" name="title" >

						<div class ="subject">
							<h6>토론 주제</h6>
							<select class="input form-select">
								<option>청소년 연예인</option>
								<option>백신 접종 의무화</option>
								<option>인공지능 개발</option>
								<option>착한 사마리아인법</option>
								<option>사형제도</option>
								<option>청소년 복장 규제</option>
								<option>남북통일</option>
								<option>낙태죄 폐지</option>
								<option>동물 약물 실험</option>
								<option>안락사</option>
								<option>동성결혼 합법화</option>
								<option>민식이법 개정</option>
								<option>게임중독의 질병분류</option>
								<option>반려동물의 중성화</option>
							</select>
						</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary">만들기</button>
				</div>
			</div>
		</div>
	</div>