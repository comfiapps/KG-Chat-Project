<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">

<%@ include file="../../component/backdrop/loading.jsp"%>

<script>const pageInfo = "login";</script>
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
				<h6>이메일로 간편 로그인</h6>

				<div>
					<label class="mdc-text-field mdc-text-field--filled mdc-text-field--no-label w-100" style="margin-bottom: 8px">
						<span class="mdc-text-field__ripple"></span>
						<input class="mdc-text-field__input" type="text" maxlength="30" placeholder="사용할 이메일 입력" aria-label="Label"
							   id="email" value="${principal.user.name}">
					</label>
				</div>

				<div>
					<button id="submit" class="mdc-button mdc-button--raised w-100" style="margin-bottom: 4px" disabled>
						<span class="mdc-button__label">로그인 요청</span>
					</button>
				</div>

				<br><div><sub>-또는-</sub></div><br>

				<a href="https://kauth.kakao.com/oauth/authorize?client_id=2e63b44fb79b64b533648b862668b579&redirect_uri=${baseUrl}/auth/kakao/callback&response_type=code">
					<img src="${pageContext.request.contextPath}/image/kakao_login_medium_wide.png" alt="Kakao Login"/>
				</a>
			</div>

			<button class="mdc-button w-100" style="margin-top: 8px" onclick="location.href='/register'">
				<span class="mdc-button__ripple"></span>
				<span class="mdc-button__label">아직 계정이 없습니다. 회원가입하기</span>
			</button>

<%--			<div style="margin-top: 56px"><input placeholder="테스트 이름 입력(등록)" id="test_register"> &lt;%&ndash; TODO test login&ndash;%&gt;</div>--%>
<%--			<div style="margin-top: 8px"><input placeholder="DB 기준 아이디 입력" id="test_login"> &lt;%&ndash; TODO test login&ndash;%&gt;</div>--%>
		</span>

	</div>

</div>

<%-- TODO test login--%>
<%--<script>
	$("#test_login").on("keyup", (event) => {
		if (event.key === "Enter") location.href = "${baseUrl}/auth/test/callback/" + $("#test_login").val();
	});
	$("#test_register").on("keyup", (event) => {
		if (event.key === "Enter") location.href = "${baseUrl}/auth/test/register/" + $("#test_register").val();
	});
</script>--%>

<script src="${pageContext.request.contextPath}/js/login.js"></script>
<script src="${pageContext.request.contextPath}/js/code.js"></script>

<%@ include file="../layout/footer.jsp"%>