<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

<div class="container">
	<a href="https://kauth.kakao.com/oauth/authorize?client_id=2e63b44fb79b64b533648b862668b579&redirect_uri=http://localhost:5000/auth/kakao/callback&response_type=code">
		<img src="${pageContext.request.contextPath}/resources/image/kakao_login_medium_wide.png" alt="Kakao Login"/>
	</a>
</div>

<%@ include file="../layout/footer.jsp"%>