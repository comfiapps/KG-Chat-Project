<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="layout/header.jsp"%>
<script src="${pageContext.request.contextPath}/js/sockjs.js"></script>
<script src="${pageContext.request.contextPath}/js/stomp.js"></script>


<style type="text/css">
	
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
		
	<div>채팅 보는 사람~</div>
	
	<div id = "textBox">
		
	</div>

	<script type="text/javascript">
		
		var socket;
		var stompClient;
		var user;
		
		connect("chat1")
		
		function connect(destination){
			console.log("destination: ",destination);
			
			socket = new SockJS("/stomp/chat");
			stompClient = Stomp.over(socket);
			
			stompClient.connect({}, function() {
				stompClient.subscribe('/topic/' + destination, function (data) {
					
					var msg = JSON.parse(data.body);
					
					console.log("test: ",msg);
					showMsg(msg);
					
		        });
			});
		}
		
		function showMsg(msg){
			
			var divs = document.createElement("div");
			divs.setAttribute('class', "content");
			
			console.log(user);
			
			if(typeof user === 'undefined'){
				console.log("진입?")
				user = msg.receiver;
				console.log(user);
			}
			
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
		
		
	
	
	
	</script>

<%@ include file="layout/footer.jsp"%>