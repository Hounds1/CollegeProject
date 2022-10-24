$(document).ready(function() {

    var buttons = $.summernote.options.buttons;

    $.summernote.options.toolbar.push([
        'CustomButton',
        [
            'codeblocks',
            'codehighlight',
        ],
    ]);


    var codeblocks = function (context) {
        var ui = $.summernote.ui;
        var boxing = '<pre><code class="target-box">Write here</code></pre></div>'

        var button = ui.button({
            contents: '<i class="bi bi-code"> code',
            tooltip: 'codeblock',
            click: function () {

                $('.summernote').summernote('code', boxing);
            }
        });
        return button.render();
    }

    var codehighlight = function (context) {
        var ui = $.summernote.ui;

        var button2 = ui.button({
            contents: '<i class="bi bi-fire">',
            tooltip: 'highlight',
            click: function () {
                codehigh($('.summernote').val());
            }
        });
        return button2.render();
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
            ['mybutton', ['codeblocks' , 'codehighlight']],
            ['view', ['fullscreen', 'codeview', 'help']],
        ],
        buttons: {
            codeblocks: codeblocks,
            codehighlight: codehighlight,
        }
    });
});