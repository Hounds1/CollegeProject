$(document).ready(function () {

    "use strict";

    const text = $('.lang-name-space').find('h4').text();


    if(text === "Node.js") {
      const replace = "/back/" + text.replace("Node.js", "nodejs")
      $('.board-home-btn').attr("href", replace);
    } else {
      const replace = "/back/" + text.replace("Java", "java")
            .replace("Python", "python")
            .replace("Umm lang", "ummlang")
            .replace("Ruby", "buby")
            .replace("Swift", "swift")
            .replace("Kotlin", "kotlin");
      $('.board-home-btn').attr("href", replace);
    }
});