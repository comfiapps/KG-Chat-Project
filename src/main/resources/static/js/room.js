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

        const input = document.querySelector('input');

        $("#desktopSearchInput").addEventListener('input', (event) => {
            console.log(event.target.value)
            searchKeyword = event.target.value;
        });

        $("#mobileSearchInput").addEventListener('input', (event) => {
            console.log(event.target.value)
            searchKeyword = event.target.value;
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
        console.log("raw: " + searchKeyword)

        if(searchKeyword.trim().length > 0) {
            let url = new URL(location.origin + "/search");
            url.searchParams.set('p', searchKeyword);
            console.log(searchKeyword)
        }
    }
}

room.init();