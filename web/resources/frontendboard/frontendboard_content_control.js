
(function ($) {
    "use strict";

    /*==================================================================
    [ Content Editor ajax]*/

    $('.content-editor-call').on('click', function (e) {
        alert("새 이미지를 등록하면 기존 이미지는 삭제됩니다.");

        let targetNum = e.target.id;
        console.log(targetNum);
        $.ajax({
            url: "/front/editor",
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

   //  /*==================================================================
   //  [ Content update ajax]*/
   //
   // $('#editor-submit-btn').on('click', function () {
   //     $.ajax({
   //         url: "/front/update",
   //         method: "POST",
   //         data: {
   //             "targetNum" : $('#editor-targetNum').val(),
   //             "contentTitle" : $('#editor-title').val(),
   //             "contentDetail" : $('#editor-summernote').val()
   //         },
   //         success(result) {
   //             if(result === "OK") {
   //                 location.href = window.location.href;
   //             }
   //         },
   //         error() {
   //             alert("테스트 실패");
   //         }
   //     });
   // });


})(jQuery);