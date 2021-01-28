let user = {
    init: function() {
        $('.target_img').on('click', function (e) {
            $('#fileSelector').click();
        });

        $('#fileSelector').on('change', e => {
            if (e.target.files && e.target.files.length > 0) {
                const reader = new FileReader();
                reader.addEventListener('load', () => {
                    this.modify({
                        image:  reader.result
                    })
                });
                reader.readAsDataURL(e.target.files[0]);
            }
        });

        $('#nicknameInput').on('input', (e) => {
            if(updateForm_original_nick === e.target.value.trim()
                || e.target.value.trim().length <= 0) $("#nicknameSubmit").attr("disabled", true);
            else $("#nicknameSubmit").attr("disabled", false);
        });

        $('#emailInput').on('input', (e) => {
            if(updateForm_original_email === e.target.value.trim()
                || e.target.value.trim().length <= 0) $("#emailSubmit").attr("disabled", true);
            else $("#emailSubmit").attr("disabled", false);
        });

        $('#ageInput').on('input', (e) => {
            if(updateForm_original_age === e.target.value
                || e.target.value.length <= 0 || e.target.value.length > 2) $("#ageSubmit").attr("disabled", true);
            else $("#ageSubmit").attr("disabled", false);
        });

        $("input[name='genderInput']").on('input', (e) => {
            if(updateForm_original_gender.toString() === e.target.value) $("#genderSubmit").attr("disabled", true);
            else $("#genderSubmit").attr("disabled", false);
        });

        $('#nicknameSubmit').on('click', () => {
            this.modify({
                name:  $("#nicknameInput").val().trim()
            })
        });

        $('#emailSubmit').on('click', () => {
            this.emailRequest({
                email:  $("#emailInput").val().trim()
            })
        });

        $('#ageSubmit').on('click', () => {
            this.modify({
                ageRange:  $("#ageInput").val()
            })
        });

        $('#genderSubmit').on('click', () => {
            this.modify({
                gender:  $("input[name='genderInput']:checked").val()
            })
        });

        $('#emailCancel').on('click', () => {
            $("#codeInput").attr("disabled", true);
            $("#emailLabel").addClass("mdc-text-field--disabled");
            $("#emailSubmit").attr("disabled", false);
            document.getElementById("msgEmail").innerHTML = "";
        });

        $('#codeInput').on('input', (e) => {
           if(e.target.value.length == 6) {
               $('#codeSubmit').attr("disabled", false)
           }
        });

        $('#codeSubmit').on('click', () => {
            this.modify({
                email:  $("#emailInput").val().trim()
            }, $("#codeInput").val().trim());
        });

    },

    emailRequest: function (data) {
        $("#emailSubmit").attr("disabled", true);
        $("#codeInput").attr("disabled", true);

        document.getElementById("msgEmail").innerHTML = "";

        $.ajax({
            type:"POST",
            url:"/api/me/email",
            data:JSON.stringify(data),
            contentType: "application/json; charset = utf-8",
            dataType: "json"

        }).done(response => {
            if(response.status === 200) {
                document.getElementById("msgEmail").innerHTML = "이메일이 전송되었습니다";
                document.getElementById("msgEmail").style.color = "green";
                $("#codeInput").attr("disabled", false);
                $("#emailLabel").removeClass("mdc-text-field--disabled");

            } else if(response.status === 1001) {
                document.getElementById("msgEmail").innerHTML = "이메일이 이미 사용 중입니다";
                document.getElementById("msgEmail").style.color = "red";

            } else {
                document.getElementById("msgEmail").innerHTML = "이메일이 전송에 실패했습니다";
                document.getElementById("msgEmail").style.color = "red";
            }

        }).fail(error => {
            alert(JSON.stringify(error))

            $("#emailSubmit").attr("disabled", false);
        })
    },

    modify: function (data, code) {
        $("#nicknameSubmit").attr("disabled", true);
        $("#codeSubmit").attr("disabled", true);
        $("#ageSubmit").attr("disabled", true);
        $("#genderSubmit").attr("disabled", true);

        document.getElementById("msgCode").innerHTML = "";

        $.ajax({
            type:"POST",
            url:"/api/me" + (code ? "?code=" + code : ""),
            data:JSON.stringify(data),
            contentType: "application/json; charset = utf-8",
            dataType: "json"

        }).done(response => {
            if(response.status === 200) location.href = "/profile";
            else if(response.status === 1006) {
                document.getElementById("msgCode").innerHTML = "코드가 맞지 않습니다";
                document.getElementById("msgCode").style.color = "red";

            }

                }).fail(error => {
            alert(JSON.stringify(error))

            $("#nicknameSubmit").attr("disabled", false);
            $("#ageSubmit").attr("disabled", false);
            $("#genderSubmit").attr("disabled", false);
            $("#codeSubmit").attr("disabled", false);
        })
    }
}

user.init();