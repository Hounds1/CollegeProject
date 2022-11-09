$(document).ready(function () {

    "use strict";
    /*==================================================================
      [ Detail Page js ]*/

    const text = $('.lang-name-space').find('h4').text();


    if(text === "Node.js") {
      const replace = "/back/board?langname=" + text.replace("Node.js", "nodejs");
      const delBtn = "/back/delete?langname=" + text.replace("Node.js", "nodejs") + "&contentnum=" + $('#board_delete_btn').data('content')
      $('.board-home-btn').attr("href", replace);
      $('#board_delete_btn').attr("href", delBtn);
    } else {
      const replace = "/back/board?langname=" + text.replace("Java", "java")
            .replace("Python", "python")
            .replace("Umm lang", "ummlang")
            .replace("Ruby", "buby")
            .replace("Swift", "swift")
            .replace("Kotlin", "kotlin");

      const delBtn = "/back/delete?langname=" + text.replace("Java", "java")
          .replace("Python", "python")
          .replace("Umm lang", "ummlang")
          .replace("Ruby", "buby")
          .replace("Swift", "swift")
          .replace("Kotlin", "kotlin") + "&contentnum=" + $('#board_delete_btn').data('content');

      $('.board-home-btn').attr("href", replace);
      $('#board_delete_btn').attr("href", delBtn);
    }
});