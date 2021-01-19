<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

<style>
    html{
        font-size:10px;
    }

    .chatting div{
        width: 100%;
        height: 100%;
        /* border: 1px solid black; */
        box-sizing: border-box;
        /* border-spacing: 0; */
    }
    .chatting .score_container{
        /* border-bottom: 1px solid rgb(34, 27, 27); */
    }

    .chatting .discusser_chat_container, .chatting .watcher_chat_container {
        border: 1px solid  rgb(202, 202, 202);
        /* border-top: 1px solid rgb(214, 209, 209);
        border-bottom: 1px solid rgb(214, 209, 209); */
    }
    .chatting{
        width: 100%;
        height: 100%;

    }
    .chatting .chat_container{
        display: flex;
        position: relative;
        min-height: 72rem;

    }
    .chatting .discusser_container{
        width: 70%;
    }
    .chatting .watcher_container{
        width: 30%;
        min-width: 320px;
    }

    .chatting .discusser_container, .chatting .watcher_container{
        padding: 1.5rem 2rem;
        display: flex;
        flex-flow: column nowrap;
    }

    /* 토론자 부분 */
    .chatting .score_container, .chatting .watcher_vote{
        height: 18%;
        min-height: 12rem;
    }
    .chatting .discusser_chat_container{
        height: 67%;
    }
    .chatting .discusser_send_container{
        height: 15%;
    }

    /* 점수 영역 */
    .chatting .score_container{
        display: flex;
        align-items: center;
        padding: 0 10%;
    }
    .chatting .score_box{
        /* height: 60%; */
        padding: 1rem 0;
        height: fit-content;
    }
    .chatting .score_content{
        height: 100%;
        display: flex;
        padding: 1rem 0;
        flex-flow: row nowrap;
        align-items: center;
    }
    .chatting .score_bar{
        height: 2rem;
        display: flex;
        align-items: center;
    }
    .chatting .score_bar_right{
        width: 80%;
        height: 60%;
        margin: 0 auto;
        background: #70A9FF 0% 0% no-repeat padding-box;
        border-radius: 10px;
    }
    .chatting .score_bar_left{
        width: 50%;
        background: #FF8D8D 0% 0% no-repeat padding-box;
        border-radius: 10px 0px  0px 10px;
    }
    .chatting .result{
        font-size: 4.2rem;
    }
    .chatting .time{
        font-size: 2rem;
    }
    .chatting .score_content img{
        border-radius: 100%;
    }
    .chatting .score_content div{
        flex-flow: column wrap;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    .chatting .user div:nth-child(1), .chatting .result div:nth-child(1){
        height: 70%;
    }
    .chatting .user div:nth-child(2), .chatting .result div:nth-child(2){
        height: 30%;
        font-size: 1.8rem;
    }


    /* 임시로 윤곽선 지움 */
    .chatting .score_box *{
        border: none;
    }

    /* 보내기 영역 */
    .chatting .discusser_send_container, .chatting .watcher_send_container{
        padding: 1rem 0rem;
        min-height: 10rem;
    }
    .chatting .send_box{
        /* width: 90%;
        margin: 2rem auto; */
        height: 50%;
    }
    .chatting .send_box input{
        width: 100%;
        height: 100%;
        border: 1px solid rgb(185, 185, 185);
        border-radius: 25px;
        text-indent: 1.5rem;
        background: #E5E5E5 0% 0% no-repeat padding-box;
    }
    .chatting .send_box input:hover{
        border: 2px solid rgb(78, 105, 136);
        border-radius: 25px;
    }
    .chatting .send_box input:focus{
        border: 2px solid rgb(78, 105, 136);
        border-radius: 25px;
        outline: 0;
    }

    /* 채팅 공통 영역 */
    .chatting .chat_box{
        overflow: auto;
        -ms-overflow-style: none; /* IE and Edge */
        scrollbar-width: none; /* Firefox */
    }
    .chatting .chat_box::-webkit-scrollbar {
        display: none; /* Chrome, Safari, Opera*/
    }
    .chatting .discusser_send_container, .chatting .watcher_send_container{
        display: flex;
        align-items: center;
    }

    /* 시청자 채팅 영역 */
    .chatting .watcher_vote{
        height: 18%;
    }
    .chatting .watcher_chat_container{
        height: 67%;
        padding: 0.5rem 2rem;
    }
    .chatting .watcher_send_container{
        height: 15%;
    }
    .chatting .watcher_message_box{
        height: fit-content;
        margin-bottom: 1.2rem;
    }
    .chatting .watcher_content{
        font-size: 1.5rem;
    }
    .chatting .watcher_user_area{
        font-size: 1.3rem;
        margin-bottom: 0.3rem;
        color: #AFAFAF;
    }
    .chatting .watcher_container{
        background-color: #faf1f1;
    }

    /* 토론자 채팅 영역 */
    .chatting .discusser_chat_container{
        padding: 0.5rem 2rem;
    }
    .chatting .discusser_message_box{
        display: flex;
        flex-wrap: nowrap;
        align-items: flex-start;
        height: fit-content;
        margin-bottom: 1rem;
        font-size: 2rem;
    }
    .chatting .discusser_profile_area{
        max-width: fit-content;
        height: fit-content;
        padding: 5px;
    }
    .chatting .discusser_content{
        max-width: 60%;
        width: fit-content;
        padding: 1rem;
        border-radius: 15px;
    }
    .chatting .discusser_profile_area img{
        width: 3.5rem;
    }
    .message_left{
        flex-direction: row;
    }
    .message_right{
        flex-direction: row-reverse;
    }
    .message_left p{
        text-align: left;
        background: #70A9FF 0% 0% no-repeat padding-box;
        color: white;
        margin-left: 1rem;
    }
    .message_right p{
        text-align: left;
        background: #FF8D8D 0% 0% no-repeat padding-box;
        color: white;
        margin-right: 1rem;
    }

    .chatting .watcher_vote{
        padding: 0 1rem;
        display: flex;
        flex-direction: column;
        justify-content: center;
    }

    .chatting .vote_title{
        height: fit-content;
        display: flex;
        font-size: 2.8rem;
        text-align: center;
        font-weight: 1000;
        align-items: center;
        justify-items: center;
        padding: 1rem 0;
    }
    .chatting .vote_box{
        display: flex;
        height: 6rem;
        font-size: 1.8rem;
    }
    .chatting .user_vote{
        display: flex;
        text-align: center;
        align-items: center;
        justify-items: center;
        color: white;
    }
    .chatting .user_vote img{
        border-radius: 50%;
    }
    .chatting .user_vote div{
        height: fit-content;
    }
    .chatting .user_left{
        width: 100%;
        padding-right: 2rem;
        background: #70A9FF 0% 0% no-repeat padding-box;
        border-radius: 5px 0px 0px 5px;
    }
    .chatting .user_right{
        width: 100%;
        padding-left: 2rem;
        background: #FF8D8D 0% 0% no-repeat padding-box;
        border-radius: 0px 5px 5px 0px;
    }
    #discusserBox>.hidden{
        display: none;
    }
    .hidden{
        display: none;
    }
    a{
        text-decoration: none;
        color: black;
    }
    .chatting .watcher_scrollbar a{
        width: 100%;
        height: 100%;
        color: white;
    }
    .chatting .watcher_scrollbar{
        display: none;
        position: absolute;
        bottom: 0%;
        z-index: 5;
        height: 3rem;
        background-color: black;
        color: white;
        text-align: center;
    }
    /* .chatting .watcher_scrollbar{
        position: absolute;
        bottom: 80%;
        z-index: 5;
        height: 3rem;
        background-color: black;
        color: white;
        text-align: center;
    } */


    .watcher_scrollbar a{
        display: block;
        width: 100%;
        height: 100%;
    }

    .chatting .watcher_scrollbar_ani{
        animation-name: moveScroll;
        animation-duration: 1s;
        animation-fill-mode: forwards;
    }
    .chatting .watcher_container_ani{
        animation-name: moveCotainer;
        animation-duration: 1s;
        animation-fill-mode: forwards;
    }

    .chatting .discusser_area, .chatting .watcher_area{
        height: fit-content;
    }
    .chatting .discusser_box{
        display: flex;
        justify-content: center;
        align-items: center;
    }
    .chatting .discusser_chat_container .backgroundColor{
        background-color: #30303031;
    }

    .chatting .discusser_start_area{
        /*border: 1px solid black;*/
        /*border-radius: 5px;*/
        display: flex;
        justify-content: center;
        align-items: center;
        width: 40rem;
        height: 10rem;
        text-align: center;
        font-size: 3rem;
    }
    .chatting .user2_name, .chatting .user1_name{
        font-size: 1.3rem;
    }

    @keyframes moveCotainer{
        0% {left: 0%; bottom: -80%;}
        100% {left: 0%; bottom: 0%; animation-timing-function: ease-out;}
    }
    @keyframes moveScroll{
        0% {left: 0%; bottom: 0%;}
        100% {left: 0%; bottom: 80%; animation-timing-function: ease-out;}
    }

    /* 모바일시 작동할 부분 */
    @media (max-width: 767px){
        html{
            font-size: 6.5px;
        }
        .chatting{
            padding-top: 112px;
        }
        .chatting .chat_container{
            overflow: hidden;
        }
        .chatting .discusser_container{
            width: 100%;
        }
        .chatting .watcher_scrollbar{
            display: block;
        }
        .chatting .watcher_container{
            position: absolute;
            z-index: 5;
            width: 100%;
            height: 80%;
            bottom: -80%;
            left: 0;
        }
        /* .chatting .watcher_container{
            position: absolute;
            width: 100%;
            height: 80%;
            bottom: 0%;
            left: 0;
        } */
    }


