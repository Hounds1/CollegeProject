(function ($) {
    "use strict";

    /*==================================================================
    [ Content Editor ajax]*/

    $('.content-editor-call').on('click', function (e) {
        let targetNum = e.target.id;
        $.ajax({
            url: "/back/editor",
            method: "POST",
            data: {
              "targetNum" : targetNum,
            },
            success: result => {
                if($('#editor-title').val() != null) {
                    $('#editor-title').removeAttr('value');
                    $('#editor-title').attr('value', result.contentTitle);
                    $('#editor-summernote').empty();
                    $('#editor-summernote').summernote('code', result.contentDetail)
                    $('#editor-targetNum').removeAttr('value');
                    $('#editor-targetNum').attr('value', result.contentNum);
                } else {
                    $('#editor-title').attr('value', result.contentTitle);
                    $('#editor-summernote').summernote('code', result.contentDetail);
                    $('#editor-targetNum').attr('value', result.contentNum);
                }
            }
        });
    });

    /*==================================================================
    [ Content update ajax]*/

   $('#editor-submit-btn').on('click', function () {
       $.ajax({
           url: "/board/update",
           method: "POST",
           data: {
               "targetNum" : $('#editor-targetNum').val(),
               "contentTitle" : $('#editor-title').val(),
               "contentDetail" : $('#editor-summernote').val()
           },
           success(result) {
               if(result === "OK") {
                   location.href = window.location.href;
               }
           },
           error() {
               alert("테스트 실패");
           }
       });
   });


})(jQuery);