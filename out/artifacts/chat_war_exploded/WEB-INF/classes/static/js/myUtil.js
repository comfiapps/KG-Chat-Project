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

    defaultImg : function(img){
        return (img == '' || img == null)?"/image/user.png":img;
    },

    userCheck: function (user){
        return (user == null || user == '')?{id: "", name:"알수없음", image:"/image/user.png"}:user;
    }
}