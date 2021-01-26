<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>



<%--<link rel="stylesheet" href="${pageContext.request.contextPath}/css/chat.css">--%>

<style>

    html{ font-size:10px; }

    div{ /*border: 1px solid black;*/ box-sizing: border-box; }

    .closeBtnArea{
        width: fit-content; height: fit-content; position: absolute; right: 0px; top: 0px;
    }

    .chatting, .chat_container{ width: 100%; height: 100%; position: relative; }

    .vote_title, .vote_box, .user_vote, .discusser_box, .discusser_start_area,
    .chat_container, .score_container, .score_box, .score_content, .score_content div, .score_bar, .discusser_send_container, .watcher_send_container, .discusser_message_box, .watcher_vote{
        display: flex; flex-wrap: nowrap;
    }

    .chat_container{ position: relative; min-height: 72rem; }

    .discusser_chat_container, .watcher_chat_container {
        height: 100%; border: 1px solid  rgb(202, 202, 202);
    }
    .discusser_container{
        width: 70%;
    }
    .watcher_container{
        width: 30%; min-width: 320px;
    }
    .discusser_container, .watcher_container{
        padding: 1.5rem 2rem; flex-flow: column nowrap;
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
    .send_box input:hover, .send_box input:focus{
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
    .message_left p{ background: #70A9FF 0% 0% no-repeat padding-box; }
    .message_right p{ background: #FF8D8D 0% 0% no-repeat padding-box; }

    .watcher_vote{
        padding: 0 1rem;
        flex-direction: column;
        justify-content: center;
    }

    .vote_title, .user_vote, .user{
        text-align: center; align-items: center; justify-items: center; font-weight: 1000;
    }

    .vote_title{
        height: fit-content; font-size: 2.8rem; padding: 1rem 0;
    }
    .vote_title div{
        width: 100%;
    }
    .vote_box{
        height: 6rem; font-size: 1.8rem;
    }
    .user_vote{
        color: white; cursor: pointer; position: relative;
    }
    .user_vote div{
        height: fit-content;
    }
    .user_left{
        width: 100%; padding-right: 2rem; background: #70A9FF 0% 0% no-repeat padding-box; border-radius: 5px 0px 0px 5px;
    }
    .user_right{
        width: 100%; padding-left: 2rem; background: #FF8D8D 0% 0% no-repeat padding-box; border-radius: 0px 5px 5px 0px;
    }
    .user_vote div:nth-child(1){
        margin: 0.5rem 1rem;
    }
    .user_vote .select_vote{
        position: absolute; background-color: black; z-index: 5; opacity: 0.6; width: 100%; height: 100%; border-radius: inherit;
    }
    #discusserBox>.hidden{ display: none;}
    .hidden{ display: none; }

    a{ text-decoration: none; color: black; }

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
    .watcher_scrollbar_ani, .watcher_container_ani{
        animation-duration: 1s;
        animation-fill-mode: forwards;
    }
    .watcher_scrollbar_ani{
        animation-name: moveScroll;
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
                    <button class="mdc-button mdc-button--raised no-outline" type="button" id="endBtn"><span class="mdc-button__label">나가기</span></button>
                </div>

            </div>

            <div class="discusser_chat_container">
                <div class="chat_box" id="discusserBox">
                    <div class="discusser_area">
                    </div>
                    <div class="discusser_box">
                        <div class="discusser_start_area">
                            <div class="discusser_start_btn hidden">
                                <button id="startBtn" class="mdc-button mdc-button--raised no-outline">
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
                    <div class="user_vote message_left user_left " id="vote_left">
                        <div class="user1_img"><img src="${pageContext.request.contextPath}/image/user.png" alt=""></div>
                        <div class="user1_name">미입장</div>
                        <div class="bg select_vote"></div>
                    </div>
                    <div class="user_vote message_right user_right" id="vote_right">
                        <div class="user2_img"><img src="${pageContext.request.contextPath}/image/user.png" alt=""></div>
                        <div class="user2_name">미입장</div>
                        <div class="bg select_vote"></div>
                    </div>
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
                    <input type="text" placeholder="Enter Message" class="hidden" id ="watcher_msg_input">
                </div>
            </div>
        </div>
    </div>

    <%@ include file="../../component/dialog/enterDiscuss.jsp"%>
    <%@ include file="../../component/dialog/warnDiscuss.jsp"%>
</section>


<script src="${pageContext.request.contextPath}/js/sockjs.js"></script>
<script src="${pageContext.request.contextPath}/js/stomp.js"></script>
<script src="${pageContext.request.contextPath}/js/moment.js"></script>
<script src="${pageContext.request.contextPath}/js/myUtil.js"></script>
<script src="${pageContext.request.contextPath}/js/chat.js"></script>
<script src="${pageContext.request.contextPath}/js/scoreBoard.js"></script>
<script src="${pageContext.request.contextPath}/js/discussChat.js"></script>
<script src="${pageContext.request.contextPath}/js/watcherChat.js"></script>
<script src="${pageContext.request.contextPath}/js/voteBoard.js"></script>

<script>
    let socket;
    let stompClient;

    const joinedError = "${joinedError}";
    const user = {id: "${principal.user.id}", name:"${principal.user.name}"};
    let myVote = ${myVote};
    let roomStatus = ${room};
    let endDiscuss = ${endDiscuss};
    let chatAble = false;
    let transData = {'message': null, 'messageType': null, 'sendTime': null,};

    console.log("roomStatus: ", roomStatus);
    console.log("user: ", user);

    //1: 토론자 입장 전 대기 화면
    //2: 토론자 입장 완료 및 토론 시작 전 화면
    //3: 토론 중 화면
    //4: 토론 종료 화면
    //토론방 전체
    let discussRoom = {
        active : function(){
            discussRoom.inputDiscusser();           //상태 상관없이 토론자 정보 넣기
            discussRoom.watcherScollViewEvent()     //
            discussRoom.endDiscussBtnEvent();
            //만약 opponent 정보가 없으면 참여하기 버튼 호출
            if(user.id != roomStatus.owner.id && roomStatus.opponent.id == '') $("#enter").addClass("show");

        },

        //현재 방상태 선택
        getStatus : function(){
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
            return selectNum;
        },

        //출력할 화면 선택
        selectView: function(){
            let selectNum = this.getStatus();
            scoreBoard.active(selectNum);
            voteBoard.active(selectNum);
            discussChat.active(selectNum);
            watcherChat.active();
            discussRoom.active();
        },

        //토론자 정보 입력
        inputDiscusser: function(){
            console.log('토론자 정보 입력')
            if(roomStatus.owner.id != ""){
                $(".user1_name").html(roomStatus.owner.name);
                $(".user1_img img").attr("src", util.defaultImg(roomStatus.owner.image));
            }
            if(roomStatus.opponent.id != ""){
                $(".user2_name").html(roomStatus.opponent.name);
                $(".user2_img img").attr("src", util.defaultImg(roomStatus.opponent.image));
            }
        },

        //모바일용 시청자 채팅 보이기/감추기 이벤트
        watcherScollViewEvent: function(){
            document.querySelector("#watcher_scroll_view").onclick = ()=>{
                if($(".watcher_scrollbar").hasClass("watcher_scrollbar_ani")){
                    $(".watcher_scrollbar").removeClass("watcher_scrollbar_ani");
                    $(".watcher_container").removeClass("watcher_container_ani");
                }else{
                    $(".watcher_scrollbar").addClass("watcher_scrollbar_ani");
                    $(".watcher_container").addClass("watcher_container_ani");
                }
            };
        },

        //토론자 나가기 버튼 이벤트
        endDiscussBtnEvent: function(){
            document.querySelector("#endBtn").onclick = ()=>{
                if(!endDiscuss){
                    if (roomStatus.owner.id != "" && roomStatus.opponent.id != "" && user.id == roomStatus.owner.id && chatAble) {
                        console.log("토론 종료 실행");
                        chat.info(2);
                    }else{
                        console.log("토론 나가기 실행");
                        chat.info(3);
                    }
                }
            };
        },

        //받아온 채팅리스트 출력
        inputChatData: function(list){
            let msg = {sender:null, senderType: null,  message:null};

            for (var i in list){
                msg.senderId = list[i].user.id;
                msg.sender = list[i].user.name;
                msg.message = list[i].content;

                if(msg.senderId == roomStatus.owner.id || msg.senderId == roomStatus.opponent.id){
                    discussChat.contributor(msg);
                }else{
                    watcherChat.contributor(msg);
                }
            }

            if(discussRoom.getStatus() == 4) chat.disconnect();
        },

    }

    // main
    function discussMain() {
        chat.connect(roomStatus.roomId);
        discussRoom.selectView();
    }

    $(document).ready(function(){
        if(joinedError) alert("참여 중이던 방으로 이동되었습니다")
    })

    discussMain();

</script>


<%@ include file="../layout/footer.jsp"%>