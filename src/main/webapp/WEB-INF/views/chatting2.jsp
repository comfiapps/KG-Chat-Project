<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="layout/header.jsp"%>

<script src="${pageContext.request.contextPath}/js/sockjs.js"></script>

<script src="${pageContext.request.contextPath}/js/stomp.js"></script>

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
	
	<div id="ee">채팅방</div>
	
	<input type="text" id="user" placeholder="사용할 아이디 입력">
	<button type="button" id="connect">방 연결</button>
	
	<br>
	
	<div class = "center">채팅 구현 부분</div>
	<div id = "textBox">
		<div class = "content">
			<div class = "left">
				<div><small>user명</small></div>
				<div>content.......</div>
			</div>
		</div>
		
		<div class = "content">
			<div class = "right">
				<div><small>user2명</small></div>
				<div>content.......2</div>
			</div>
		</div>
	</div>
		
	<div class= "center">
		<input type="text" id="message" >
		<button type="button" id="send">전송</button>	
	</div>
	
		
	<script type="text/javascript">
		
		var socket;
		var stompClient;
		var user;

		$("#connect").click(
			function(){
			connect(${sessionScope.chatId});
			user = $("#user").val();
			$("#send").click(send(${sessionScope.chatId}));
		});

		
		function connect(destination){
			console.log("destination: ",destination);
			
			socket = new SockJS("/chat");
			stompClient = Stomp.over(socket);
			
			stompClient.connect({}, function() {
				stompClient.subscribe('/topic/' + destination, function (e) {
					
					var msg = JSON.parse(e.body);
					
					console.log("test: ",msg);
					showMsg(msg);
					
		        });
			});
		}
		
		function showMsg(msg){
			
			var divs = document.createElement("div");
			divs.setAttribute('class', "content");
			
			var html = "";
			
			html+= '<div class = "content">';
			html+= '	<div class = "'+(user != msg.receiver?"left":"right")+'">';
			html+= '		<div><small>'+msg.receiver+'</small></div>';
			html+= '		<div>'+msg.message+'</div>';
			html+= '	</div>';
			html+= '</div>';
			
			divs.innerHTML = html;		
			
			$("#textBox").append(divs);
			
		}
		
		function send(result){
			var trans = function(){
				
				data = {'chatRoomId': result, 
						'sender' 	: user, 
						'receiver'	: "all",
						'message'	: $("#message").val()};
				
				console.log("전송시도");
				console.log(data);
				stompClient.send("/app/chat", {}, JSON.stringify(data));
				
				$("#message").val("");
			}
		
			return trans;
		}
		
		
		
		
	</script>


<%@ include file="layout/footer.jsp"%>