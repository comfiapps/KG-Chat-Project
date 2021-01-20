let room = {
    init: function() {
        $("#createRoomBtn").on("click", () => {
            this.createRoom();
        });

        $("#createRoom_name").on("input", (e) => {
            this.validateInput(e.target.value, $("#createRoom_category").val(), $("#sub_input").val());
        });

        $("#sub_input").on("input", (e) => {
            this.validateInput($("#createRoom_name").val(), $("#createRoom_category").val(), e.target.value);
        });

        $("#createRoom_category").on("change", (e) => {
            this.validateInput($("#createRoom_name").val(), e.target.value, $("#sub_input").val());
        });

        $(".searchInput").on("keyup", (event) => {
            if (event.key === "Enter") this.search();
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

    validateInput: function (name, select, custom) {


        if(select === "기타") {
            $("#sub_input").attr("disabled", false);
            $("#labelStyle").removeClass("mdc-text-field--disabled");

            if(name.length <= 0 || custom.length <= 0) $("#createRoomBtn").attr("disabled", true);
            else $("#createRoomBtn").attr("disabled", false);

        } else {
            $("#sub_input").attr("disabled", true);
            $("#labelStyle").addClass("mdc-text-field--disabled");

            if(name.length <= 0) $("#createRoomBtn").attr("disabled", true);
            else $("#createRoomBtn").attr("disabled", false);

        }
    },

    createRoom: function () {
        $("#createRoomBtn").attr("disabled", true)
        let data = {
            name: $("#createRoom_name").val(),
            category: $("#createRoom_category").val() === "기타" ? $("#sub_input").val() : $("#createRoom_category").val()
        }

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
                if(alreadyJoinedAlert) {
                    location.href = "/discuss"
                } else $("#createRoomBtn").attr("disabled", false);
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