//스코어
let scoreBoard = {
    active: function(id){
        console.log("화면선택: ", id);
        scoreBoard.scoreValue(roomStatus.countOwnerVote, roomStatus.countOpponentVote);
        scoreBoard.scoreBar(roomStatus.countOwnerVote, roomStatus.countOpponentVote);
        switch (id){
            case 1:
            case 2:
                this.socreBareShow(true);
                break;
            case 3:
            case 4:
                this.timer(roomStatus.endDebate, 7, this.timeIn, this.timeOut);
                this.socreBareShow(false);
                break;
        }
    },

    socreBareShow : function(boolean){
        if(boolean) $(".score_bar").addClass("hidden");
        else $(".score_bar").removeClass("hidden");
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

    //타이머 - 현재시간과 종료시간을 넘어간 경우에는 토론 종료, 아닐 시에는 시계 값 바꿈,
    timer: function(time, additionalTime, timeInCallback, timeOutCallback){

        if(time == null || time == '') $(".time").html("00:00");
        else if(endDiscuss) $(".time").html("토론종료");
        else{
            let handler = setInterval(function(){
                var diff = moment(time).diff(moment(new Date()))/1000+additionalTime;
                if(diff <= 0){
                    clearInterval(handler)
                    $(".time").html("토론종료");
                    if(roomStatus.owner.id == user.id) chat.info(2);
                    return;
                }else{
                    if(endDiscuss){
                        $(".time").html("토론종료");
                        clearInterval(handler);
                        endDiscuss = true;
                    }else{
                        $(".time").html(scoreBoard.timeFormat(diff));
                    }
                }
            }, 1000);
        }
    },

    //초형태의 숫자 데이터를 받아 MM:ss의 형태로 문자열 데이터 반환
    timeFormat: function(diff){
        if(diff == 0) return "00:00";
        var min = parseInt(diff/60)+"";
        var sec = parseInt(diff%60)+"";
        return (min.length<2? ("0"+min):min) + " : " + (sec.length<2? ("0"+sec):sec);
    },

}
