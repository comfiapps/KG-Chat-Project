let room = {
    init: function() {
        $("#createRoomBtn").on("click", () => {
            this.createRoom();
        });

        $("#createRoom_name").on("input", (e) => {
            if(e.target.value.length <= 0) $("#createRoomBtn").attr("disabled", true);
            else $("#createRoomBtn").attr("disabled", false);
        });

        $(".searchInput").on("keyup", (event) => {
            if (event.key === "Enter") {
                this.search()
            }
        });

        $("#desktopSearchInput").on('input', (event) => {
            searchKeyword = event.target.value;
            $("#mobileSearchInput").val(searchKeyword)
        });

        $("#mobileSearchInput").on('input', (event) => {
            searchKeyword = event.target.value;
            $("#desktopSearchInput").val(searchKeyword)
        });

        $(".searchBtn").on("click", () => {
            this.search();
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
            } else if (response.status === 500) {
                const alreadyJoinedAlert = confirm("참여 중인 토론이 있습니다. 접속하시겠습니까?");
                if(alreadyJoinedAlert) location.href = "/discuss"
            }

        }).fail(error => {
            alert(JSON.stringify(error));
        });
    },

    search: function () {
        let trim = searchKeyword.trim();
        if(trim.length > 0) {
            let url = new URL(location.origin + "/search");
            url.searchParams.set('p', trim);
            location.href = url.href;
        }
    }
}

room.init();