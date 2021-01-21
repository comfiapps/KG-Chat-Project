<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/chat.css">

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
        background: #FF8D8D 0% 0% no-repeat padding-box;
        border-radius: 10px;
    }
    .chatting .score_bar_left{
        width: 50%;
        background: #70A9FF 0% 0% no-repeat padding-box;

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
        cursor: pointer;
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
    /*.chatting .watcher_scrollbar{*/
    /*    width: 100%;*/
    /*    height: 100%;*/
    /*    color: white;*/
    /*}*/
    .chatting .watcher_scrollbar{
        display: none;
        position: absolute;
        bottom: 0%;
        z-index: 5;
        height: 3rem;
        background-color: black;
        color: white;
        text-align: center;
        cursor: pointer;
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
                            <div class="user1_name">미입장</div>
                        </div>
                        <div class="result_box">
                            <div class="result">0 - 0</div>
                            <div class="time">00:00</div>
                        </div>
                        <div class="user">
                            <div><img src="${pageContext.request.contextPath}/image/user.png" alt=""></div>
                            <div class="user2_name">미입장</div>
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
                    <a class="user_vote message_left user_left" onclick="screenOperation.voteEvent(this)">
                        <div><img src="${pageContext.request.contextPath}/image/user.png" alt=""></div>
                        <div class="user1_name">미입장</div>
                    </a>
                    <a class="user_vote message_right user_right" onclick="screenOperation.voteEvent(this)">
                        <div><img src="${pageContext.request.contextPath}/image/user.png" alt=""></div>
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
    let sessionId;

    const joinedError = "${joinedError}";
    const channel = "${chatId}";
    const senderType = "${senderType}";
    const user = {name: "${principal.user.name}", id: "${principal.user.id}"};
    const owner = {name: "${room.owner.name}", id: "${room.owner.id}"};
    let opponent = {name: "${room.opponent.name}", id: "${room.opponent.id}"};

    let ownerVote = ${empty vote? 0: vote.ownerVote};
    let opponentVote = ${empty vote? 0: vote.opponentVote};

    let time = "${room.endDebate}";
    let timeLimit = 1*60;

    let endDiscuss = ${endDiscuss};
    let chatAble = false;

    <%--let temp = "${principal.user.id}";--%>
    <%--let tempName = ""--%>

    let transData = {
        'message': null,
        'messageType': null,
        'sendTime': null,
    };

    console.log(document.querySelector(".vote_box"));

    $(document).ready(function(){
        if(joinedError) alert("참여 중이던 방으로 이동되었습니다")

    })

</script>

<%--통신용 라이브러리--%>
<script src="${pageContext.request.contextPath}/js/sockjs.js"></script>
<script src="${pageContext.request.contextPath}/js/stomp.js"></script>
<%--시간 처리 라이브러리--%>
<script src="${pageContext.request.contextPath}/js/moment.js"></script>

<script>

    let chat = {

        //초기동작
        init: function() {

            chat.chatLoading();
            chat.connect(channel);

            screenOperation.selectWin();

        },

        //웹 세션 연결 및 메시지 받기
        connect: function (destination) {

            console.log("destination: ", destination);

            socket = new SockJS("/chat");
            stompClient = Stomp.over(socket);
            stompClient.connect({}, function() {

                //입장 관려 처리 부분: opponent가 들어오면 값을 받아 입장 처리
                stompClient.subscribe('/topic/enter/' + destination, function (e) {
                    const msg = JSON.parse(e.body);
                    if(msg.senderType === "opponent" && !endDiscuss){
                        console.log("토론자 입장");
                        opponent.name = msg.sender;
                        opponent.id = msg.senderId;
                        screenOperation.selectWin();
                    }else{
                        console.log("그냥 입장: ", msg.sender);
                    }
                });

                //입력 값에 따라 기능시작 처리
                stompClient.subscribe('/topic/info/' + destination, function (e) {
                    const msg = JSON.parse(e.body);
                    console.log("info 받은 메시지: ", msg);

                    if(msg.messageType == "text"){
                        screenOperation.infoMsg(msg.message);
                    }else if(msg.messageType == "start"){
                        time = msg.message;
                        screenOperation.beginWin();
                    }else if(msg.messageType == "end"){
                        endDiscuss = true;
                        alert("토론이 종료되었습니다.");
                        // screenOperation.endWin();
                    }else if(msg.messageType == "vote"){
                        ownerVote = msg.message.ownerVote;
                        opponentVote = msg.message.opponentVote;
                        screenOperation.voteWin();
                    }
                });

                // 채팅 메시지 부분
                stompClient.subscribe('/topic/msg/' + destination, function (e) {
                    const msg = JSON.parse(e.body);
                    console.log("test: ",msg);
                    screenOperation.contributor(msg);
                });

                // 입장시 보내기
                chat.enter();
            });
        },

        //info 메시지 보내기
        info: function(type, msg){
            stompClient.send("/app/chat/info",
                {},
                JSON.stringify({
                    'message': msg,
                    'messageType': type
                }))
        },

        //입장 메시지 보내기
        enter: function(){
            stompClient.send("/app/chat/enter",{}, "");
        },

        //일반 메시지 보내기
        send: function (msg) {
            transData.sendTime = new Date();
            transData.message = msg;
            transData.messageType = "text";

            console.log("전송시도");
            console.log(transData);

            stompClient.send("/app/chat/msg", {}, JSON.stringify(transData));
        },

        //시작 메시지
        start: function(){
            if(!endDiscuss){
                $.ajax({
                    type:"PUT",
                    url:"/api/room/"+channel +"/start"
                }).done(response =>{
                    console.log("성공", response);
                    if(response.data == "success" && response.status == 200){
                        console.log("진입?");
                        chat.info("start","");
                    }else{
                        console.log("실패")
                    }
                }).fail(error =>{
                    console.log("error.....");
                })
            }
        },

        //끝 메시지
        end: function(){
            if(!endDiscuss) {
                    $.ajax({
                    type:"PUT",
                    url :"/api/room/"+channel + "/close",
                }).done(response =>{
                    console.log(response);
                    if (response.status == 200){
                        if(response.data == "success"){
                            chat.info("end","");
                        }
                    }else{
                        console.log(response);
                    }
                }).fail(error=>{
                    console.log("end error.....");
                })
            }
        },

        //투표 메세지
        vote: function(voteUser){
            if(!endDiscuss) {
                console.log("voteuser: ", voteUser);
                $.ajax({
                    type: "PUT",
                    url: "/api/vote/" + voteUser.id + "/" + channel,
                }).done(response => {
                    console.log("성공", response);
                    if (response.data == -1) {
                        console.log("투표 취소 요청 후 전파");
                        chat.unvote();
                        alert(voteUser.name + "의 투표를 취소하였습니다.");
                    } else if (response.data == owner.id || response.data == opponent.id) {
                        console.log("투표 성공 알람 후 전파");
                        chat.info("vote", "");
                        alert(voteUser.name + "에게 투표 하였습니다.");
                    }
                }).fail(error => {
                    console.log("vote error.....");
                })
            }
        },

        //투표취소 메시지
        unvote: function(){
            if(!endDiscuss) {
                $.ajax({
                    type: "DELETE",
                    url: "/api/vote/" + channel
                }).done(response => {
                    console.log("성공", response);
                    console.log("투표 취소 완료");
                    chat.info("vote", "")
                })
            }
        },

        //과거 채팅 로딩
        chatLoading: function(){
            $.ajax({
                type: "GET",
                url: "/api/chat/"+ channel
            }).done(response=>{
                console.log("성공", response)
                console.log(typeof response.data);

                screenOperation.chatLoadingWin(response.data);

            }).fail(error=>{
                console.log("chatLoaing error...")
            })
        },

        //타이머 - 현재시간과 종료시간을 넘어간 경우에는 토론 종료, 아닐 시에는 시계 값 바꿈,
        timer: function(){
            let handler = setInterval(function(){
                var diff = moment(time).diff(moment(new Date()))/1000+7;
                if(diff <= 0){
                    console.log("시간 초과")
                    clearInterval(handler);
                    if(util.ownerCheck()) chat.end();
                    screenOperation.endWin();
                    return;
                }else{
                    screenOperation.timeWin(util.timeFormet(diff));
                }

            }, 1000);
        },

    }

    let screenOperation = {

        //투표 이벤트
        voteEvent: function(event){
            if(!endDiscuss){
                let voteUser;

                if (event.classList.contains("user_left")) {
                    console.log("왼쪽 클릭");
                    voteUser = owner;
                } else {
                    console.log("오른쪽 클릭");
                    voteUser = opponent;
                }
                chat.vote(voteUser);
            }
        },

        //토론자 채팅입력 이벤트
        discusserInputEvent:function(){
            $("#discusser_msg_input").on("keyup", (event) => {
                if (event.key === "Enter") {
                    let msg = event.target.value;
                    if (msg != "") {
                        event.target.value = "";
                        // console.log("전송할 데이터: ", data);
                        if(!endDiscuss && chatAble) chat.send(msg);
                        else console.log("채팅 전송 금지");
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
                        // console.log("전송할 데이터: ", data);
                        chat.send(msg);
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
                console.log("토론시작 버튼 클릭");
                if(!endDiscuss) {
                    if (owner.id != "" && opponent.id != "" && user.id == owner.id) {
                        console.log("토론시작");
                        screenOperation.showArea(".discusser_textArea", "#startDiscusser");
                        chat.info("text", "잠시 후 토론이 시작됩니다.");
                        chat.start();
                    } else {
                        alert("아직 상대편 토론자가 준비되지 않았습니다.");
                    }
                }else{
                    console.log("토론시작 버튼 작동금지");
                }
            });
        },

        //기본 이벤트들
        initEvent: function(){
            screenOperation.watcherInputEvent();
            screenOperation.watcherScollViewEvent();
        },

        //현재 변수값 출력(디버그용)
        stats : function(){

            console.log("상태 정보 출력")
            console.log("channel    : ", channel);
            console.log("user       : ", user);
            console.log("senderType : ", senderType);
            console.log("time       : ", time);

            console.log("owner      : ", owner);
            console.log("opponent   : ", opponent);

            console.log("ownerVote  : ", ownerVote);
            console.log("opponetVote: ", opponentVote);
            console.log("endDiscuss : ", endDiscuss);
            console.log("chatAble   : ", chatAble);

            console.log("room: ${room}");
        },

        //상태에 따른 화면 출력
        selectWin: function(){
            screenOperation.initEvent();
            screenOperation.initWin();

            //종료된 토론이 아니면
            if (!endDiscuss){
                if(opponent.id == ""){
                    console.log("시작: 토론자 대기 화면 출력")
                    screenOperation.waitWin();
                }else{
                    if(time == ''){
                        console.log("Asda??")
                        screenOperation.waitStartWin();
                    }else{
                        screenOperation.processWin();
                    }
                }
            }
            //종료된 토론이라면
            else{
                screenOperation.endWin();
            }
            screenOperation.stats();
        },

        //기본 화면
        initWin: function(){
            console.log("기본화면 호출");
            screenOperation.inputDiscusser();
            screenOperation.inputSelect();
        },

        //토론자 입장 전 대기 화면
        waitWin: function(){
            console.log("토론자 입장 전 대기화면 호출")
            screenOperation.showArea(".discusser_box", ".discusser_area");
            screenOperation.showArea(".discusser_textArea", ".discusser_start_btn");
            screenOperation.enterDiscusserWin();
            screenOperation.infoMsg("아직 상대방 토론자가 입장하지 않았습니다.");
        },

        //토론자 입장 완료 및 토론 시작 전 화면
        waitStartWin: function(){
            console.log("토론자 입장 완료 및 토론 시작 전 화면 호출")
            screenOperation.inputDiscusser();
            screenOperation.startDiscussBtnEvent();

            screenOperation.showArea(".discusser_box", ".discusser_area");
            if(user.id == owner.id){
                screenOperation.showArea(".discusser_start_btn", ".discusser_textArea");
            }else{
                screenOperation.showArea(".discusser_textArea", ".discusser_start_btn");
                screenOperation.infoMsg("토론 시작을 기다려주세요");
            }
        },

        //토론 시작 화면
        beginWin: function(){
            console.log("토론 시작 화면 호출");
            screenOperation.showArea(".discusser_box", ".discusser_area");
            screenOperation.showArea(".discusser_textArea", ".discusser_start_btn");

            let count = 3;
            (function(){
                let handler = setInterval(function(){
                    if(count < 0){
                        clearInterval(handler);
                        screenOperation.processWin(); //여기가 아니라 winMode가 들어오면 시작해야함
                        return;
                    }
                    if(count == 0){
                        screenOperation.infoMsg("토론시작!");
                    }else{
                        screenOperation.infoMsg(count);
                    }
                    count--;
                },1000);
            })();
        },

        //토론 중 화면
        processWin:function(){
            console.log("토론 중 화면 호출");
            screenOperation.showArea("", ".discusser_textArea");
            screenOperation.showArea("", ".discusser_start_btn");
            screenOperation.showArea(".discusser_area", ".discusser_box");
            screenOperation.voteWin();

            screenOperation.discusserInputEvent();

            chatAble = true;
            chat.timer();
        },

        //토론 종료 화면
        endWin: function(){
            console.log("토론 종료 화면 호출")
            screenOperation.showArea("", ".discusser_textArea");
            screenOperation.showArea("", ".discusser_start_btn");
            screenOperation.showArea(".discusser_area", ".discusser_box");
            screenOperation.timeWin("토론종료");

        },

        enterDiscusserWin: function (){
            console.log("토론자 입장 버튼 화면")
            if (user.id != owner.id && opponent.id == ''){
                $("#enter").addClass("show");
            }
        },

        chatLoadingWin: function(list){
            console.log(list);
            let msg = {sender:null, senderType: null,  message:null};

            for (var i in list){
                console.log(list[i].user.name);
                if(list[i].user.id == owner.id){
                    msg.senderType = "owner";
                }else if(list[i].user.id == opponent.id){
                    msg.senderType = "opponent";
                }else{
                    msg.senderType = "watcher";
                }
                msg.sender = list[i].user.name;
                msg.message = list[i].content;
                console.log(msg);
                screenOperation.contributor(msg);
            }
        },

        //투표수 조작 화면
        voteWin: function(){
            console.log("투표수 화면 변경");
            $(".result").html(ownerVote + " - " + opponentVote);
            screenOperation.socreScollbar();
        },

        //시간 조작 화면
        timeWin: function(time){
            $(".time").html(time);
        },

        //점수바 비율 조정 화면 //애니메이션 넣어봅시다. 나중에
        socreScollbar: function(){
            console.log("점수바 비율 화면 변경");
            if(ownerVote != 0 || opponentVote != 0){
                var rate = ownerVote /(ownerVote + opponentVote)*100;
                if(rate == 100){
                    $(".score_bar_left").css('border-radius', '5px 5px 5px 5px');
                    $(".score_bar_left").css('width', rate+"%");
                }else{
                    $(".score_bar_left").css('border-radius', '5px 0px 0px 5px');
                    $(".score_bar_left").css('width', rate+"%");
                }
            }else{
                $(".score_bar_left").css('border-radius', '5px 0px 0px 5px');
                $(".score_bar_left").css('width', '50%');
            }
        },

        //메세지 띄우기 - 시청자는 시청자 화면, 토론자는 토론자 화면
        contributor: function (msg) {
            console.log("msg", msg);
            console.log("user: ", user);

            let divs = document.createElement("div");
            let html = "";

            if(msg.senderType == "owner" || msg.senderType == "opponent"){
                console.log("여기 진입함")
                if(msg.senderType === "owner"){
                    divs.setAttribute('class', "discusser_message_box message_left");
                } else {
                    divs.setAttribute('class', "discusser_message_box message_right");
                }

                html+= '    <div class="discusser_profile_area">';
                html+= '        <img src="${pageContext.request.contextPath}/image/user.png" alt="" class="profile">';
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

        //토론방 스크롤 제어 - 화면 크기이상으로 스크롤이 올라가있는 경우 자동 내리기 안함
        scollMoving: function (box, target, limit){
            let length =  $(target).innerHeight();
            let scrollLength = $(box).scrollTop() + $(box).innerHeight();

            console.log(length);
            console.log(scrollLength);

            if(length - scrollLength <= limit){
                $(box).scrollTop(length);
            }
        },

        //토론자/시청자 입력박스 구분
        inputSelect: function(){
            if(user.id == opponent.id || user.id == owner.id){
                screenOperation.showArea("#discusser_msg_input", "#watcher_msg_input");
            }else{
                screenOperation.showArea("#watcher_msg_input", "#discusser_msg_input");
            }
        },

        //토론자 정보 입력
        inputDiscusser: function(){
            console.log('토론자 정보 입력')
            if(owner.id != ""){
                $(".user1_name").html(owner.name);
            }
            if(opponent.id != ""){
                $(".user2_name").html(opponent.name);
            }
        },

        //토론방 토론자 채팅란에 메시지 보이기
        infoMsg: function(msg){
            console.log("info 정보 출력");
            screenOperation.showArea(".discusser_box", ".discusser_area");
            screenOperation.showArea(".discusser_textArea",".discusser_start_btn");
            $(".discusser_textArea").html(msg);
        },

        //선택한 화면 보이고 감추기
        showArea: function(show, hidden){
            $(show).removeClass("hidden");
            $(hidden).addClass("hidden");
        },

        //입력받은 날짜 HH:mm형태로 반환
        dateformat: function (date){
           return  moment(date).format("HH:mm");
        }
    }

    let util = {
        ownerCheck: function (){
            if(user.id == owner.id){
                return true;
            }else{
                return false;
            }
        },
        //타이머 동작 1초마다 동작
        //구현하지 않음
        timeDiff: function(date){
            return moment(date).diff(moment(new Date()))/1000;
        },

        timeFormet: function(diff){
            if(diff == 0){
                return "00:00";
            }
            var min = parseInt(diff/60)+"";
            var sec = parseInt(diff%60)+"";

            min = min.length<2? ("0"+min):min;
            sec = sec.length<2? ("0"+sec):sec;

            return min + " : " + sec;
        }

    }

    chat.init();



</script>

<%@ include file="../layout/footer.jsp"%>