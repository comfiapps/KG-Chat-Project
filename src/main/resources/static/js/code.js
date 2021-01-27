let code = {
    init: function() {

        $(".code-content input").keyup(function (e) {
            if(e.keyCode === 8) $(this).prev('.fd-code').select().val("");
            else if (this.value.length === this.maxLength) {
                $(this).next('.fd-code').select();
                const codes = $("#code1").val() + $("#code2").val() + $("#code3").val() + $("#code4").val();

                if(codes.length === 4) {
                    if(pageInfo === "register") {
                        code.requestSign("/api/user/register", {
                            name: $("#name").val(),
                            email: $("#email").val(),
                            code: codes
                        })
                    } else if(pageInfo === "login") {
                        code.requestSign("/api/user/login", {
                            email: $("#email").val(),
                            code: codes
                        })
                    }
                }

            }
        });

    },

    requestSign: function (url, data) {
        $(".fd-code").attr("disabled", true);
        $(".backdrop2").css("display", "flex");

        $.ajax({
            type: "POST",
            url: url.toString(),
            data: JSON.stringify(data),
            contentType: "application/json; charset = utf-8",
            dataType: "json"

        }).done(response => {
            $(".backdrop2").css("display", "none");
            if(response.status === 200) {
                location.href = "/"

            } else if (response.status === 204) {
                $(".fd-code").attr("disabled", false).css("background-color", "red").css("color", "#fff");

                setTimeout(function(){
                    $(".fd-code").css("background-color", "white").css("color", "black");
                }, 1000);

            } else {
                $(".fd-code").attr("disabled", false);
            }

        }).fail(error => {
            $(".backdrop2").css("display", "none");
            alert(JSON.stringify(error))
        })
    },

}

code.init();