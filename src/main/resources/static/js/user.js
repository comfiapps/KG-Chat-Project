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

        $('#nicknameSubmit').on('click', () => {
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
        })
    }
}

user.init();