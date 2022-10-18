
(function ($) {
    "use strict";

    /*==================================================================
    [Member Data Update Ajax]*/
    $('#member-info-submit').on('click', function () {
        console.log("click");
        $.ajax({
            url : "http://localhost:9090/member/info_update",
            method : "POST",
            cache : false,
            data : {
                "memberId" : $('#recipient-id').val(),
                "memberPass" : $('#recipient-pass').val(),
                "memberNick" : $('#recipient-nick').val(),
                "memberName" : $('#recipient-name').val(),
                "memberBirth" : $('#recipient-birth').val(),
                "memberPhoneNumber" : $('#recipient-phone').val(),
                "memberAddress" : $('#recipient-address').val(),
            },
            success(result) {
                if(result === "OK") {
                    alert("정보 수정 완료");
                    location.href = "/";
                }
            }
        });

    })

})(jQuery);