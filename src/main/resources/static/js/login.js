let login = {
    init: function() {
        $('#email').on('input', (e) => {
            if(e.target.value.trim().length <= 0) $("#submit").attr("disabled", true);
            else $("#submit").attr("disabled", false);
        });

        $('#submit').on('click', () => {
            this.loginRequest($("#email").val().trim());
        });
    },

    loginRequest: function (data) {
        $("#submit").attr("disabled", true);

        $.ajax({
            type:"PUT",
            url:"/api/request/login/" + data,

        }).done(response => {
            if(response.status === 200) {
                $('.backdrop').css("display", "flex");
            } else if (response.status === 500) {
                if(confirm("가입이 안된 회원입니다. 신규 회원이십니까?")) location.href = "/register"

            }

        }).fail(error => {
            alert(JSON.stringify(error))
            $("#submit").attr("disabled", false);
        })
    },
}

login.init();