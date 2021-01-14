<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="layout/header.jsp"%>

	<style type="text/css">
		.center{
			width:50%;
			margin: 0 auto;
			margin-top: 50px;
			text-align: center;
		}

		#textBox{
			width: 50%;
			heigth: 80%;
			margin: 50px auto;
			border: 1px solid black;
			overflow: auto;
		}
		.content{
			overflow: hidden;
			width: 100%;
		}

		.left{
			float: left;
			text-align: left;
		}

		.right{
			float: right;
			text-align: right;
		}

	</style>
</head>

<body>
	<br>
	<br>
	<br>

	<div id = "textBox"></div>
		
	<div class= "center">
		<input type="text" id="message">
		<button type="button" id="sendMsg">전송</button>
	</div>

	<script>
		let channel = ${sessionScope.chatId};
		let socket;
		let stompClient;
		let user = "dfdfdf";
	</script>

	<script src="${pageContext.request.contextPath}/js/sockjs.js"></script>
	<script src="${pageContext.request.contextPath}/js/stomp.js"></script>
	<script src="${pageContext.request.contextPath}/js/chat.js"></script>

<%@ include file="layout/footer.jsp"%>