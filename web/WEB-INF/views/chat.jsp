<%--
  Created by IntelliJ IDEA.
  User: bae
  Date: 2022-10-29
  Time: 오전 12:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <h1 class="page-header">Chat</h1>

    <table class="table table-bordered">
        <tr>
            <td><input type="text" name="user" id="user" class="form-control" placeholder="유저명"></td>
            <td>
                <button type="button" class="btn btn-default" id="btnConnect">연결</button>
                <button type="button" class="btn btn-default" id="btnDisconnect" disabled>종료</button>
            </td>
        </tr>
        <tr>
            <td colspan="2"><div id="list"></div></td>
        </tr>
        <tr>
            <td colspan="2"><input type="text" name="msg" id="msg" placeholder="대화 내용을 입력하세요." class="form-control" disabled></td>
        </tr>
    </table>
</div>


<script src="https://code.jquery.com/jquery-3.6.1.js"
        integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
        integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
        integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz"
        crossorigin="anonymous"></script>
<script src="/resources/chat.js"></script>
</body>
</html>
