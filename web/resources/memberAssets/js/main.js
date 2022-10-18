
(function ($) {
    "use strict";


    /*==================================================================
    [ Focus input ]*/
    $('.input100').each(function(){
        $(this).on('blur', function(){
            if($(this).val().trim() != "") {
                $(this).addClass('has-val');
            }
            else {
                $(this).removeClass('has-val');
            }
        })    
    })
  
  
    /*==================================================================
    [ Validate ]*/
    let input = $('.validate-input .input100');

    $('.validate-form').on('submit',function(){
        var check = true;

        for(var i=0; i<input.length; i++) {
            if(validate(input[i]) == false){
                showValidate(input[i]);
                check=false;
            }
        }

        return check;
    });


    $('.validate-form .input100').each(function(){
        $(this).focus(function(){
           hideValidate(this);
        });
    });

    function validate (input) {
        if($(input).attr('type') == 'email' || $(input).attr('name') == 'email') {
            if($(input).val().trim().match(/^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{1,5}|[0-9]{1,3})(\]?)$/) == null) {
                return false;
            }
        }
        else {
            if($(input).val().trim() == ''){
                return false;
            }
        }
    }

    function showValidate(input) {
        var thisAlert = $(input).parent();

        $(thisAlert).addClass('alert-validate');
    }

    function hideValidate(input) {
        var thisAlert = $(input).parent();

        $(thisAlert).removeClass('alert-validate');
    }
    
    /*==================================================================
    [ Show pass ]*/
    let showPass = 0;
    $('.btn-show-pass').on('click', function(){
        if(showPass == 0) {
            $(this).next('input').attr('type','text');
            $(this).find('i').removeClass('zmdi-eye');
            $(this).find('i').addClass('zmdi-eye-off');
            showPass = 1;
        }
        else {
            $(this).next('input').attr('type','password');
            $(this).find('i').addClass('zmdi-eye');
            $(this).find('i').removeClass('zmdi-eye-off');
            showPass = 0;
        }
        
    });

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
                    alert("껒이세요.");
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
                    alert("사용 가능한 닉네임입니다.");
                    $('.nick-dup-chk').find('i').removeClass('zmdi-check');
                    $('.nick-dup-chk').find('i').addClass('zmdi-check-circle');
                    nickDupChk = 1;
                    if(idDupChk === 1 && nickDupChk === 1) {
                        $('.btn-control').removeAttr('disabled');
                    }
                } else {
                    alert("껒이세요.")
                    nickDupChk = 0;
                }
            }
        })
    });

    /*==================================================================
    [login ajax]*/
    $('#login-submit-btn').on('click', function () {
        $.ajax({
          url : "member/login",
          method : "POST",
          cache : false,
          data : {
              "memberId" : $('.login-id-val').val(),
              "memberPass" : $('.login-pass-val').val(),
          },
          success(result) {
              if(result === "OK") {
                  location.href = "/";
              } else {
                  alert("유효하지 않은 ID 또는 Password 입니다. 다시 시도해주십시오.");
              }
          }
        })
    });


})(jQuery);