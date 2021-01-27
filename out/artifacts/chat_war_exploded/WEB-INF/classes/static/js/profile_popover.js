let popover = {
    init: function() {
        $(document).mouseup(function(e) {
            if (!$(".profile-popover").is(e.target) && $(".profile-popover").has(e.target).length === 0) {
                $(".profile-popover").hide();
            }
        });

        $('.popover-btn').on('click', function (e) {
            $(".profile-popover").css('display', 'flex');
        });
    },
}

popover.init();