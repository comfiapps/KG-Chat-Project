//투표
let voteBoard = {
    active: function(id){

        this.voteEvent();
        switch (id){
            case 1: break;
            case 2: break;
            case 3:
            case 4: this.voteDisplay();
        }
    },
    voteEvent: function(){
        let vote = document.querySelectorAll(".user_vote");
        for(var i in vote){
            vote[i].onclick = function(event){
                if(!endDiscuss && roomStatus.endDebate != null){
                    let voteUser;
                    if(event.currentTarget.id == "vote_left"){
                        voteUser = roomStatus.owner.id;
                    }else{
                        voteUser = roomStatus.opponent.id;
                    }
                    chat.vote(voteUser);
                    console.log(endDiscuss);
                }
            }
        }
    },
    voteDisplay: function(){
        if(myVote == roomStatus.owner.id){
            $(".user_left .bg").addClass("select_vote");
            $(".user_right .bg").removeClass("select_vote");
        }else if(myVote == roomStatus.opponent.id){
            $(".user_left .bg").removeClass("select_vote");
            $(".user_right .bg").addClass("select_vote");
        }else{
            $(".user_left .bg").removeClass("select_vote");
            $(".user_right .bg").removeClass("select_vote");
        }
    },
    //투표 요청
    voteDiscuss: function(voteUser){
        if(roomStatus.owner.id == voteUser){
            // modal.msg(roomStatus.owner.name + "에게 투표하였습니다", modal.hidden);
            myVote = roomStatus.owner.id;
        }else if(roomStatus.opponent.id == voteUser){
            // modal.msg(roomStatus.opponent.name + "에게 투표하였습니다", modal.hidden);
            myVote = roomStatus.opponent.id;
        }else if(roomStatus.owner.id == -voteUser){
            // modal.msg(roomStatus.owner.name + "의 투표를 취소하셨습니다.", modal.hidden);
            myVote = 0;
        }else if(roomStatus.opponent.id == -voteUser){
            // modal.msg(roomStatus.opponent.name + "의 투표를 취소하셨습니다.", modal.hidden);
            myVote = 0;
        }
        this.voteDisplay();
        console.log("투표한 사람: ",  myVote)
    },
    //투표수 요청
    countVoteDiscuss: function(vote){
        roomStatus.countOwnerVote = vote.ownerVote;
        roomStatus.countOpponentVote = vote.opponentVote;
        scoreBoard.active(discussRoom.getStatus());
    },
}
