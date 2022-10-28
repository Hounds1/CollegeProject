$(document).ready(function () {

    $('.edit-target').on('click', function (e) {
        $.ajax({
            url: "/back/commenteditor",
            type: "POST",
            cache: false,
            data: {
                "targetId": e.target.id,
            },
            success: result => {
                const details = result.commentDetail
                $('#comment-edit-form').text(details);
                $('#comment-edit-num').attr('value', result.commentNum);
            }
        });
    });

    $('.btn-close').on('click', function () {
        $('#comment-edit-num').removeAttr('value');
        $('#comment-edit-form').text("");
    });

    $('.comment-edit-close').on('click', function () {
        $('#comment-edit-num').removeAttr('value');
        $('#comment-edit-form').text("");
    })
});