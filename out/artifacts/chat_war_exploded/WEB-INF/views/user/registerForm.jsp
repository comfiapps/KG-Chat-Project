<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">

<%@ include file="../../component/backdrop/loading.jsp"%>

<script>const pageInfo = "register";</script>
<%@ include file="../../component/backdrop/code.jsp"%>

<div class="loginPage">

	<div class ="line">
		<div class ="discussion">
			<h1>DISCUSSION</h1>
			<h2>Discussion 을 통해 수많은 사람들과</h2>
			<h2>여러 주제로 토론하고 시청하세요!</h2>
		</div>

		<span class="form">
			<div class="kakaoLogin">
				<h6>회원가입</h6>

				<div style="margin-bottom: 8px">
					<label class="mdc-text-field mdc-text-field--filled mdc-text-field--no-label w-100">
						<span class="mdc-text-field__ripple"></span>
						<input class="mdc-text-field__input" type="text" maxlength="30" placeholder="닉네임" aria-label="Label"
							   id="name">
					</label>
				</div>
				<div style="margin-bottom: 8px">
					<label class="mdc-text-field mdc-text-field--filled mdc-text-field--no-label w-100">
						<span class="mdc-text-field__ripple"></span>
						<input class="mdc-text-field__input" type="text" placeholder="가입할 이메일" aria-label="Label"
							   id="email">
					</label>
				</div>

				<div>
					<button id="submit" class="mdc-button mdc-button--raised w-100" style="margin-bottom: 4px" disabled>
						<span class="mdc-button__label">회원가입</span>
					</button>
				</div>

				<br><div><sub>-또는-</sub></div><br>

				<a href="https://kauth.kakao.com/oauth/authorize?client_id=2e63b44fb79b64b533648b862668b579&redirect_uri=${baseUrl}/auth/kakao/callback&response_type=code">
					<img src="${pageContext.request.contextPath}/image/kakao_login_medium_wide.png" alt="Kakao Login"/>
				</a>
			</div>

			<button class="mdc-button w-100" style="margin-top: 8px" onclick="location.href='/login'">
				<span class="mdc-button__ripple"></span>
				<span class="mdc-button__label">이미 계정이 있습니다. 로그인하기</span>
			</button>
		</span>

	</div>
</div>


<script src="${pageContext.request.contextPath}/js/register.js"></script>
<script src="${pageContext.request.contextPath}/js/code.js"></script>

<%@ include file="../layout/footer.jsp"%>