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
            if(updateForm_original_nick === e.target.value
                || e.target.value.length <= 0) $("#nicknameSubmit").attr("disabled", true);
            else $("#nicknameSubmit").attr("disabled", false);
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
            console.log(updateForm_original_nick)
            this.modify({
                name:  $("#nicknameInput").val()
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
    },

    modify: function (data) {
        $("#nicknameSubmit").attr("disabled", true);
        $("#ageSubmit").attr("disabled", true);
        $("#genderSubmit").attr("disabled", true);

        $.ajax({
            type:"POST",
            url:"/api/me",
            data:JSON.stringify(data),
            contentType: "application/json; charset = utf-8",
            dataType: "json"

        }).done(response => {
            if(response.status === 200) location.href = "/profile";

        }).fail(error => {
            alert(JSON.stringify(error))

            $("#nicknameSubmit").attr("disabled", false);
            $("#ageSubmit").attr("disabled", false);
            $("#genderSubmit").attr("disabled", false);
        })
    }
}

user.init();