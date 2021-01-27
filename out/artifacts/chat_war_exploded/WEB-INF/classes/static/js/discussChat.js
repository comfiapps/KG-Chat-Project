//토론자 채팅
let discussChat = {
    active: function(id){
        //토론자라면 input열어주기
        chatAble = false;
        if((roomStatus.owner.id == user.id || roomStatus.opponent.id == user.id)) util.showArea("#discusser_msg_input");

        this.beginDiscussEvent();
        this.discusserInputEvent();

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
                chatAble = true;
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

    // 2-1.토론 시작 화면
    beginWin: function(){
        console.log("토론 시작 화면 호출");
        util.showAndHiddenArea(".discusser_box", ".discusser_area");
        util.showAndHiddenArea(".discusser_textArea", ".discusser_start_btn");

        discussChat.infoMsg("토론이 곧 시작됩니다.");
        let count = 3;
        (function(){
            let handler = setInterval(function(){
                if(count < 0){
                    clearInterval(handler);
                    discussRoom.selectView();
                    return;
                }
                if(count == 0){
                    discussChat.infoMsg("토론시작!");
                }else{
                    discussChat.infoMsg(count);
                }
                count--;
            },1000);
        })();
    },

    //토론방 토론자 채팅란에 메시지 보이기
    infoMsg: function(msg){
        util.hiddenArea(".discusser_area, .discusser_start_btn");
        util.showArea(".discusser_box", ".discusser_textArea");
        $(".discusser_textArea").html(msg);
    },

    //토론시작 이벤트
    beginDiscussEvent: function(){
        document.querySelector("#startBtn").onclick = function(){
            console.log("토론시작 버튼 클릭");
            chat.info(1);
        };
    },

    //메세지 띄우기 - 시청자는 시청자 화면, 토론자는 토론자 화면
    contributor: function (msg) {
        let divs = document.createElement("div");
        let html = "";
        let img;

        if(roomStatus.owner.id == msg.senderId){
            divs.setAttribute('class', "discusser_message_box message_left");
            img = util.defaultImg(roomStatus.owner.image);
        } else {
            divs.setAttribute('class', "discusser_message_box message_right");
            img = util.defaultImg(roomStatus.opponent.image);
        }

        html+= '    <div class="discusser_profile_area">';
        html+= '        <img src='+ img + ' alt="" class="profile">';
        html+= '    </div>';
        html+= '    <p class="discusser_content ">' + msg.message +' </p>';
        html+= '</div>';

        divs.innerHTML = html;
        $(".discusser_area").append(divs);
        util.scollMoving("#discusserBox", ".discusser_area", $("#discusserBox").innerHeight());
    },

    //알림 메시지 관련 부분
    endDiscuss : function(){

        if(roomStatus.countOwnerVote > roomStatus.countOpponentVote){
            modal.msg("토론이 종료되었습니다.<br>승자는 "+ roomStatus.owner.name + "입니다." ,modal.hidden);
        }else if(roomStatus.countOwnerVote < roomStatus.countOpponentVote){
            modal.msg("토론이 종료되었습니다.<br>승자는 "+ roomStatus.opponent.name + "입니다." ,modal.hidden);
        }else{
            modal.msg("토론이 종료되었습니다.<br>무승부 입니다." ,modal.hidden);
        }

        endDiscuss = "true";

        chat.disconnect();
    },

    //상대방 나감
    leaveOpponent: function(oppoentId){
        if(user.id == oppoentId){
            modal.msg("현재 토론방 참여를 취소하고 메인으로 돌아갑니다.", function(){location.href = "/";});
        }else{
            modal.msg("상대방 토론자가 현재 토론방을 나갔습니다.", function(){modal.hidden(); discussRoom.selectView();});
        }
    },

    //생성자 나감
    leaveOwner: function(){
        modal.msg("토론 생성자가 현재 토론방을 나갔습니다.", function(){location.href="/";});
    },

    //채팅입력 이벤트
    discusserInputEvent:function(){
        document.querySelector("#discusser_msg_input").onkeyup = (event) => {
            if (event.key === "Enter") {
                let msg = event.target.value;
                if (msg != "") {
                    event.target.value = "";
                    if(!endDiscuss && chatAble) chat.sendMessage(msg);
                }
            }
        };
    },
    
    //과거채팅 받아오기
    getChatting: function(){
        $.ajax({
            type:"GET",
            url: "/api/chat/"+roomStatus.roomId
        }).done(response=>{
            if(response.status == 200){
                if(response.data.length > 0){
                    discussRoom.inputChatData(response.data);
                }
            }
        })
    }
}
