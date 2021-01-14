<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

<style>

	.loginPage {
		background-color: #F7F7F7;
		width: 100%;
		height: 100%;
		padding-top: 330px;

	}

	.discussion {
		background-color: #F7F7F7;

		margin: 0;

	}
	.discussion h1 {
		font-size: 50px	;
		font-weight: bold;
		margin-left: 20px;
		width: 300px;
	}
	.discussion h2 {
		font-size: 20px;
		font-weight: bold;
	}
	.kakaoLogin {
		text-align: center;
		width: 500px;
		height: 180px;
		float: left;
		background-color: white;
		border-radius: 10px;
		margin-left: 20px;
		margin-right: 20px;

	}
	.kakaoLogin div{
		text-align: center;
		margin-top: 40px;
		margin-bottom: 20px;


	}
	.kakaoLogin img {

	}
	.line {
		margin: 0 auto;
		width: fit-content;
		display: flex;
		align-items: center;
		height: 30%;
	}
	@media(max-width : 881px) {
		.line {
			flex-wrap: wrap;
			width: 500px;
			justify-content: center;
		}
	}





</style>

	<section class="loginPage">
		<div class ="line">
			<div class ="discussion">
				<h1>DISCUSSION</h1>
				<h2>Discussion을 통해 수많은 사람들과</h2>
				<h2>여러 주제로 토론해보고 시청해보세요</h2>

			</div>


			<div class="kakaoLogin">
				<div>DISCUSSION에 로그인</div>
				<a href="https://kauth.kakao.com/oauth/authorize?client_id=2e63b44fb79b64b533648b862668b579&redirect_uri=http://localhost:5000/auth/kakao/callback&response_type=code">
					<img src="${pageContext.request.contextPath}/image/kakao_login_medium_wide.png" alt="Kakao Login"/>
				</a>
			</div>
		</div>
	</section>

<%@ include file="../layout/footer.jsp"%>