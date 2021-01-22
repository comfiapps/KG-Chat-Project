<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>



<%--<link rel="stylesheet" href="${pageContext.request.contextPath}/css/chat.css">--%>

<style>

    html{
        font-size:10px;
    }

    div{
         border: 1px solid black;
        box-sizing: border-box;
    }
    .chatting, .chat_container{
        width: 100%;
        height: 100%;
    }

    /*flex 적용?을 한번에 모아서..??*/
    .vote_title, .vote_box, .user_vote, .discusser_box, .discusser_start_area,
    .chat_container, .score_container, .score_box, .score_content, .score_content div, .score_bar, .discusser_send_container, .watcher_send_container, .discusser_message_box, .watcher_vote{
        display: flex;
        flex-wrap: nowrap;
    }

    .chat_container{
        position: relative;
        min-height: 72rem;
    }

    .discusser_chat_container, .watcher_chat_container {
        height: 100%;
        border: 1px solid  rgb(202, 202, 202);
    }
    .discusser_container{
        width: 70%;
    }
    .watcher_container{
        width: 30%;
        min-width: 320px;
    }
    .discusser_container, .watcher_container{
        padding: 1.5rem 2rem;
        flex-flow: column nowrap;
    }

    /* 토론자 부분 */
    .score_container, .watcher_vote{
        height: 18%;
        min-height: 12rem;
    }
    .discusser_chat_container{
        height: 67%;
    }
    .discusser_send_container{
        height: 15%;
    }

    /* 점수 영역 */
    .score_container{
        align-items: center;
        padding: 0 10%;
        position: relative;
    }
    .score_box{
        flex-direction: column;
        width: 100%;
        height: fit-content;
        align-items: center;
    }
    .score_content{
        flex-direction: row;
        width: 100%;
        height: 100%;
        padding: 0.5rem 0;

        align-content: center;
        justify-content: center;
    }
    .score_content div{
        flex-direction: column;

        width: fit-content;

        align-items: center;
        justify-content: center;

        padding: 0 1rem;
    }

    .score_bar{
        height: 2rem;
        width: 100%;
        align-items: center;
        justify-content: center;
    }
    .score_bar_right{
        width: 80%;
        height: 60%;
        background: #FF8D8D 0% 0% no-repeat padding-box;
        border-radius: 10px;
    }
    .score_bar_left{
        width: 50%;
        height: 100%;
        background: #70A9FF 0% 0% no-repeat padding-box;
        border-radius: 10px 0px  0px 10px;
    }

    .result{
        font-size: 4.2rem;
    }
    .time{
        font-size: 2rem;
    }

    .user div:nth-child(1), .result div:nth-child(1){
        height: 70%;
    }
    .user div:nth-child(2), .result div:nth-child(2){
        height: 30%;
        font-size: 1.8rem;
    }

    /* 보내기 영역 */
    .discusser_send_container, .watcher_send_container{
        padding: 0.5rem 2rem;
        min-height: 10rem;
    }
    .send_box{
        width: 100%;
        height: 50%;
    }
    .send_box input{
        width: 100%;
        height: 100%;
        border: 1px solid rgb(185, 185, 185);
        border-radius: 25px;
        text-indent: 1.5rem;
        font-size: 1.5rem;
        background: #E5E5E5 0% 0% no-repeat padding-box;
    }
    .send_box input:hover{
        border: 2px solid rgb(78, 105, 136);
        border-radius: 25px;
    }
    .send_box input:focus{
        border: 2px solid rgb(78, 105, 136);
        border-radius: 25px;
        outline: 0;
    }

    /* 채팅 공통 영역 */
    .chat_box{
        height: 100%;
        overflow: auto;
        -ms-overflow-style: none; /* IE and Edge */
        scrollbar-width: none; /* Firefox */
    }
    .chat_box::-webkit-scrollbar {
        display: none; /* Chrome, Safari, Opera*/
    }
    .discusser_send_container, .watcher_send_container{
        align-items: center;
    }

    /* 시청자 채팅 영역 */
    .watcher_vote{
        height: 18%;
    }
    .watcher_chat_container{
        height: 67%;
        padding: 0.5rem 2rem;
    }
    .watcher_send_container{
        height: 15%;
    }
    .watcher_message_box{
        height: fit-content;
        margin-bottom: 1.2rem;
    }
    .watcher_content{
        font-size: 1.5rem;
    }
    .watcher_user_area{
        font-size: 1.3rem;
        margin-bottom: 0.3rem;
        color: #AFAFAF;
    }
    .watcher_container{
        background-color: #faf1f1;
    }
    /* 토론자 채팅 영역 */
    .discusser_chat_container{
        padding: 0.5rem 2rem;
    }

    .discusser_message_box{
        margin-bottom: 1rem;
        font-size: 2rem;
        align-items: flex-start;
        height: fit-content;
    }
    .discusser_profile_area{
        max-width: fit-content;
        height: fit-content;
        padding: 5px;
    }
    .discusser_content{
        width: fit-content;
        max-width: 60%;
        padding: 1rem;
        border-radius: 15px;
    }

    .user div img, .watcher_vote img{
        height: 5rem;
        width: 5rem;
    }
    .discusser_profile_area img{
        width: 3.5rem;
        height: 3.5rem;
    }
    .user_vote img, .user div img, .watcher_vote img{
        border-radius: 100%;
    }

    .message_left{
        flex-direction: row;
    }
    .message_right{
        flex-direction: row-reverse;
    }

    .message_left p, .message_right p{
        text-align: left;
        color: white;
        margin-left: 1rem;
    }
    .message_left p{
        background: #70A9FF 0% 0% no-repeat padding-box;
    }
    .message_right p{
        background: #FF8D8D 0% 0% no-repeat padding-box;
    }

    .watcher_vote{
        padding: 0 1rem;
        flex-direction: column;
        justify-content: center;
    }

    .vote_title, .user_vote, .user{
        text-align: center;
        align-items: center;
        justify-items: center;
        font-weight: 1000;
    }

    .vote_title{
        height: fit-content;
        font-size: 2.8rem;
        padding: 1rem 0;
    }
    .vote_title div{
        width: 100%;
    }
    .vote_box{
        height: 6rem;
        font-size: 1.8rem;
    }
    .user_vote{
        color: white;
        cursor: pointer;
    }
    .user_vote div{
        height: fit-content;
    }
    .user_left{
        width: 100%;
        padding-right: 2rem;
        background: #70A9FF 0% 0% no-repeat padding-box;
        border-radius: 5px 0px 0px 5px;
    }
    .user_right{
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

    .watcher_scrollbar{
        display: none;
        position: absolute;
        bottom: 0%;
        z-index: 5;
        width: 100%;
        height: 3rem;
        background-color: black;
        color: white;
        text-align: center;
        cursor: pointer;
    }

    .watcher_scrollbar a{
        display: block;
        width: 100%;
        height: 100%;
    }

    .discusser_area, .watcher_area{
        height: fit-content;
    }
    .discusser_box{
        height: 100%;
        justify-content: center;
        align-items: center;
    }
    .discusser_chat_container .backgroundColor{
        background-color: #30303031;
    }

    .discusser_start_area{
        justify-content: center;
        align-items: center;
        width: 40rem;
        height: 10rem;
        text-align: center;
        font-size: 3rem;
    }
    .user2_name, .user1_name{
        font-size: 1.3rem;
    }

    .watcher_scrollbar_ani{
        animation-name: moveScroll;
        animation-duration: 1s;
        animation-fill-mode: forwards;
    }
    .watcher_container_ani{
        animation-name: moveCotainer;
        animation-duration: 1s;
        animation-fill-mode: forwards;
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
        .chat_container{
            overflow: hidden;
        }
        .discusser_container{
            width: 100%;
        }
        .watcher_scrollbar{
            display: block;
        }
        .watcher_container{
            position: absolute;
            z-index: 5;
            width: 100%;
            height: 80%;
            bottom: -80%;
            left: 0;
        }

    }
    .closeBtnArea{
        width: 30px;
        height: 30px;
        position: absolute;
        right: 0px;
    }

</style>

<section class="chatting main-content">
    <div class="chat_container">
        <div class="discusser_container">
            <div class="score_container">
                <div class="score_box">
                    <div class="score_content">
                        <div class="user">
                            <div class="user1_img"><img src="${pageContext.request.contextPath}/image/user.png" alt=""></div>
                            <div class="user1_name">미입장</div>
                        </div>
                        <div class="result_box">
                            <div class="result">0 - 0</div>
                            <div class="time">00:00</div>
                        </div>
                        <div class="user">
                            <div class="user2_img"><img src="${pageContext.request.contextPath}/image/user.png" alt=""></div>
                            <div class="user2_name">미입장</div>
                        </div>
                    </div>
                    <div class="score_bar">
                        <div class="score_bar_right">
                            <div class="score_bar_left"></div>
                        </div>
                    </div>
                </div>
                <div class="closeBtnArea">
                    <button type="button">종료</button>
                </div>
            </div>

            <div class="discusser_chat_container">
                <div class="chat_box" id="discusserBox">
                    <div class="discusser_area">
                    </div>
                    <div class="discusser_box">
                        <div class="discusser_start_area">
                            <div class="discusser_start_btn hidden">
                                <button id="startDiscusser" class="mdc-button mdc-button--raised no-outline">
                                    <span class="mdc-button__label">토론시작</span>
                                </button>
                            </div>
                            <div class="discusser_textArea hidden"></div>
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
            <div>올리기/내리기</div>
        </div>
        <div class="watcher_container">

            <div class="watcher_vote">
                <div class="vote_title">
                    <div>Vote the Best One</div>
                </div>
                <div class="vote_box">
                    <a class="user_vote message_left user_left" onclick="active.voteActive(this)">
                        <div class="user1_img"><img src="${pageContext.request.contextPath}/image/user.png" alt=""></div>
                        <div class="user1_name">미입장</div>
                    </a>
                    <a class="user_vote message_right user_right" onclick="active.voteActive(this)">
                        <div class="user2_img"><img src="${pageContext.request.contextPath}/image/user.png" alt=""></div>
                        <div class="user2_name">미입장</div>
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
    let transData = {'message': null, 'messageType': null, 'sendTime': null,};

    const joinedError = "${joinedError}";
    const channel = "${chatId}";
    const user = {name: "${principal.user.name}", id: "${principal.user.id}"};

    const owner = {name: "${room.owner.name}", id: "${room.owner.id}", img:"${room.owner.image}"==''?"${pageContext.request.contextPath}/image/user.png":"${room.owner.image}",};
    let opponent = {name: "${room.opponent.name}", id: "${room.opponent.id}", img:"${room.opponent.image}"==''?"${pageContext.request.contextPath}/image/user.png":"${room.opponent.image}",};

    let ownerVote = ${empty vote? 0: vote.ownerVote};
    let opponentVote = ${empty vote? 0: vote.opponentVote};

    let time = "${room.endDebate}";

    let endDiscuss = ${endDiscuss};
    let chatAble = false;

</script>

<script src="${pageContext.request.contextPath}/js/sockjs.js"></script>
<script src="${pageContext.request.contextPath}/js/stomp.js"></script>
<script src="${pageContext.request.contextPath}/js/moment.js"></script>
<%--<script src="${pageContext.request.contextPath}/js/chat.js"></script>--%>

<script>
    // 채팅 관련 처리
    let chat = {
        //웹 세션 연결 및 메시지 받기
        connect: function (destination) {
            socket = new SockJS("/chat");
            stompClient = Stomp.over(socket);
            stompClient.connect({}, function () {

                //입장 관려 처리 부분: opponent가 들어오면 값을 받아 입장 처리
                stompClient.subscribe('/topic/enter/' + destination, function (e) {
                    const msg = JSON.parse(e.body);
                    if (msg.senderType === "opponent" && !endDiscuss) {
                        console.log("토론자 입장");
                        opponent.name = msg.sender;
                        opponent.id = msg.senderId;
                        opponent.img = msg.message;
                        console.log(opponent.img);
                        active.selectWin();
                    } else {
                        console.log("시청자 입장: ", msg.sender);
                    }
                });

                //입력 값에 따라 기능시작 처리
                stompClient.subscribe('/topic/info/' + destination, function (e) {
                    const msg = JSON.parse(e.body);
                    console.log("info 받은 메시지: ", msg);

                    if (msg.messageType == "text") {
                        partWinOperation.infoMsg(msg.message);
                    } else if (msg.messageType == "start") {
                        time = msg.message;
                        screenOperation.beginWin();
                    } else if (msg.messageType == "end") {
                        endDiscuss = true;
                    } else if(msg.messageType == "vote"){
                        ownerVote = msg.message.ownerVote;
                        opponentVote = msg.message.opponentVote;
                        partWinOperation.voteChangeWin(ownerVote, opponentVote, ".result", ".score_bar_left");
                    }

                });

                // 채팅 메시지 부분
                stompClient.subscribe('/topic/msg/' + destination, function (e) {
                    partWinOperation.contributor(JSON.parse(e.body));
                });

                // 입장시 보내기
                chat.enter();
            });
        },

        //info 메시지 보내기
        info: function (type, msg) {
            stompClient.send("/app/chat/info",
                {},
                JSON.stringify({
                    'message': msg,
                    'messageType': type
                }))
        },

        //입장 메시지 보내기
        enter: function () {
            if (user.id == opponent.id){

                console.log(transData);
                stompClient.send("/app/chat/enter", {}, "");
            }
        },

        //일반 메시지 보내기
        sendMessage: function (msg) {
            transData.sendTime = new Date();
            transData.message = msg;
            transData.messageType = "text";

            stompClient.send("/app/chat/msg", {}, JSON.stringify(transData));
        },
    }

    // 비동기 처리
    let ajax = {
        //토론 시작 요청
        startDiscuss: function(){
            if(!endDiscuss){
                $.ajax({
                    type:"PUT",
                    url:"/api/room/"+channel +"/start"
                }).done(response =>{
                    if(response.data == "success"){
                        chat.info("start","");
                    }
                }).fail(error =>{
                    console.log("startDiscuss error.....");
                })
            }
        },

        //토론 종료 요청
        endDiscuss: function(){
            if(!endDiscuss) {
                $.ajax({
                    type:"PUT",
                    url :"/api/room/"+channel + "/close",
                }).done(response =>{
                    if(response.data == "success"){
                        chat.info("end","");
                    }
                }).fail(error=>{
                    console.log("endDiscuss error.....");
                })
            }
        },

        //토론 초기화 요청
        reSetDiscuss: function(){
            if(!endDiscuss){
                $.ajax({
                    type: "",

                    url: "",
                })
            }
        },

        //투표 요청
        voteDiscuss: function(voteUser){
            if(!endDiscuss) {
                $.ajax({
                    type: "PUT",
                    url: "/api/vote/" + voteUser.id + "/" + channel,
                }).done(response => {
                    if (response.data == -1) {
                        ajax.unvoteDiscuss();
                    } else if (response.data == owner.id || response.data == opponent.id) {
                        chat.info("vote", "");
                        alert(voteUser.name + "에게 투표 하였습니다.");
                    }
                }).fail(error => {
                    console.log("voteDiscuss error.....");
                })
            }
        },

        //투표취소 요청
        unvoteDiscuss: function(){
            if(!endDiscuss) {
                $.ajax({
                    type: "DELETE",
                    url: "/api/vote/" + channel
                }).done(response => {
                    if (response.data == "success"){
                        chat.info("vote", "")
                        alert(voteUser.name + "의 투표를 취소하였습니다.");
                    }
                }).fail(error=>{
                    console.log("unvoteDiscuss error.....");
                })
            }
        },

        //과거 채팅 데이터 요청
        getChat: function(){
            $.ajax({
                type: "GET",
                url: "/api/chat/"+ channel
            }).done(response=>{
                if(response.data != null && response.data != ''){
                    partWinOperation.chatLoadingWin(response.data);
                }
            }).fail(error=>{
                console.log("getChat error...")
            })
        },

    }

    //
    let active = {
        // 투표 동작 부분
        voteActive: function(event){
            if(!endDiscuss){
                let voteUser;
                if (event.classList.contains("user_left")) {
                    voteUser = owner;
                } else {
                    voteUser = opponent;
                }
                ajax.voteDiscuss(voteUser);
            }
        },

        // 보여줄 화면 선택
        selectWin: function(){
            let selectNum;
            if(!endDiscuss){
                if(opponent.id == ""){
                    selectNum = 1;
                }else{
                    if(time == ''){
                        selectNum = 2;
                    }else{
                        selectNum = 3;
                    }
                }
            }else{
                selectNum = 4;
            }
            screenOperation.viewWin(selectNum);
        },

        // 시간 초과시 동작 선택
        timeOut: function(handler){
            clearInterval(handler);
            if(owner.id == user.id) ajax.endDiscuss();
            screenOperation.endWin();
        },

        // 시간 미초과시 동작 선택
        timeIn: function(diff){
            util.setText(util.timeFormat(diff), ".time");
        },
    }

    // 전체 화면 처리
    let screenOperation = {

        // 선택된 화면에 따라 화면 보여주기
        viewWin: function (selectNum){
            screenOperation.initWin();
            switch (selectNum){
                case 1: screenOperation.waitWin(); break;           //토론자 입장 전 대기 화면
                case 2: screenOperation.waitStartWin(); break;      //토론자 입장 완료 및 토론 시작 전 화면
                case 3: screenOperation.processWin(); break;        //토론 중 화면
                case 4: screenOperation.endWin(); break;            //토론 종료 화면
                default: break;
            }
        },

        // 0.기본 화면
        initWin: function(){
            console.log("기본화면 호출");
            partWinOperation.inputDiscusser();
            partWinOperation.inputSelect();
        },

        // 1.토론자 입장 전 대기 화면
        waitWin: function(){
            console.log("토론자 입장 전 대기화면 호출")
            util.showAndHiddenArea(".discusser_box", ".discusser_area");
            util.showAndHiddenArea(".discusser_textArea", ".discusser_start_btn");
            partWinOperation.enterDiscusserWin();
            partWinOperation.infoMsg("아직 상대방 토론자가 입장하지 않았습니다.");
        },

        // 2.토론자 입장 완료 및 토론 시작 전 화면
        waitStartWin: function(){
            console.log("토론자 입장 완료 및 토론 시작 전 화면 호출")
            partWinOperation.inputDiscusser();
            util.showAndHiddenArea(".discusser_box", ".discusser_area");
            if(user.id == owner.id){
                util.showAndHiddenArea(".discusser_start_btn", ".discusser_textArea");
            }else{
                util.showAndHiddenArea(".discusser_textArea", ".discusser_start_btn");
                partWinOperation.infoMsg("토론 시작을 기다려주세요");
            }
        },

        // 2-1.토론 시작 화면
        beginWin: function(){
            console.log("토론 시작 화면 호출");
            util.showAndHiddenArea(".discusser_box", ".discusser_area");
            util.showAndHiddenArea(".discusser_textArea", ".discusser_start_btn");

            let count = 3;
            (function(){
                let handler = setInterval(function(){
                    if(count < 0){
                        clearInterval(handler);
                        screenOperation.processWin(); //여기가 아니라 winMode가 들어오면 시작해야함
                        return;
                    }
                    if(count == 0){
                        partWinOperation.infoMsg("토론시작!");
                    }else{
                        partWinOperation.infoMsg(count);
                    }
                    count--;
                },1000);
            })();
        },

        // 3.토론 중 화면
        processWin:function(){
            console.log("토론 중 화면 호출");
            util.hiddenArea(".discusser_textArea", ".discusser_start_btn")
            util.showAndHiddenArea(".discusser_area", ".discusser_box");
            partWinOperation.voteChangeWin(ownerVote, opponentVote,".result", ".score_bar_left");

            chatAble = true;
            util.timer(time, 0,active.timeOut, active.timeIn);
        },

        // 4.토론 종료 화면
        endWin: function(){
            console.log("토론 종료 화면 호출")
            util.hiddenArea(".discusser_textArea", ".discusser_start_btn")
            util.showAndHiddenArea(".discusser_area", ".discusser_box");
            util.setText("토론종료", ".time");

        },

    }

    // 부분화면 처리
    let partWinOperation = {

        //스코어바 조작
        scoreScollbar: function(ownerVote, opponentVote, targetTag){
            if(ownerVote != 0 || opponentVote != 0){
                var rate = (ownerVote /(ownerVote + opponentVote)*100);
                if(rate == 100){
                    $(targetTag).css('border-radius', '5px 5px 5px 5px');
                    $(targetTag).css('width', rate+"%");
                }else{
                    $(targetTag).css('border-radius', '5px 0px 0px 5px');
                    $(targetTag).css('width', rate+"%");
                }
            }else{
                $(targetTag).css('border-radius', '5px 0px 0px 5px');
                $(targetTag).css('width', '50%');
            }
        },

        //스크롤 제어 - 화면 크기이상으로 스크롤이 올라가있는 경우 자동 내리기 안함
        scollMoving: function (parentTag, targetTag, limit){
            let length =  $(targetTag).innerHeight();
            let scrollLength = $(parentTag).scrollTop() + $(parentTag).innerHeight();
            if(length - scrollLength <= limit){
                $(parentTag).scrollTop(length);
            }
        },

        //투표수 조작 화면
        voteChangeWin: function(ownerVote, opponentVote, targetTag, scollTag){
            util.setText(ownerVote + " - " + opponentVote, targetTag);
            partWinOperation.scoreScollbar(ownerVote, opponentVote, scollTag);
        },

        //토론자 입장 확인 버튼, 모달 출력 여부
        enterDiscusserWin: function (){
            console.log("토론자 입장 버튼 화면")
            if (user.id != owner.id && opponent.id == ''){
                $("#enter").addClass("show");
            }
        },

        //받아온 채팅리스트 출력
        chatLoadingWin: function(list){
            let msg = {sender:null, senderType: null,  message:null};

            for (var i in list){
                if(list[i].user.id == owner.id){
                    msg.senderType = "owner";
                }else if(list[i].user.id == opponent.id){
                    msg.senderType = "opponent";
                }else{
                    msg.senderType = "watcher";
                }
                msg.sender = list[i].user.name;
                msg.message = list[i].content;
                partWinOperation.contributor(msg);
            }
        },

        //메세지 띄우기 - 시청자는 시청자 화면, 토론자는 토론자 화면
        contributor: function (msg) {
            let divs = document.createElement("div");
            let html = "";


            if(msg.senderType == "owner" || msg.senderType == "opponent"){
                let img;

                if(msg.senderType === "owner"){
                    divs.setAttribute('class', "discusser_message_box message_left");
                    img = owner.img;
                } else {
                    divs.setAttribute('class', "discusser_message_box message_right");
                    img = opponent.img;
                }

                html+= '    <div class="discusser_profile_area">';
                html+= '        <img src='+ img + ' alt="" class="profile">';
                html+= '    </div>';
                html+= '    <p class="discusser_content ">' + msg.message +' </p>';
                html+= '</div>';

                divs.innerHTML = html;

                $(".discusser_area").append(divs);
                partWinOperation.scollMoving("#discusserBox", ".discusser_area", $("#discusserBox").innerHeight());

            }else if(msg.senderType === "watcher"){
                divs.setAttribute('class', "watcher_message_box");

                html += '    <div class="watcher_user_area"><strong>'+msg.sender+'</strong></div>';
                html += '    <div class="watcher_content">'+msg.message+'</div>';

                divs.innerHTML = html;
                $(".watcher_area").append(divs);

                partWinOperation.scollMoving("#watcherBox ", ".watcher_area", $("#watcherBox").innerHeight());
            }
        },

        //토론자/시청자 입력박스 구분
        inputSelect: function(){
            if(user.id == opponent.id || user.id == owner.id){
                util.showAndHiddenArea("#discusser_msg_input", "#watcher_msg_input");
            }else{
                util.showAndHiddenArea("#watcher_msg_input", "#discusser_msg_input");
            }
        },

        //토론자 정보 입력
        inputDiscusser: function(){
            console.log('토론자 정보 입력')
            if(owner.id != ""){
                util.setText(owner.name, ".user1_name");
                util.setImage(owner.img, ".user1_img img");
            }
            if(opponent.id != ""){
                util.setText(opponent.name, ".user2_name");
                util.setImage(opponent.img, ".user2_img img");
            }
        },

        //토론방 토론자 채팅란에 메시지 보이기
        infoMsg: function(msg){
            console.log("info 정보 출력: ", msg);
            util.showAndHiddenArea(".discusser_box", ".discusser_area");
            util.showAndHiddenArea(".discusser_textArea",".discusser_start_btn");
            $(".discusser_textArea").html(msg);
        },

    }

    // 이벤트 관련 처리
    let eventOperation = {
        //기본 이벤트들
        initEvent: function(){
            eventOperation.watcherInputEvent();
            eventOperation.watcherScollViewEvent();
            eventOperation.startDiscussBtnEvent();
            eventOperation.discusserInputEvent();
        },

        //토론자 채팅입력 이벤트
        discusserInputEvent:function(){
            $("#discusser_msg_input").on("keyup", (event) => {
                if (event.key === "Enter") {
                    let msg = event.target.value;
                    if (msg != "") {
                        event.target.value = "";
                        if(!endDiscuss && chatAble) chat.sendMessage(msg);
                    }
                }
            });
        },

        //시청자 채팅입력 이벤트
        watcherInputEvent:function(){
            $("#watcher_msg_input").on("keyup", (event)=>{
                if(event.key === "Enter"){
                    let msg = event.target.value;
                    if(msg != ""){
                        event.target.value = "";
                        chat.sendMessage(msg);
                    }
                }
            });
        },

        //모바일용 시청자 채팅 보이기/감추기 이벤트
        watcherScollViewEvent: function(){
            $("#watcher_scroll_view").on("click", ()=>{
                if($(".watcher_scrollbar").hasClass("watcher_scrollbar_ani")){
                    $(".watcher_scrollbar").removeClass("watcher_scrollbar_ani");
                    $(".watcher_container").removeClass("watcher_container_ani");
                }else{
                    $(".watcher_scrollbar").addClass("watcher_scrollbar_ani");
                    $(".watcher_container").addClass("watcher_container_ani");
                }
            });
        },

        //토론시작 버튼 이벤트
        startDiscussBtnEvent: function(){
            $("#startDiscusser").on("click", ()=>{
                if(!endDiscuss) {
                    if (owner.id != "" && opponent.id != "" && user.id == owner.id) {
                        util.showAndHiddenArea(".discusser_textArea", "#startDiscusser");
                        chat.info("text", "잠시 후 토론이 시작됩니다.");
                        ajax.startDiscuss();
                    } else {
                        alert("아직 상대편 토론자가 준비되지 않았습니다.");
                    }
                }
            });
        },
    }

    // 유틸
    let util = {

        //선택한 화면 보이고 감추기
        showAndHiddenArea: function(show, hidden){
            $(show).removeClass("hidden");
            $(hidden).addClass("hidden");
        },

        //선택한 화면 모두 보이기
        showArea: function(...targets){
            for(var i in targets){
                $(targets[i]).removeClass("hidden");
            }
        },

        //선택한 화면 모두 감추기
        hiddenArea: function(...targets){
            for(var i in targets){
                $(targets[i]).addClass("hidden");
            }
        },

        //화면 정보 바꾸기
        setText: function(text, targetTag){
            $(targetTag).html(text);
        },

        //이미지 정보를 받아 타겟에 집어넣음 없으면 기본값으로 셋팅
        setImage: function(imgData, targetTag){
            $(targetTag).attr("src", imgData);
        },

        //타이머 - 현재시간과 종료시간을 넘어간 경우에는 토론 종료, 아닐 시에는 시계 값 바꿈,
        timer: function(time, additionalTime, timeOutCallback, timeInCallback){
            let handler = setInterval(function(){
                var diff = moment(time).diff(moment(new Date()))/1000+additionalTime;
                if(diff <= 0){
                    timeOutCallback(handler);
                    return;
                }else{
                    timeInCallback(diff);
                }
            }, 1000);
        },

        //초형태의 숫자 데이터를 받아 MM:ss의 형태로 문자열 데이터 반환
        timeFormat: function(diff){
            if(diff == 0){
                return "00:00";
            }
            var min = parseInt(diff/60)+"";
            var sec = parseInt(diff%60)+"";

            min = min.length<2? ("0"+min):min;
            sec = sec.length<2? ("0"+sec):sec;

            return min + " : " + sec;
        },
    }


    // main
    function init() {
        ajax.getChat();                 //1. 채팅 받아오기
        chat.connect(channel);          //2. 웹소켓 연결
        eventOperation.initEvent();     //3. 이벤트 처리
        active.selectWin();             //4. 화면 처리
    }

    $(document).ready(function(){
        if(joinedError) alert("참여 중이던 방으로 이동되었습니다")
    })

    init();


</script>


<%@ include file="../layout/footer.jsp"%>