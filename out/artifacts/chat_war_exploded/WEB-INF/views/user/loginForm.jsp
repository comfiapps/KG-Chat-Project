<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">

<div class="loginPage">

	<div class ="line">
		<div class ="discussion">
			<h1>DISCUSSION</h1>
			<h2>Discussion 을 통해 수많은 사람들과</h2>
			<h2>여러 주제로 토론하고 시청하세요!</h2>
		</div>

		<div class="kakaoLogin">
			<h6>시작하기</h6>
			<a href="https://kauth.kakao.com/oauth/authorize?client_id=2e63b44fb79b64b533648b862668b579&redirect_uri=${baseUrl}/auth/kakao/callback&response_type=code">
				<img src="${pageContext.request.contextPath}/image/kakao_login_medium_wide.png" alt="Kakao Login"/>
			</a>

			<div style="margin-top: 56px"><input placeholder="테스트 이름 입력(등록)" id="test_register"> <%-- TODO test login--%></div>
			<div style="margin-top: 8px"><input placeholder="DB 기준 아이디 입력" id="test_login"> <%-- TODO test login--%></div>
		</div>

	</div>

</div>


<%-- TODO test login--%>
<script>
	$("#test_login").on("keyup", (event) => {
		if (event.key === "Enter") location.href = "${baseUrl}/auth/test/callback/" + $("#test_login").val();
	});
	$("#test_register").on("keyup", (event) => {
		if (event.key === "Enter") location.href = "${baseUrl}/auth/test/register/" + $("#test_register").val();
	});
</script>

<%@ include file="../layout/footer.jsp"%>