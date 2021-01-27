let register = {
    init: function() {
        $('#name').on('input', (e) => {
            if(e.target.value.trim().length <= 0 || $('#emailRegister').val().trim().length <= 0) $("#submit").attr("disabled", true);
            else $("#submit").attr("disabled", false);
        });

        $('#email').on('input', (e) => {
            if(e.target.value.trim().length <= 0 || $('#name').val().trim().length <= 0) $("#submit").attr("disabled", true);
            else $("#submit").attr("disabled", false);
        });

        $('#submit').on('click', () => {
            this.registerRequest($("#name").val().trim(), $("#email").val().trim());
        });
    },

    registerRequest: function (name, email) {
        $(".backdrop2").css("display", "flex");
        $("#submit").attr("disabled", true);

        $.ajax({
            type:"PUT",
            url:"/api/request/register/" + name + "/" + email,

        }).done(response => {
            $(".backdrop2").css("display", "none");
            if(response.status === 200) {
                $('.backdrop').css("display", "flex");
            } else if (response.status === 500) {
                if(confirm("이미 가입된 회원입니다. 로그인하시겠습니까?")) location.href = "/login"
            }

        }).fail(error => {
            $(".backdrop2").css("display", "none");
            alert(JSON.stringify(error))
            $("#submit").attr("disabled", false);
        })
    },
}

register.init();