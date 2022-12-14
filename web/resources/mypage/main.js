
(function ($) {
    "use strict";

    /*==================================================================
    [Member pass change ajax]*/
    let oldValChk = 0;

    $('.btn-old-pass-val-chk').on('click' , function () {
        $.ajax({
            url : "/member/changePassValChk",
            method : "POST",
            cache : false,
            data : {
                "passChangeId" : $('.pass-change-id').val(),
                "passValChk" : $('.old-pass-val').val(),
            },
            success(result) {
                if(result === "OK") {
                    $('.btn-old-pass-val-chk').find('i').removeClass('zmdi-check');
                    $('.btn-old-pass-val-chk').find('i').addClass('zmdi-check-circle');
                    oldValChk = 1;
                } else {
                    alert("기존 비밀번호를 다시 입력해주십시오.")
                    oldValChk = 0;
                }
            } ,
            error() {
                console.log("error")
            }
        });
    });

    $('.btn-new-pass-val-chk').on('click', function () {
        if($('.new-pass-val').val() === $('.new-pass-chk').val() && oldValChk === 1) {
            $('.btn-new-pass-val-chk').find('i').removeClass('zmdi-check');
            $('.btn-new-pass-val-chk').find('i').addClass('zmdi-check-circle');
            $('.change-btn-control').removeAttr('disabled');
        } else if(oldValChk === 0){
            alert("기존 비밀번호를 입력 후 체크버튼을 눌러주십시오.");
            $('.change-btn-control').attr('disabled');
        } else {
            alert("새 비밀번호가 일치하지 않습니다. 다시 입력해 주십시오.");
            $('.change-btn-control').attr('disabled');
        }
    });

    $('.change-btn-control').on('click', function () {
        $.ajax({
            url : "/member/changeNewPassVal",
            method : "POST",
            cache: false,
            data : {
                "passChangeId" : $('.pass-change-id').val(),
                "newPassVal" : $('.new-pass-val').val(),
            },
            success(result) {
                if(result === "OK") {
                    alert("새로운 비밀번호로 로그인 해주십시오.");
                    location.href = "http://localhost:9090/";
                }
            }, error() {
                console.log("error");
            }
        });
    });


    /*==================================================================
    [Member drop account]*/

    $('#member-delete-btn').on('click', function () {
       if($('#agree-delete').val() === "지금 탈퇴"){
           $.ajax({
              url : "/member/delete_account",
              type : "POST",
              data : {
                  "targetId" : $('#delete-target-member').val(),
              },
              success: result => {
                  if(result === "OK"){
                      alert("탈퇴가 완료되었습니다. 더 나은 개발자가 되시길 기원드립니다. 감사합니다.");
                      location.href = "/member/escape";
                  } else {
                      alert("삭제에 실패했습니다. 다시 시도해 주십시오.");
                  }
              }, error: e => {
                  alert("잠시 후 다시 시도해 주십시오.")
               }
           });
       } else {
           alert("'지금 탈퇴'를 입력해 주십시오.")
       }
    });

    /*==================================================================
    [Member personal information change ajax] None use */
    $('.pi-changer-btn').on('click', function () {
       $.ajax({
           url : "/member/personalInfoChange",
           method : "POST",
           cache : false,
           data : {
               "memberName" : $('#memberName').val(),
               "memberBirth" : $('#memberBirth').val(),
               "memberPhoneNumber" : $('#memberPhoneNumber').val(),
               "memberAddress" : $('#memberAddress').val(),
               "PIChangeId" : $('#PIChangeId').val(),
           },
           success(result) {
               if(result === "OK") {
                   alert("변경된 정보를 확인해 주십시오.");
                   location.href = "/member/mypage";
               }
           },
           error(e) {
               console.log(e);
           }
       });
    });


})(jQuery);