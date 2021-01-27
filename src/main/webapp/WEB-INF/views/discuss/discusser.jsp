<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/chat.css">

<style>
    div{box-sizing: border-box; }


    .chatting .modal-dialog{
        width: 250px;
    }
    .chatting .modal{
        display: flex;
        justify-content: center;
        background-color: #30303031;;
    }
    .chatting .modal-content{
        height: 110px;
    }
    .chatting .modal-content .modal-header{
        height: 30px;
    }
    .chatting .modal-content .modal-footer{
        height: 80px;
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

                    <div class="score_bar hidden">
                        <div class="score_bar_right">
                            <div class="score_bar_left"></div>
                        </div>
                    </div>

                </div>
                <div class="closeBtnArea hidden">
                    <div class="lineBtn">
                        <div class="line"></div>
                        <div class="line"></div>
                        <div class="line"></div>
                    </div>
                    <div class="closeContent hidden">
                        <div class="closeTitle">
                            토론에서 나가기
                        </div>
                        <div class="divider w-100"></div>
                        <div class="closeBtn">
                            <button class="mdc-button mdc-button--raised no-outline" type="button" id="endBtn"><span class="mdc-button__label">나가기</span></button>
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
                    <div class="titleName"></div>
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


    <%--경고 창 대신 사용할 모달창--%>
    <div class="warn_modal fade2" id="warn_disscuss">
        <div class="warn_modal_center">
            <div class="warn_modal_container">
                <div class="warn_modal_title">
                    알림 메시지:
                </div>
                <div class="warn_modal_body">
                    아직 상대편 토론자가 아직 준비되지 않았습니다.
                </div>
                <div class="warn_modal_footer">
                    <button class="mdc-button no-outline" id="warnModalBtn">
                        <span class="mdc-button__label">확인</span>
                    </button>
                </div>
            </div>
        </div>
    </div>


    <div class="modal fade2 hidden" id="enter">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header border-bottom-0">
                    <h5 class="modal-title">토론자로 참여하기</h5>
                </div>
                <div class="modal-footer border-top-0">
                    <button id="enterDiscusser" class="mdc-button no-outline" data-dismiss="modal"/>
                    <span class="mdc-button__ripple"></span>
                    <span class="mdc-button__label">취소</span>
                    </button>
                    <button id="enterWatcher" class="mdc-button mdc-button--raised no-outline">
                        <span class="mdc-button__label">확인</span>
                    </button>
                </div>
            </div>
        </div>
    </div>


<%--    <%@ include file="../../component/dialog/enterDiscuss.jsp"%>--%>
</section>

<script>
    let socket;
    let stompClient;

    const joinedError = "${joinedError}";
    const user = {id: "${principal.user.id}", name:"${principal.user.name}"};

    let roomStatus = ${room};
    let endDiscuss = ${endDiscuss};
    let myVote = ${myVote};

    let chatAble = false;
    let transData = {'message': null, 'messageType': null, 'sendTime': null,};
    let modal;

</script>
<script src="${pageContext.request.contextPath}/js/discussRoom.js"></script>
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

    function myModal (tagId){
        let id = tagId;
        let modalHandler;

        document.querySelector("#"+id).addEventListener("click", function(event){
            event.preventDefault();
            if(event.target.id == id){
                document.querySelector("#"+id).classList.remove("show");
                if(modalHandler != undefined) modalHandler();
            }
        });

        return {
            show : function(){
                document.querySelector("#"+id).classList.add("show");},
            hidden: function(){
                document.querySelector("#"+id).classList.remove("show");
            },
            event: function(tartgetId, handler){
                modalHandler = handler;
                document.getElementById(tartgetId).addEventListener("click", function(){
                    this.onclick = null;
                    handler();
                });
            },
            msg: function(msg, handler){
                modalHandler = handler;
                document.querySelector(".warn_modal_body").innerHTML = msg;
                this.event("warnModalBtn", handler);
                this.show();
            }
        }
    };


    $(document).ready(function(){
        $("#enterDiscusser").on("click", (event)=>{
            $("#enter").removeClass("show");
            $("#enter").addClass("hidden");
        });

        $("#enterWatcher").on("click", (event)=>{
            $.ajax({
                type:"POST",
                url:"/api/room/enter/"+roomStatus.roomId
            }).done(response => {
                console.log("성공", response);
                if (response.data === 1){
                    location.href="/discuss/" + roomStatus.roomId;
                }else{
                    modal.msg("이미 다른 사용자가 참여하셨습니다.", function(){modal.hidden(); $("#enter").removeClass("show"); $("#enter").addClass("hidden")})
                    // alert("이미 다른 사용자가 참여하셨습니다.");

                }
            }).fail(error => {
                console.log("error.....");
            });
        });
    });

    // main
    function discussMain() {
        modal = myModal("warn_disscuss");
        if(joinedError) modal.msg("참여 중이던 방으로 이동되었습니다", modal.hidden);
        $(".titleName").html(roomStatus.roomName);
        discussChat.getChatting();
        if(!endDiscuss) chat.connect(roomStatus.roomId);
        discussRoom.selectView();
    }
    discussMain();

</script>

<%@ include file="../layout/footer.jsp"%>