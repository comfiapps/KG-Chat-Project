
//1: 토론자 입장 전 대기 화면
//2: 토론자 입장 완료 및 토론 시작 전 화면
//3: 토론 중 화면
//4: 토론 종료 화면

//토론방 전체
let discussRoom = {

    active : function(selectNum){
        discussRoom.inputDiscusser();           //상태 상관없이 토론자 정보 넣기
        discussRoom.watcherScollViewEvent()     //
        discussRoom.endDiscussBtnEvent();
        //만약 opponent 정보가 없으면 참여하기 버튼 호출
        if(user.id != roomStatus.owner.id && roomStatus.opponent.id == '') {
            $("#enter").addClass("show");
            $("#enter").removeClass("hidden");
        }
        if(selectNum == 4) $(".closeBtnArea").addClass("hidden");
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
        discussRoom.active(selectNum);
    },

    //토론자 정보 입력
    inputDiscusser: function(){
        console.log('토론자 정보 입력')
        if(roomStatus.owner.id != ""){
            $(".user1_name").html(roomStatus.owner.name);
            $(".vote_box .user1_name").html(roomStatus.owner.name +" VOTE");
            $(".user1_img img").attr("src", util.defaultImg(roomStatus.owner.image));
        }

        if(roomStatus.opponent.id != ""){
            $(".user2_name").html(roomStatus.opponent.name);
            $(".vote_box .user2_name").html(roomStatus.opponent.name +" VOTE");
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
        //토론자만 보이게
        if(roomStatus.owner.id == user.id || roomStatus.opponent.id == user.id) $(".closeBtnArea").removeClass("hidden");

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
        //나가기 창 띄위기 용
        document.querySelector(".lineBtn").onclick=function(event){
            document.querySelector(".closeContent ").classList.toggle("hidden");
        };
        $(document).mouseup(function (e){
            if(!$(".closeBtnArea").is(e.target) && $(".closeBtnArea").has(e.target).length === 0){
                $(".closeContent").addClass("hidden");
            }
        });
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
    },
}

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