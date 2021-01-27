
<style>
    /*모달 css*/
    .warn_modal{
        position: fixed; top: 0px; left: 0px; z-index: 10; width: 100%; height: 100%; background-color: #30303031;
    }
    .warn_modal_center{
        position: relative;
        top: 30%;
        margin: 0 auto;
        transform: translateY(-20%);
        width: fit-content;
        height: fit-content;
    }
    .warn_modal_container{
        color: #616060;
        background-color: white;
        box-shadow: 0px 3px 6px #00000029;
        border: 1px solid rgb(185, 185, 185);
        border-radius: 5px;
        padding: 2.5rem;
    }
    .warn_modal_title{

        font-size: 2rem;
        font-weight: 600;
        margin-bottom: 2rem;
    }
    .warn_modal_body{
        min-width: 30rem;
        max-width: 40rem;
        max-height: 40rem;
        text-align: center;
        font-size: 1.7rem;
        font-weight: 500;

        overflow-wrap: anywhere;
        overflow-y: auto;

        margin: 1rem;
    }
    .warn_modal_footer{
        text-align: right;
    }
    .warn_modal_footer span{
        font-size: 1.8rem;
    }
</style>

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

<script>

    function myModal (modalId){
        this.id = modalId;

        document.querySelector(".warn_modal").addEventListener("click", function(event){
            event.preventDefault();
            if(event.target.id == this.id){
                document.querySelector("#warn_disscuss").classList.remove("show");
            }
        });

        return {
            show : function(){
                document.querySelector("#warn_disscuss").classList.add("show");},
            hidden: function(){
                document.querySelector("#warn_disscuss").classList.remove("show");
            },
            event: function(tartgetId, handler){
                document.getElementById(tartgetId).addEventListener("click", function(){
                    handler();
                    this.onclick = null;
                    // this.removeEventListener("click", arguments.callee);
                });
            },
            msg: function(msg, handler){
                document.querySelector(".warn_modal_body").innerHTML = msg;
                this.event("warnModalBtn", handler);
                this.show();
            }
        }
    };
</script>



