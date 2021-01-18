<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

<style>
    .hr_line{
        margin: 10px 0;
        height: 1px;
        width: 100%;
        background-color: rgb(224, 224, 224);
    }
    .chat{
        padding-top: 54px;
        height: 100%;
    }
    .chat_container {
        height: 100%;
        display: flex;
        align-content: stretch;
        position: relative;
    }
    .main_container{
        display: flex;
        flex-direction: column;
        width: 70%;
        padding: 0 2%;
        height: 100%;
    }
    .visitor_content{
        display: flex;
        flex-direction: column;

        height: 90%;
        width: 100%;
        padding: 0 2%;
        background: #faf1f1 0% 0% no-repeat padding-box;

        min-width: 260px;
        overflow: auto;

        -ms-overflow-style: none; /* IE and Edge */
        scrollbar-width: none; /* Firefox */

    }
    .visitor_content::-webkit-scrollbar {
        display: none; /* Chrome, Safari, Opera*/
    }

    .result_box{
        width: 50%;
        margin: 2% auto;
    }

    .score_box{
        display: flex;
        text-align: center;
        align-items: center;

        min-width: 201px;
    }
    .user_left, .user_right{
        font: normal normal bold 16px/19px Segoe UI;
    }
    .compare .score{
        font: normal normal bold 42px/56px Segoe UI;
    }
    .compare .time{
        font: normal normal normal 24px/32px Segoe UI;
    }
    .process_bar{
        width: 100%;
        height: 10px;
    }

    .discusser_content::-webkit-scrollbar{
        display: none; /* Chrome, Safari, Opera*/
    }

    .visitor_reply_area{
        /* height: 85% */
        height: fit-content;
    }
    .visitor_reply_area::-webkit-scrollbar {
        display: none; /* Chrome, Safari, Opera*/
    }

    .discusser_msg_trans, .visitor_reply_trans{
        margin-bottom: 10px;
    }

    .discusser_msg_trans input {
        width: 100%;
        /* margin: 1% 0; */
        text-indent: 1.5em;
        background: #E5E5E5 0% 0% no-repeat padding-box;
        border: 0;
        border-radius: 25px;
        height: 50px;
    }

    .discusser_msg_trans input:focus {
        outline: 0;
        border: 3px solid rgb(177, 177, 177);
    }

    .visitor_reply_trans input {
        /* margin: 3% 0; */
        text-indent: 1.5em;
        background: #E5E5E5 0% 0% no-repeat padding-box;
        border: 0;
        border-radius: 25px;
        width: 100%;
        height: 50px;
    }

    .visitor_reply_trans input:focus {
        outline: 0;
        border: 3px solid rgb(177, 177, 177);
    }

    .discusser_box {
        margin: 15px 5%;
    }

    .discusser_box .discusser_right p,
    .discusser_box .discusser_left p {
        text-align: left;
        width: 70%;
        min-width: 230px;
        border-radius: 16px;
        padding: 15px;
        font: normal normal normal 18px/19px Segoe UI;
        color: #FFFFFF;
    }
    .discusser_box .discusser_left {
        display: grid;
        grid-template-columns: 70px auto;
    }
    .discusser_box .discusser_left p {
        background: #FF8D8D 0% 0% no-repeat padding-box;
    }
    .discusser_box .discusser_right {
        display: grid;
        grid-template-columns: auto 70px;
        justify-items: right;
    }
    .discusser_box .discusser_right p {
        background: #70A9FF 0% 0% no-repeat padding-box;
    }
    .discusser_box img {
        margin: 0 10px;
    }
    .visitor_vote{
        height: 20%;
        width: 100%;
        min-width: 260px;
    }
    .visitor_vote .visitor_vote_title{
        margin: 30px 0;
        text-align: center;
        font: normal normal normal 24px/19px Segoe UI;
    }
    .visitor_vote .visitor_vote_btn{
        display: flex;
        width: 100%;
        height: 45px;
        margin-top: 10px;
    }
    .visitor_vote .visitor_vote_btn a{
        display: flex;
        align-items: center;
        justify-content: center;
        background-color: tomato;
        width: 50%;
        height: 100%;
        box-sizing: border-box;
        border: 0;
    }
    .visitor_vote .visitor_vote_btn>:nth-child(1){
        background: #FF8D8D 0% 0% no-repeat padding-box;
    }
    .visitor_vote .visitor_vote_btn>:nth-child(2){
        background: #70A9FF 0% 0% no-repeat padding-box;
    }

    .visitor_vote_btn img{
        width: 30px;
        margin: 0 10px;
    }

    .discusser_content{
        height: 78%;
        overflow: auto;
        -ms-overflow-style: none; /* IE and Edge */
        scrollbar-width: none; /* Firefox */
    }
    .hidden{
        display: none;
    }



</style>

