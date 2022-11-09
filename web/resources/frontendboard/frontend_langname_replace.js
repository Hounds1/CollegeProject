$(document).ready(function () {

    "use strict";

    const text = $('.lang-name-space').find('h4').text();

    if (text === "Vue.js") {
        const replace = "/front/board?langname=" + text.replace("Vue.js", "vuejs");
        const delBtn = "/front/delete?langname=" + text.replace("Vue.js", "vuejs") + "&contentnum=" + $('#board_delete_btn').data('content');

        $('.detail-home-btn').attr("href", replace);
        $('#board_delete_btn').attr("href", delBtn);
    } else {
        const replace = "/front/board?langname=" + text.replace("Java Script", "js")
            .replace("Type Script", "ts")
            .replace("React", "react")
            .replace("Angular", "angular");
        const delBtn = "/front/delete?langname=" + text.replace("Java Script", "js")
            .replace("Type Script", "ts")
            .replace("React", "react")
            .replace("Angular", "angular") + "&contentnum=" + $('#board_delete_btn').data('content');


        $('.detail-home-btn').attr("href", replace);
        $('#board_delete_btn').attr("href", delBtn);
    }

});