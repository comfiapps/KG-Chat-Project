<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>



<%--<link rel="stylesheet" href="${pageContext.request.contextPath}/css/chat.css">--%>

<style>
    html{ font-size:10px;}

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
                        <%--토론자 채팅 입력 부분--%>
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
                <div class="send_box ">
                    <input type="text" placeholder="Enter Message" class="hidden" id="discusser_msg_input">
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
                    <a class="user_vote message_left user_left" id="vote_left">
                        <div class="user1_img"><img src="${pageContext.request.contextPath}/image/user.png" alt=""></div>
                        <div class="user1_name">미입장</div>
                    </a>
                    <a class="user_vote message_right user_right" id="vote_right">
                        <div class="user2_img"><img src="${pageContext.request.contextPath}/image/user.png" alt=""></div>
                        <div class="user2_name">미입장</div>
                    </a>
                </div>

            </div>
            <div class="watcher_chat_container ">
                <div class="chat_box" id = "watcherBox">
                    <div class="watcher_area">
                        <%--사용자 채팅 입력 부분--%>
                    </div>
                </div>
            </div>
            <div class="watcher_send_container">
                <div class="send_box">
                    <input type="text" placeholder="Enter Message" class="hidden" id ="watcher_msg_input">
                </div>
            </div>
        </div>
    </div>

    <%@ include file="../../component/dialog/enterDiscuss.jsp"%>

</section>

<script>

    let socket;
    let stompClient;

    const joinedError = "${joinedError}";

    const user = {id: "${principal.user.id}", name:"${principal.user.name}"};

    let roomStatus = ${room};

    let endDiscuss = false;
    let chatAble = false;

    let transData = {'message': null, 'messageType': null, 'sendTime': null,};

    console.log("roomStatus: ", roomStatus);
    console.log("user: ", user);


</script>

<script src="${pageContext.request.contextPath}/js/sockjs.js"></script>
<script src="${pageContext.request.contextPath}/js/stomp.js"></script>
<script src="${pageContext.request.contextPath}/js/moment.js"></script>
<%--<script src="${pageContext.request.contextPath}/js/chat.js"></script>--%>