</style>


<section class="chatting main-content">
    <div class="chat_container">
        <div class="discusser_container">
            <div class="score_container">
                <div class="score_box">
                    <div class="score_content">
                        <div class="user">
                            <div><img src="${pageContext.request.contextPath}/image/user.png" alt=""></div>
                            <div class="user1_name">user#1</div>
                        </div>
                        <div class="result_box">
                            <div class="result">0 - 0</div>
                            <div class="time">00:00</div>
                        </div>
                        <div class="user">
                            <div><img src="${pageContext.request.contextPath}/image/user.png" alt=""></div>
                            <div class="user2_name">user#2</div>
                        </div>
                    </div>
                    <div class="score_bar">
                        <div class="score_bar_right">
                            <div class="score_bar_left"></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="discusser_chat_container">
                <div class="chat_box" id="discusserBox">
                    <div class="discusser_area">

                    </div>
                    <div class="discusser_box">
                        <div class="discusser_start_area">
                            <button id="startDiscusser" class="mdc-button mdc-button--raised no-outline">
                                <span class="mdc-button__label">토론시작</span>
                            </button>
                            <div class="discusser_textArea">토론시작을 기다려주세요.</div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="discusser_send_container">
                <div class="send_box">
                    <input type="text" placeholder="Enter Message" id="discusser_msg_input">
                </div>
            </div>
        </div>

        <div class="watcher_scrollbar" id="watcher_scroll_view">
            <a href="#" onclick="">올리기/내리기</a>
        </div>
        <div class="watcher_container">

            <div class="watcher_vote">
                <div class="vote_title">
                    <div>Vote the Best One</div>
                </div>
                <div class="vote_box">
                    <a href="#" class="user_vote message_left user_left">
                        <div><img src="${pageContext.request.contextPath}/image/user.png" alt=""></div>
                        <div class="user1_name">User#1</div>
                    </a>
                    <a href="#" class="user_vote message_right user_right">
                        <div><img src="${pageContext.request.contextPath}/image/user.png" alt=""></div>
                        <div class="user2_name">User#2</div>
                    </a>
                </div>

            </div>
            <div class="watcher_chat_container ">

                <div class="chat_box" id = "watcherBox">
                    <div class="watcher_area">

                    </div>

                </div>
            </div>
            <div class="watcher_send_container">
                <div class="send_box">
                    <input type="text" placeholder="Enter Message" id ="watcher_msg_input">
                </div>
            </div>
        </div>
    </div>



    <%@ include file="../../component/dialog/enterDiscuss.jsp"%>

