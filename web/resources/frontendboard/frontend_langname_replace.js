$(document).ready(function () {

    "use strict";

    const text = $('.lang-name-space').find('h4').text();

    if(text === "Vue.js"){
        const replace = "/front/" + text.replace("Vue.js", "vuejs");
        $('.detail-home-btn').attr("href", replace);
    } else {
        const replace = "/front/" + text.replace("Java Script", "js")
            .replace("Type Script", "ts")
            .replace("React", "react")
            .replace("Angular", "angular");
        $('.detail-home-btn').attr("href", replace);
    }

});