<script>

    //1: 토론자 입장 전 대기 화면
    //2: 토론자 입장 완료 및 토론 시작 전 화면
    //3: 토론 중 화면
    //4: 토론 종료 화면

    //스코어 부분 제어
    let scoreBoard = {
        active: function(){
            scoreBoard.scoreValue(roomStatus.countOwnerVote, roomStatus.countOpponentVote);
            scoreBoard.scoreBar(roomStatus.countOwnerVote, roomStatus.countOpponentVote);
            this.timer(roomStatus.endDebate, 7, this.timeIn, this.timeOut);
        },

        //점수 조작
        scoreValue: function(ownerVote, opponentVote){
            $(".result").html(ownerVote + " - " + opponentVote);
        },

        //점수바 조작
        scoreBar: function(ownerVote, opponentVote){
            if(ownerVote != 0 || opponentVote != 0){
                var rate = (ownerVote /(ownerVote + opponentVote)*100);
                if(rate == 100){
                    $(".result").css('border-radius', '5px 5px 5px 5px');
                    $(".result").css('width', rate+"%");
                }else{
                    $(".result").css('border-radius', '5px 0px 0px 5px');
                    $(".result").css('width', rate+"%");
                }
            }else{
                $(".result").css('border-radius', '5px 0px 0px 5px');
                $(".result").css('width', '50%');
            }
        },

        //타이머 - 현재시간과 종료시간을 넘어간 경우에는 토론 종료, 아닐 시에는 시계 값 바꿈,
        timer: function(time, additionalTime, timeInCallback, timeOutCallback){
            if(time == null || time == '') $(".time").html("00:00");
            else{
                let handler = setInterval(function(){
                    var diff = moment(time).diff(moment(new Date()))/1000+additionalTime;
                    if(diff <= 0){
                        timeOutCallback(handler);
                        return;
                    }else{
                        timeInCallback(diff);
                    }
                }, 1000);
            }
        },

        // 시간 초과시 동작 선택
        timeOut: function(handler){
            clearInterval(handler)
            console.log("토론 종료")
            if(roomStatus.owner.id == user.id) chat.info("chatEnd");
        },

        // 시간 미초과시 동작 선택
        timeIn: function(diff){
            $(".time").html(scoreBoard.timeFormat(diff));
        },
        //초형태의 숫자 데이터를 받아 MM:ss의 형태로 문자열 데이터 반환
        timeFormat: function(diff){
            if(diff == 0) return "00:00";
            var min = parseInt(diff/60)+"";
            var sec = parseInt(diff%60)+"";
            return (min.length<2? ("0"+min):min) + " : " + (sec.length<2? ("0"+sec):sec);
        },
    }

    //토론자 채팅 부분 제어
    let discussChat = {
        active: function(id){
            //토론자라면 input열어주기
            if(roomStatus.owner.id == user.id || roomStatus.opponent.id == user.id)
                util.showArea("#discusser_msg_input");
            this.beginDiscussEvent();
            switch(id){
                case 1: //1: 토론자 입장 전 대기 화면
                    console.log("토론자 입장 전 대기 화면")
                    this.infoMsg("아직 토론자가 입장하지 않았습니다.");
                    break;
                case 2: //2: 토론자 입장 완료 및 토론 시작 전 화면
                    console.log("토론자 입장 완료 및 토란 시작 전 화면");
                    this.waitStartWin();
                    break;
                case 3: //3: 토론 중 화면
                    console.log("토론 중 화면");
                    this.processWin();
                    break;
                case 4: //4: 토론 종료 화면
                    console.log("토론 종료 화면 호출");
                    this.endWin();
                    break;
                default:
                    break;
            }
        },
        // 2.토론자 입장 완료 및 토론 시작 전 화면
        waitStartWin: function(){
            util.showAndHiddenArea(".discusser_box", ".discusser_area");
            if(user.id == roomStatus.owner.id){
                util.showAndHiddenArea(".discusser_start_btn", ".discusser_textArea");
            }else{
                util.showAndHiddenArea(".discusser_textArea", ".discusser_start_btn");
                this.infoMsg("토론 시작을 기다려주세요");
            }
        },
        // 3.토론 중 화면
        processWin:function(){
            util.showAndHiddenArea(".discusser_area", ".discusser_box");
        },
        // 4.토론 종료 화면
        endWin: function(){

            util.hiddenArea(".discusser_textArea", ".discusser_start_btn")
            util.showAndHiddenArea(".discusser_area", ".discusser_box");
        },
        //토론방 토론자 채팅란에 메시지 보이기
        infoMsg: function(msg){
            util.hiddenArea(".discusser_area, .discusser_start_btn");
            util.showArea(".discusser_box", ".discusser_textArea");
            $(".discusser_textArea").html(msg);
        },

        //토론시작 이벤트
        beginDiscussEvent: function(){
            $("#startDiscusser").on("click", function(){
                chat.info("startDiscuss");
            })
        },

        //메세지 띄우기 - 시청자는 시청자 화면, 토론자는 토론자 화면
        contributor: function (msg) {
            let divs = document.createElement("div");
            let html = "";
            let img;

            if(roomStatus.owner.id == msg.senderId){
                divs.setAttribute('class', "discusser_message_box message_left");
                img = roomStatus.owner.image;
            } else {
                divs.setAttribute('class', "discusser_message_box message_right");
                img = roomStatusopponent.image;
            }

            html+= '    <div class="discusser_profile_area">';
            html+= '        <img src='+ img + ' alt="" class="profile">';
            html+= '    </div>';
            html+= '    <p class="discusser_content ">' + msg.message +' </p>';
            html+= '</div>';

            divs.innerHTML = html;
            $(".discusser_area").append(divs);
            common.scollMoving("#discusserBox", ".discusser_area", $("#discusserBox").innerHeight());
        },
    }

    //시청자 채팅 부분 제어
    let watcherChat = {
        active: function(){
            if(roomStatus.owner.id == user.id || roomStatus.opponent.id == user.id)
                util.showArea("#watcher_msg_input");
            watcherChat.watcherInputEvent();
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
    }

    //토론방 전체 부분
    let discussRoom = {
        active : function(){
            discussRoom.inputDiscusser();    //상태 상관없이 토론자 정보 넣기
            //만약 opponent 정보가 없으면 참여하기 버튼 호출
            if (user.id != roomStatus.owner.id && roomStatus.opponent.id == '') $("#enter").addClass("show");
        },

        //출력할 화면 선택
        selectView: function(roomStatsVal){
            roomStatus = roomStatsVal==undefined? roomStatus: roomStatsVal;
            roomStatus.opponent = util.userCheck(roomStatus.opponent);

            let selectNum;
            if(!endDiscuss){
                if(roomStatus.opponent.id == ""){
                    selectNum = 1;
                }else{
                    if(roomStatus.endDebate == ''|| roomStatus.endDebate == null){ selectNum = 2;}
                    else{ selectNum = 3;}
                }
            }else{
                selectNum = 4;
            }
            scoreBoard.active();
            discussChat.active(selectNum);
            watcherChat.active();
            discussRoom.active();
        },

        //토론자 정보 입력
        inputDiscusser: function(){
            console.log('토론자 정보 입력')
            if(roomStatus.owner.id != ""){
                $(".user1_name").html(roomStatus.owner.name);
                $(".user1_img").attr("src", roomStatus.owner.image);
            }
            if(roomStatus.opponent.id != ""){
                $(".user2_name").html(roomStatus.opponent.name);
                $(".user2_img").attr("src", roomStatus.opponent.image);
            }
        },

        warnModal: function(msg){
            //구현할 예정;
        },

    }

    //메세지  처리
    let chat = {
        //웹 세션 연결 및 메시지 받기
        connect: function (destination) {
            socket = new SockJS("/chat");
            stompClient = Stomp.over(socket);
            stompClient.connect({}, function () {

                //입장 관려 처리 부분: opponent가 들어오면 값을 받아 입장 처리
                stompClient.subscribe('/topic/enter/' + destination, function (e) {
                    const msg = JSON.parse(e.body);
                    if (msg.senderId == roomStatus.opponent.id && !endDiscuss) {
                        console.log("토론자 입장: ", msg.sender);
                        roomStatus = msg.message;
                        discussRoom.selectView();
                        // active.selectWin();
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
        info: function (msg) {
            transData.sendTime = new Date();
            transData.message = msg;
            transData.messageType = "info";
            stompClient.send("/app/chat/info", {}, JSON.stringify(transData));
        },

        //입장 메시지 보내기
        enter: function () {
            if (user.id == roomStatus.opponent.id){
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

    //사용자 함수
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
        //스크롤 제어 - 화면 크기이상으로 스크롤이 올라가있는 경우 자동 내리기 안함
        scollMoving: function (parentTag, targetTag, limit){
            let length =  $(targetTag).innerHeight();
            let scrollLength = $(parentTag).scrollTop() + $(parentTag).innerHeight();
            if(length - scrollLength <= limit){
                $(parentTag).scrollTop(length);
            }
        },

        userCheck: function (user){
            return (user == null || user == '')?{id: "", name:"알수없음", image:"${pageContext.request.contextPath}/image/user.png"}:user;
        }
    }

    // main
    function discussMain() {
        chat.connect(roomStatus.roomId);
        discussRoom.selectView();
    }

    $(document).ready(function(){
        if(joinedError) alert("참여 중이던 방으로 이동되었습니다")
    })

    // init();

    discussMain();

</script>


<%@ include file="../layout/footer.jsp"%>