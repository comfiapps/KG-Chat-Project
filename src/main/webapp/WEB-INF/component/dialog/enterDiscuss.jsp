<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<style>

    .chatting .modal-dialog{
        width: 250px;
    }
    .chatting .modal{
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

<script>

    $(document).ready(function(){
        $("#enterDiscusser").on("click", (event)=>{
            $("#enter").removeClass("show");
        });

        $("#enterWatcher").on("click", (event)=>{
            $.ajax({
                type:"POST",
                url:"/api/room/enter/"+token

            }).done(response => {
                console.log("성공", response);
                if (response.data === 1){
                    location.href="/discuss/" + channel;
                }else{
                    alert("이미 다른 사용자가 참여하셨습니다.");
                    $("#enter").removeClass("show");
                }
            }).fail(error => {
                console.log("error.....");
            });

        });
    });

</script>

<div class="modal fade2" id="enter">
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