(function ($) {
    "use strict"

    $('#card-banner3').on('click', function () {

        console.log("click");
        alert("개발 중인 기능입니다.");
    });

    $('#card-banner4').on('click', function () {
       alert("개발 중인 기능입니다.");
    });

    $("#chat_btn, #card-banner2").on('click', function showPopUp() {
        const width = 1000;
        const height = 700;

        const left = (window.screen.width / 2) - (width/2);
        const top = (window.screen.height / 4);

        const windowStatus = 'width='+width+', height='+height+', left='+left+', top='+top+', scrollbars=yes, status=yes, resizable=yes, titlebar=yes';

        const url = "http://172.16.143.33:9090/chat";
        // const url = "http:192.168.43.165:9090/chat"; // 기숙사


        window.open(url, "popup", windowStatus);
    });
})(jQuery);