</section>

<script>

    let socket;
    let stompClient;
    let sessionId;

    const joinedError = "${joinedError}";

    const channel = "${chatId}";
    const token = "${token}";

    const senderType = "${senderType}";
    const user = {name: "${principal.user.name}", id: "${principal.user.id}"};
    const owner = {name: "${room.owner.name}", id: "${room.owner.id}"};
    let opponent = {name: "${room.opponent.name}", id: "${room.opponent.id}"};

    let time = "${room.startDebate}";
    let timerHandler;
    let timelimit = 30*60*1000;

    <%--let temp = "${principal.user.id}";--%>
    <%--let tempName = ""--%>

    let transData = {
        'token': token,
        'chatRoomId': channel,
        'sender': user.name ,
        'sendTime': null,
        'senderType': senderType,
        'message': null,
        'messageType': "text"
    };

    $(document).ready(function(){
        if(joinedError) alert("참여 중이던 방으로 이동되었습니다")
        if(senderType != "owner" && opponent.id == ''){
            $("#enter").addClass("show");
        }
        if(time != ""){
            console.log("타이머 시작")
            screenOperation.active("begin");
        }
    })


</script>

<%--통신용 라이브러리--%>
<script src="${pageContext.request.contextPath}/js/sockjs.js"></script>
<script src="${pageContext.request.contextPath}/js/stomp.js"></script>

