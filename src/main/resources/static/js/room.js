let index = {
    init: function() {
        $("#createRoomBtn").on("click", () => {
            this.createRoom();
        });
    },

    createRoom: function () {
        let data = {
            name: $("#createRoom_name").val(),
            category: $("#createRoom_category").val()
        };

        $.ajax({
            type: "POST",
            url: "/api/room",
            data: JSON.stringify(data),
            contentType: "application/json; charset=utf-8",
            dataType: "json"

        }).done(response => {
            if(response.status === 200) {
                const id = response.data;
                location.href="/discuss/" + id;
            }

        }).fail(error => {
            alert(JSON.stringify(error));
        });

    }
}

index.init();