let chat = {
    init: function() {
        this.connect(channel);

        $("#sendMsg").on("click", () => {
            this.send(channel);
        });

        $("#visitor_msg_input").on("keyup", (event) => {
            if (event.key === "Enter") {
                let data = event.target.value;
                event.target.value = "";
                console.log("전송할 데이터: ", data);
                this.send(data);
            }
        });

        $("#discusser_msg_input").on("keyup", (event) => {
            if(event.key === "Enter"){
                let data = event.target.value;
                event.target.value = "";
                console.log("전송할 데이터: ", data);
                this.send(data);
            }
        });
    },

    connect: function (destination) {
        console.log("destination: ",destination);

        socket = new SockJS("/chat");
        stompClient = Stomp.over(socket);

        stompClient.connect({}, function() {
            stompClient.subscribe('/topic/' + destination, function (e) {
                const msg = JSON.parse(e.body);
                console.log("test: ",msg);
                msg.contributor(msg);
            });
        });
    },

    send: function (result) {
        let data = {
            'chatRoomId': result,
            'sender': user,
            'receiver': "all",
            'message': $("#message").val()
        };

        console.log("전송시도");
        console.log(data);
        stompClient.send("/app/chat", {}, JSON.stringify(data));

        $("#message").val("");
    },
}

let msg = {
    contributor: function (msg) {
        console.log(msg)
        let divs = document.createElement("div");
        divs.setAttribute('class', "content");

        let html = "";

        html+= '<div class = "content">';
        html+= '	<div class = "'+(user != msg.receiver?"left":"right")+'">';
        html+= '		<div><small>'+msg.receiver+'</small></div>';
        html+= '		<div>'+msg.message+'</div>';
        html+= '	</div>';
        html+= '</div>';

        divs.innerHTML = html;

        $("#textBox").append(divs);
    }
}

chat.init();

