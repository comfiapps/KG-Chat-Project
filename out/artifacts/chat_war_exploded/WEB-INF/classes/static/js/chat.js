
//메세지  처리
let chat = {
    //웹 세션 연결 및 메시지 받기
    connect: function (destination) {
        socket = new SockJS("/ws");
        stompClient = Stomp.over(socket);
        stompClient.connect({}, function () {

            stompClient.subscribe('/user/queue/vote/'+ destination, function(e){
                let response = JSON.parse(e.body);
                if(response.status == 200) voteBoard.voteDiscuss(response.data);

            })

            //투표 카운트 정보
            stompClient.subscribe('/topic/getVoteCount/'+ destination, function(e){
                let response = JSON.parse(e.body);
                if(response.status == 200) voteBoard.countVoteDiscuss(response.data);

            })

            //입장 관려 처리 부분: opponent가 들어오면 값을 받아 입장 처리
            stompClient.subscribe('/topic/enter/' + destination, function (e) {
                roomStatus = JSON.parse(e.body);
                if (!endDiscuss) discussRoom.selectView();
            });

            //입력 값에 따라 기능시작 처리
            stompClient.subscribe('/topic/info/' + destination, function (e) {
                const response = JSON.parse(e.body);
                if(response.status == 200){
                    let oppoentId = roomStatus.opponent.id;
                    roomStatus = response.data.data;
                    switch (response.data.type){
                        case 1:
                            console.log("토론 시작 실행");
                            discussChat.beginWin();
                            return;
                        case 2:
                            console.log("토론 종료 실행");
                            discussChat.endDiscuss();
                            discussRoom.selectView();
                            break;
                        case 3:
                            console.log("상대방 나감");
                            discussChat.leaveOpponent(oppoentId);

                            break;
                        case 4:
                            console.log("토론 삭제 요청");
                            discussChat.leaveOwner();
                            discussRoom.selectView();
                            break;
                        default:
                            console.log("에러")
                            discussRoom.selectView();
                            break;
                    }

                }
            });
            // 채팅 메시지 부분
            stompClient.subscribe('/topic/msg/' + destination, function (e) {
                let response = JSON.parse(e.body);
                if( response.senderId == roomStatus.owner.id || response.senderId == roomStatus.opponent.id){
                    discussChat.contributor(response);
                }else{
                    watcherChat.contributor(response);
                }
            });

            chat.enter();
        });
    },

    disconnect: function(){
        console.log("연결종료");
        stompClient.disconnect();
    },

    //info 메시지 보내기
    // 요청값
    // 1 : 채팅 시작
    // 2 : 채팅 종료
    // 3 : 채팅 나가기

    // 응답값
    // 1 : 채팅 시작
    // 2 : 채팅 종료
    // 3 : 상대방 나감
    // 4 : 토론 삭제 요청
    // 5 : 에러

    getVoteCount: function(){
        if(stompClient.connected) stompClient.send("/app/chat/voteCount",{}, "");
    },
    vote: function(voteUserId){
        if(!endDiscuss) stompClient.send("/app/chat/vote",{}, voteUserId);
    },
    info: function (msg) {
        if(!endDiscuss) stompClient.send("/app/chat/info", {}, JSON.stringify({type:msg}));
    },

    //상대방 토론자 입장 메시지 보내기
    enter: function () {
        if (user.id == roomStatus.opponent.id){
            stompClient.send("/app/chat/enter", {}, "");
        }
    },
    //일반 메시지 보내기
    sendMessage: function (msg) {
        if(!endDiscuss){
            transData.sendTime = new Date();
            transData.message = msg;
            transData.messageType = "text";
            stompClient.send("/app/chat/msg", {}, JSON.stringify(transData));
        }
    },
}