<%--시간 처리 라이브러리--%>
<script src="${pageContext.request.contextPath}/js/moment.js"></script>

<script>

    let chat = {
        init: function() {
            ${sessionScope.name}
            console.log("channel    : ", channel);
            console.log("token      : ", token);
            console.log("user       : ", user);
            console.log("senderType : ", senderType);
            console.log("time       : ", time);

            console.log("owner      : ", owner);
            console.log("opponent   : ", opponent);

            chat.connect(channel);
            screenOperation.initEvent();
            screenOperation.showArea(".discusser_area", ".discusser_area_init");
            screenOperation.nameInput();
        },

        connect: function (destination) {
            console.log("destination: ", destination);

            socket = new SockJS("/chat");
            stompClient = Stomp.over(socket);

            stompClient.connect({}, function() {
                stompClient.subscribe('/topic/enter/' + destination, function (e) {
                    const msg = JSON.parse(e.body);
                    if(msg.senderType === "opponent"){
                        opponent.name = msg.sender;
                        opponent.id = msg.senderId;
                        console.log("상대방 입장: ", opponent);
                        screenOperation.nameInput();
                    }
                });
                stompClient.subscribe('/topic/info/' + destination, function (e) {
                    const msg = JSON.parse(e.body);

                    if(msg.messageType == "text"){
                        screenOperation.discusserInfo(msg.message);
                    }else if(msg.messageType == "active"){
                        screenOperation.active(msg.message);
                    }
                });

                stompClient.subscribe('/topic/msg/' + destination, function (e) {
                    const msg = JSON.parse(e.body);
                    console.log("test: ",msg);
                    screenOperation.contributor(msg);
                });
                chat.enter();
            });
        },
        info: function(type, msg){
            stompClient.send(
                "/app/chat/info", {}, JSON.stringify({'token': token, 'message': msg, 'messageType': type})
            )
        },

        enter: function(){
            stompClient.send(
                "/app/chat/enter",
                {},
                JSON.stringify({
                'token':token,
                'chatRoomId': channel,
                'sender': user.name}));
        },

        send: function (msg) {
            transData.sendTime = new Date().getTime();
            transData.message = msg;

            console.log("전송시도");
            console.log(transData);
            stompClient.send("/app/chat/msg", {}, JSON.stringify(transData));
        },

        start: function(){
            $.ajax({
                type:"PUT",
                url:"/api/room/"+channel +"/start"
            }).done(response =>{
                console.log("성공", response);
                if(response.data == "success"){
                    //시간
                    time = "2002-12-12";
                    chat.info("active", "begin")
                }
            }).fail(error =>{
                console.log("error.....");
            })
        }
    }

    let screenOperation = {
        chatEvent: function () {
            $("#discusser_msg_input").on("keyup", (event) => {
                if (event.key === "Enter") {
                    let msg = event.target.value;
                    if (msg != "") {
                        event.target.value = "";
                        // console.log("전송할 데이터: ", data);
                        chat.send(msg);
                    }
                }
            });
        },

        initEvent: function(){
            $("#watcher_msg_input").on("keyup", (event)=>{
                if(event.key === "Enter"){
                    let msg = event.target.value;
                    if(msg != ""){
                        event.target.value = "";
                        // console.log("전송할 데이터: ", data);
                        chat.send(msg);
                    }
                }
            });

            $("#watcher_scroll_view").on("click", ()=>{
                if($(".watcher_scrollbar").hasClass("watcher_scrollbar_ani")){
                    $(".watcher_scrollbar").removeClass("watcher_scrollbar_ani");
                    $(".watcher_container").removeClass("watcher_container_ani");
                }else{
                    $(".watcher_scrollbar").addClass("watcher_scrollbar_ani");
                    $(".watcher_container").addClass("watcher_container_ani");
                }
            });

            $("#startDiscusser").on("click", ()=>{
                console.log("토론시작 버튼 클릭");
                if(owner != "" && opponent != ""){
                    console.log("토론시작");
                    screenOperation.showArea(".discusser_textArea", "#startDiscusser");
                    chat.info("잠시 후 토론이 시작됩니다.", "text");
                    chat.start();

                }else{
                    alert("아직 상대편 토론자가 준비되지 않았습니다.");
                }
            });
        },

        active: function(msg){
            console.log("active: ",msg);
            if(msg == "begin"){
                screenOperation.showArea(".discusser_area", ".discusser_box");
                screenOperation.chatEvent();
                timerHandler = screenOperation.timer()
            }
        },

        timer: function(){
            return setInterval(function(){
                var diff = moment(new Date()).diff(moment(time))/1000;

                var min = parseInt(diff/60)+"";
                var sec = parseInt(diff%60)+"";

                min = min.length<2? ("0"+min):min;
                sec = sec.length<2? ("0"+sec):sec;

                $(".time").html(min + " : " + sec);
                if(diff >= timelimit){
                    clearInterval(timerHandler);
                    //서버에다가 종료시간 보낼 예정입니다.
                }

            }, 1000);
        },
        discusserInfo: function(msg){
            console.log(msg);
            $(".discusser_textArea").html(msg);
        },

        contributor: function (msg) {

            console.log("msg", msg);
            console.log("user: ", user);

            let divs = document.createElement("div");
            let html = "";

            if(msg.senderType === "owner" || msg.senderType === "opponent"){

                if(msg.senderType === "owner"){
                    divs.setAttribute('class', "discusser_message_box message_left");
                } else {
                    divs.setAttribute('class', "discusser_message_box message_right");
                }

                html+= '    <div class="discusser_profile_area">';
                html+= '        <img src="img/profile.png" alt="" class="profile">';
                html+= '    </div>';
                html+= '    <p class="discusser_content ">' + msg.message +' </p>';
                html+= '</div>';

                divs.innerHTML = html;
                console.log(divs);

                $(".discusser_area").append(divs);
                this.scollMoving("#discusserBox", ".discusser_area", $("#discusserBox").innerHeight());

            }else if(msg.senderType === "watcher"){
                divs.setAttribute('class', "watcher_message_box");

                html += '    <div class="watcher_user_area"><strong>'+msg.sender+'</strong> • '+ screenOperation.dateformat(msg.sendTime)+'</div>';
                html += '    <div class="watcher_content">'+msg.message+'</div>';

                divs.innerHTML = html;
                $(".watcher_area").append(divs);

                this.scollMoving("#watcherBox ", ".watcher_area", $("#watcherBox").innerHeight());
            }
        },

        scollMoving: function (box, target, limit){
            let length =  $(target).innerHeight();
            let scrollLength = $(box).scrollTop() + $(box).innerHeight();

            console.log(length);
            console.log(scrollLength);

            if(length - scrollLength <= limit){
                $(box).scrollTop(length);
            }
        },

        nameInput: function(){

            if(owner.id == user.id){
                $(".discusser_textArea").addClass("hidden");
            }else{
                $("#startDiscusser").addClass("hidden");
            }

            if(owner.id != ""){
                console.log($(".user1_name"));
                $(".user1_name").html(owner.name);
            }
            if(opponent.id != ""){
                $(".user2_name").html(opponent.name);
            }
        },

        addOpponent: function (name){
            $("#opponent_name").innerHTML(name);
        },

        showArea: function(show, hidden){
            $(show).removeClass("hidden");
            $(hidden).addClass("hidden");
        },

        dateformat: function (date){
           return  moment(date).format("HH:mm");
        }
    }

    chat.init();

</script>

<%@ include file="../layout/footer.jsp"%>