<section class="chat">
    <div class="chat_container">
        <div class="main_container">
            <div class="result_box">
                <div class="score_box">
                    <div class="user_left">
                        <div><img src="${pageContext.request.contextPath}/image/user.png" alt="" class="profile"></div>
                        <div>${room.owner.name}</div>
                    </div>
                    <div class="compare">
                        <div class="score">0-0</div>
                        <div class="time">0:00</div>
                    </div>
                    <div class="user_right">
                        <div><img src="${pageContext.request.contextPath}/image/user.png" alt="" class="profile"></div>
                        <div>Opponent</div>
                    </div>
                </div>
                <div class="process_bar">
                    <div class="process_left"></div>
                </div>

            </div>
            <div class="discusser_content">
                <div class="discusser_area_init">아직 상대방 토론자가 참여하지 않았습니다.</div>
                <div class="discusser_area hidden"></div>
            </div>

            <div class="hr_line"></div>

            <div class="discusser_msg_trans">
                <input type="text" placeholder="Enter Message" id="discusser_msg_input">
            </div>

        </div>
        <div class="visitor_container">
            <div class="visitor_content">
                <div class="visitor_reply_area">
                    <div class="visitor_box">
                        <div class="user">
                            <strong>User name</strong> • 13 minutes ago
                        </div>
                        <div class="reply">
                            <p>오늘도 이 비는 그치지 않아</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script>

    const channel = "${chatId}";
    const token = "${token}";

    const user = "${principal.user.name}";
    const senderType = "${senderType}";
    let opponent;

    let time = "${room.startDebate}";

    <%--let temp = "${principal.user.id}";--%>
    <%--let tempName = ""--%>

    let transData = {
        'token': token,
        'chatRoomId': channel,
        'sender': user ,
        'sendTime': null,
        'senderType': senderType,
        'message': null
    };

    let socket;
    let stompClient;
    let sessionId;


</script>

<script src="${pageContext.request.contextPath}/js/sockjs.js"></script>
<script src="${pageContext.request.contextPath}/js/stomp.js"></script>
<script>

    let chat = {
        init: function() {
            chat.connect(channel);
            screenOperation.addEvent();
            screenOperation.showArea(".discusser_area", ".discusser_area_init");
        },


        connect: function (destination) {
            console.log("destination: ", destination);

            socket = new SockJS("/chat");
            stompClient = Stomp.over(socket);

            stompClient.connect({}, function() {

                stompClient.subscribe('/topic/enter/' + destination, function (e) {
                    if(JSON.parse(e.body).senderType === "opponent"){
                        console.log("상대방 입장");
                        //타이머 작동
                        //~~ 토론기능 동작시킬 예정
                    }
                });

                stompClient.subscribe('/topic/' + destination, function (e) {
                    const msg = JSON.parse(e.body);
                    console.log("test: ",msg);
                    screenOperation.contributor(msg);
                });

                chat.enter();

            });
        },

        enter: function(){
            stompClient.send(
                "/app/chat/enter",
                {},
                JSON.stringify({
                'token':token,
                'chatRoomId': channel,
                'sender': user}));
        },


        send: function (msg) {
            transData.sendTime = new Date();
            transData.message = msg;

            console.log("전송시도");
            console.log(transData);
            stompClient.send("/app/chat/msg", {}, JSON.stringify(transData));
        },
    }

    let screenOperation = {

        addEvent: function (){
            $("#visitor_msg_input").on("keyup", (event) => {
                if (event.key === "Enter") {
                    let msg = event.target.value;
                    if(msg != ""){
                        event.target.value = "";
                        // console.log("전송할 데이터: ", data);
                        chat.send(msg);
                    }
                }
            });
            $("#discusser_msg_input").on("keyup", (event) => {
                if(event.key === "Enter"){
                    let msg = event.target.value;
                    if(msg != ""){
                        event.target.value = "";
                        // console.log("전송할 데이터: ", data);
                        chat.send(msg);
                    }
                }
            });
        },

        contributor: function (msg) {

            console.log("msg", msg);
            console.log("user: ", user);

            let divs = document.createElement("div");
            let html = "";

            if(msg.senderType === "owner" || msg.senderType === "opponent"){
                divs.setAttribute('class', "discusser_box");
                if(msg.senderType === "owner"){
                    html+= '    <div class="discusser_left">';
                    html+= '        <div>';
                    html+= '            <img src="/static/image/user.png" alt="" class="profile">';
                    html+= '        </div>';
                    html+= '        <p>'+msg.message+'</p>';
                    html+= '    </div>';

                } else {
                    html+= '    <div class="discusser_right">';
                    html+= '        <p>'+msg.message+'</p>';
                    html+= '        <div>';
                    html+= '            <img src="/static/image/user.png" alt="" class="profile">';
                    html+= '        </div>';
                    html+= '    </div>';
                }
                divs.innerHTML = html;
                console.log(divs);

                $(".discusser_area").append(divs);
                this.scollMoving(".discusser_content", ".discusser_area", $(".discusser_content").innerHeight());

            }else if(msg.senderType === "watcher"){
                divs.setAttribute('class', "visitor_box");

                html += '    <div class="user">';
                html += '        <strong>'+msg.sender.name+'</strong> • '+ msg.sendTime;
                html += '    </div>';
                html += '    <div class="reply">';
                html += '        <p>'+msg.message+'</p>';
                html += '    </div>';

                divs.innerHTML = html;
                $(".visitor_reply_area").append(divs);

                this.scollMoving(".visitor_content", ".visitor_reply_area", $(".visitor_content").innerHeight());
            }

        },

        scollMoving: function (box, target, limit){

            let length =  $(target).innerHeight();
            let scrollLength = $(box).scrollTop() + $(box).innerHeight();

            if(length - scrollLength <= limit){
                $(box).scrollTop(length);
            }
        },

        showArea: function(show, hidden){
            $(show).removeClass("hidden");
            $(hidden).addClass("hidden");
        }
    }

    chat.init();






</script>

<%@ include file="../layout/footer.jsp"%>