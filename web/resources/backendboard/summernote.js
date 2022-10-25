$(document).ready(function() {

    var buttons = $.summernote.options.buttons;

    $.summernote.options.toolbar.push([
        'CustomButton',
        [
            'codeblocks',
        ],
    ]);


    var codeblocks = function (context) {
        var ui = $.summernote.ui;
        var boxing = '<div class="border border-secondary rounded-3">IDE의 코드를 붙혀넣어주세요.</div><br><br><p>계속</p>'

        var button = ui.button({
            contents: '<i class="bi bi-code"> code',
            tooltip: 'codeblock',
            click: function () {
                $('.summernote').summernote('code', boxing);
                alert("Archivist는 Intellij의 사용을 권장합니다. 다른 IDE 유저는 하이라이터 기능이 동작하지 않습니다.");
            }
        });
        return button.render();
    }

    $('.summernote').summernote({
        height: 300,                 // 에디터 높이
        minHeight: null,             // 최소 높이
        maxHeight: null,             // 최대 높이
        focus: true,                 // 에디터 로딩후 포커스를 맞출지 여부
        codemirror: {
            theme: 'monokai'
        },
        toolbar: [
            ['style', ['style']],
            ['font', ['bold', 'underline', 'clear']],
            ['fontname', ['fontname']],
            ['color', ['color']],
            ['para', ['ul', 'ol', 'paragraph']],
            ['table', ['table']],
            ['mybutton', ['codeblocks']],
            ['view', ['fullscreen', 'codeview', 'help']],
        ],
        buttons: {
            codeblocks: codeblocks,
        }
    });
});