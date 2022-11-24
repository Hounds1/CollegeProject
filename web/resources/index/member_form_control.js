
(function ($) {
    "use strict";

    /*==================================================================
    [ Id Duplicate Check ]*/
    let idDupChk = 0;

    $('.id-dup-chk').on('click', function () {
        if($('#memberId').val().indexOf("@") > -1) {
            $.ajax({
                url: "/member/idDupChk",
                method: "POST",
                data: {
                    "targetId": $('#memberId').val(),
                },
                cache: false,
                success(result) {
                    if (result === "OK") {
                        alert("사용 가능한 아이디입니다.");
                        $('.id-dup-chk').find('i').removeClass('zmdi-check');
                        $('.id-dup-chk').find('i').addClass('zmdi-check-circle');
                        idDupChk = 1;
                        if (idDupChk === 1 && nickDupChk === 1) {
                            $('.btn-control').removeAttr('disabled');
                        }
                    } else {
                        alert("이미 존재하는 아이디입니다.");
                        idDupChk = 0;
                    }
                }
            })
        } else {
            alert("이메일 형식이 아닙니다.");
        }
    });

    /*==================================================================
    [ Nick Duplicate Check ]*/
    let nickDupChk = 0;
    $('.nick-dup-chk').on('click' , function () {
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
                    alert("유효하지 않거나 인증되지 않은 아이디입니다.");
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
                    alert("이메일 인증 후 로그인 해주십시오.");
                    location.href = window.location.href;
                }
            },
            error() {
                alert("다시 시도해 주십시오.");
            }
        });
    });

    /*==================================================================
    [Send email ajax]*/

    $('.btn-send-email').on('click', function () {
        $.ajax({
           url: "/member/forgot_password",
           type: "POST",
           cache: false,
           data: {
               "memberId" : $('#targetId').val()
           },
           success: result => {
               console.log(result);
               alert("인증번호가 전송되었습니다.");
               $('.btn-send-email').find('i').removeClass('zmdi-email');
               $('.btn-send-email').find('i').addClass('zmdi-email-open');
           },
            error: e => {
               console.log(e);
            }
        });
    });

    /*==================================================================
    [serialNum check ajax]*/
    $('.btn-send-serial').on('click', function () {
       if(!$('#targetId').val().isEmpty && !$('#serial-number').val().isEmpty) {
           $.ajax({
               url: "/member/token_check",
               type: "POST",
               cache: false,
               data: {
                   "memberId": $('#targetId').val(),
                   "token": $('#serial-number').val()
               },
               success: result => {
                   if (result === "OK") {
                       alert("비밀번호가 초기화되었습니다.");
                       location.href = "/";
                   } else if(result === "Fail"){
                       alert("잘못 된 시리얼 넘버입니다. 다시 입력해주십시오.")
                   }
               },
               error: e => {
                   console.log(e);
               }
           });
       } else {
           alert("입력 된 값이 없습니다.");
       }
    });

})(jQuery);