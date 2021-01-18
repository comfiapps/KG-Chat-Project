let room = {
    init: function() {
        $("#createRoomBtn").on("click", () => {
            this.createRoom();
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