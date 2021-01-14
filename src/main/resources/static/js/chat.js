let chat = {
    init: function() {
        this.connect(channel);

        $("#visitor_msg_input").on("keyup", (event) => {
            if (event.key === "Enter") {
                let data = event.target.value;
                event.target.value = "";
                // console.log("전송할 데이터: ", data);
                this.send(data);
            }
        });

        $("#discusser_msg_input").on("keyup", (event) => {
            if(event.key === "Enter"){
                let data = event.target.value;
                event.target.value = "";
                // console.log("전송할 데이터: ", data);
                this.send(channel, data);
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
                msgObj.contributor(msg);
            });
        });
    },

    send: function (channel, result) {
        let data = {
            'chatRoomId': channel,
            'sender': user,
            'receiver': "all",
            'message': result
        };

        console.log("전송시도");
        console.log(data);
        stompClient.send("/app/chat", {}, JSON.stringify(data));

        $("#discusser_msg_input").val("");
    },
}

let msgObj = {
    contributor: function (msg) {
        console.log("msg", msg);
        console.log("user: ", user);

        let divs = document.createElement("div");
        divs.setAttribute('class', "discusser_box");

        let html = "";

        if(user !== msg.receiver){
            html+= '    <div class="discusser_left">';
            html+= '        <div>';
            html+= '            <img src="/image/profile.png" alt="" class="profile">';
            html+= '        </div>';
            html+= '        <p>'+msg.message+'</p>';
            html+= '    </div>';

        } else {
            html+= '    <div class="discusser_right">';
            html+= '        <p>'+msg.message+'</p>';
            html+= '        <div>';
            html+= '            <img src="/image/profile.png" alt="" class="profile">';
            html+= '        </div>';
            html+= '    </div>';
        }

        divs.innerHTML = html;

        console.log("divs: ", divs);

        $(".discusser_area").append(divs);
    }
}

chat.init();

