//시청자 채팅
let watcherChat = {
    active: function(){
        if((roomStatus.owner.id != user.id && roomStatus.opponent.id != user.id))
            util.showArea("#watcher_msg_input");
        watcherChat.watcherInputEvent();
    },

    contributor: function(msg){
        let divs = document.createElement("div");
        let html = "";

        divs.setAttribute('class', "watcher_message_box");

        html += '    <div class="watcher_user_area"><strong>'+msg.sender+'</strong></div>';
        html += '    <div class="watcher_content">'+msg.message+'</div>';

        divs.innerHTML = html;
        $(".watcher_area").append(divs);

        util.scollMoving("#watcherBox ", ".watcher_area", $("#watcherBox").innerHeight());
    },

    //시청자 채팅입력 이벤트
    watcherInputEvent:function(){
        document.querySelector("#watcher_msg_input").onkeyup = (event)=>{
            if(event.key === "Enter"){
                let msg = event.target.value;
                if(msg != ""){
                    event.target.value = "";
                    chat.sendMessage(msg);
                }
            }
        };
    },
}
