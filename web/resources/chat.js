const textarea = document.getElementById("messageWindow");
const webSocket = new WebSocket('ws://172.16.143.33:9090/chat');
// var webSocket = new WebSocket('ws://192.168.43.165:9090/chat');
const inputMessage = document.getElementById('inputMessage');
webSocket.onerror = function(event) {
    onError(event)
};
webSocket.onopen = function(event) {
    onOpen(event)
};
webSocket.onmessage = function(event) {
    onMessage(event)
};

function onMessage(event) {
    let message = event.data.split("|");
    let sender = message[0];
    let content = message[1];
    if (content == "") {

    } else {
        if (content.match("/")) {
            if (content.match(("/" + $("#chat_id").val()))) {
                let temp = content.replace("/" + $("#chat_id").val(), "(귓속말) :").split(":");
                if (temp[1].trim() == "") {
                } else {
                    $("#messageWindow").html($("#messageWindow").html() + "<p class='whisper'>"
                        + sender + content.replace("/" + $("#chat_id").val(), "(귓속말) :") + "</p>");
                }
            } else {
            }
        } else {
            if (content.match("!")) {
                $("#messageWindow").html($("#messageWindow").html()
                    + "<p class='chat_content fs-20'><b class='impress'>" + sender + " : " + content + "</b></p>");
            } else {
                $("#messageWindow").html($("#messageWindow").html()
                    + "<p class='chat_content fs-20'>" + sender + " : " + content + "</p>");
            }
        }
    }
}

function onOpen(event) {
    $("#messageWindow").html("<p class='chat_content'>채팅에 참여하였습니다." +
        "<br>* 입력되는 채팅은 일정기간 로그로 보관됩니다." +
        "<br>* 올바른 채팅 문화가 정착 될 수 있도록 도와주세요." + "</p>");
    webSocket.send("Bot" + "|" + $('#chat_id').val() + "님이 입장했습니다.");
}

function onError(event) {
    alert(event.data);
}

function send() {
    if (inputMessage.value == "") {
    } else {
        $("#messageWindow").html($("#messageWindow").html()
            + "<p class='chat_content fs-20 text-end border-bottom'>"+ inputMessage.value + "</p>");
    }
    webSocket.send($("#chat_id").val() + "|" + inputMessage.value);
    inputMessage.value = "";
}

function enterkey() {
    if (window.event.keyCode == 13) {
        send();
    }
}

$('#chat-box').setInterval(function() {
    var elem = document.getElementById('messageWindow');
    elem.scrollTop = elem.scrollHeight;
}, 0);