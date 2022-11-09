$(document).ready(function () {
    $('#qna_send_btn').on('click', function () {
        const rs = confirm('입력하신 이메일로 답변이 발송됩니다. 전송 하시겠습니까?' +
            '              * 문의내용은 관리자만 열람 할 수 있습니다.');

        if (rs) {
            $.ajax({
                url: "/qna/send",
                type: "POST",
                data: {
                    "qnaName": $('#qnaName').val(),
                    "qnaEmail": $('#qnaEmail').val(),
                    "qnaTitle": $('#qnaTitle').val(),
                    "qnaDetail": $('#qnaDetail').val()
                },
                cache: false,
                success: result => {
                    if (result === "OK") {
                        $('#qnaName').val('');
                        $('#qnaEmail').val('');
                        $('#qnaTitle').val('');
                        $('#qnaDetail').val('');
                        alert("메세지가 전송 되었습니다.");
                    }
                },
                error: e => {
                    alert("전송에 실패했습니다.")
                    console.log(e);
                }
            });
        }
    });
});