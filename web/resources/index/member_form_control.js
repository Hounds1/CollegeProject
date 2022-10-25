
(function ($) {
    "use strict";

    /*==================================================================
    [ Id Duplicate Check ]*/
    let idDupChk = 0;

    $('.id-dup-chk').on('click', function () {
        console.log("click");
        $.ajax({
            url:"/member/idDupChk",
            method: "POST",
            data: {
                "targetId" : $('#memberId').val(),
            },
            cache : false,
            success(result) {
                if(result === "OK") {
                    alert("사용 가능한 아이디입니다.");
                    $('.id-dup-chk').find('i').removeClass('zmdi-check');
                    $('.id-dup-chk').find('i').addClass('zmdi-check-circle');
                    idDupChk = 1;
                    if(idDupChk === 1 && nickDupChk === 1) {
                        $('.btn-control').removeAttr('disabled');
                    }
                } else {
                    alert("이미 존재하는 아이디입니다.");
                    idDupChk = 0;
                }
            }
        })
    });

    /*==================================================================
    [ Nick Duplicate Check ]*/
    let nickDupChk = 0;
    $('.nick-dup-chk').on('click' , function () {
        console.log("click");
        $.ajax({
            url : "/member/nickDupChk",
            method: "POST",
            data : {
                "targetNick" : $('#memberNick').val(),
            },
            cache: false,
            success(result) {
                if(result === "OK") {
                    alert("사용 가능한 닉네임 입니다.");
                    $('.nick-dup-chk').find('i').removeClass('zmdi-check');
                    $('.nick-dup-chk').find('i').addClass('zmdi-check-circle');
                    nickDupChk = 1;
                    if(idDupChk === 1 && nickDupChk === 1) {
                        $('.btn-control').removeAttr('disabled');
                    }
                } else {
                    alert("이미 존재하는 닉네임 입니다.")
                    nickDupChk = 0;
                }
            }
        })
    });

    /*==================================================================
    [login ajax]*/
    $('#login-submit-btn').on('click', function () {
        console.log("click");
        $.ajax({
            url : "/member/login",
            method : "POST",
            cache : false,
            data : {
                "memberId" : $('.login-id-val').val(),
                "memberPass" : $('.login-pass-val').val(),
            },
            success(result) {
                if(result === "OK") {
                    location.href = window.location.href;
                } else {
                    alert("유효하지 않은 ID 또는 Password 입니다. 다시 시도해주십시오.");
                }
            }
        })
    });

    /*==================================================================
    [Sign up ajax]*/
    $('.btn-control').on('click', function () {
        $.ajax({
            url : "/member/new_account",
            method : "POST",
            cache : false,
            data : {
                "memberId" : $('#memberId').val(),
                "memberNick" : $('#memberNick').val(),
                "memberPass" : $('#memberPass').val(),
            },
            success(result) {
                if(result === "OK") {
                    location.href = window.location.href;
                }
            },
            error() {
                alert("다시 시도해 주십시오.");
            }
        });
    });


})(jQuery);