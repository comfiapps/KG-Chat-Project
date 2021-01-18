<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

<style>
	body {
		overflow: hidden;
		background-color: #F7F7F7;
	}

	.loginPage {
		height: 100vh;
	}

	.line {
		margin: 0 auto;
		width: fit-content;
		height: 100%;
		display: flex;
		align-items: center;
	}

	.discussion h1 {
		font-size: 50px;
	}

	.discussion h2 {
		font-size: 16px;
	}

	.kakaoLogin {
		margin: 0 0 0 108px;
		text-align: center;
		padding: 32px;
		float: left;
		background-color: white;
		border-radius: 16px;
	}

	.kakaoLogin h6{
		margin-bottom: 16px;
		font-weight: bold;
	}

	@media(max-width : 881px) {
		.line {
			flex-wrap: wrap;
			width: 500px;
			justify-content: center;
		}

		.kakaoLogin {
			margin: 32px 0;
			align-self: start;
		}

		.discussion {
			text-align: center;
			align-self: flex-end;
		}
	}

</style>

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
			<input placeholder="테스트 이름 입력" id="test_register"> <%-- TODO test login--%>
			<input placeholder="테스트 목적 - DB 기준 아이디 (long) 입력" id="test_login"> <%-- TODO test login--%>
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