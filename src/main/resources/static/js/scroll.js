let scroll = {
    init: function() {
        $(document).ready(function() {
            const c = new URL(location.href).searchParams.get("c");
            if(c === "w") $( "#tab_2" ).addClass("mdc-tab-indicator--active");
            else if(c === "d") $( "#tab_3" ).addClass("mdc-tab-indicator--active");
            else $( "#tab_1" ).addClass("mdc-tab-indicator--active");

            $( ".scrollmenu" ).each(function() {
                if($(this).scrollLeft() <= 0 ) $(this).find('#panLeft').hide();
                else $(this).find('#panLeft').show();

                if($(this).get()[0].scrollWidth - $( window ).width() <= $(this).scrollLeft()) $(this).find('#panRight').hide();
                else $(this).find('#panRight').show();
            });
        });

        $( window ).resize(function() {
            $( ".scrollmenu" ).each(function() {
                if($(this).scrollLeft() <= 0 ) $(this).find('#panLeft').hide();
                else $(this).find('#panLeft').show();

                if($(this).get()[0].scrollWidth - $( window ).width() <= $(this).scrollLeft()) $(this).find('#panRight').hide();
                else $(this).find('#panRight').show();
            });
        });

        $('.panner').on("click", function() {
            var data = $(this).data('scrollModifier');

            const parent_id = $(this).parent().attr('id');
            $('#' + parent_id).animate({
                scrollLeft: data > 0 ?
                    $('#' + parent_id).scrollLeft() + $( window ).width()
                    : $('#' + parent_id).scrollLeft() - $( window ).width()
            }, 200);
        });

        $('.scrollmenu').on("scroll", function() {
            if($(this).scrollLeft() <= 0 ) $(this).find('#panLeft').hide();
            else $(this).find('#panLeft').show();

            if($(this).get()[0].scrollWidth - $( window ).width() <= $(this).scrollLeft()) $(this).find('#panRight').hide();
            else $(this).find('#panRight').show();
        });
    },
}

scroll.init();