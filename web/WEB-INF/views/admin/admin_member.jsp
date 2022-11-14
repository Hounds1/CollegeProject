<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: bae
  Date: 2022-10-17
  Time: 오전 12:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport"
        content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Member Control Panel</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
</head>
<body class="d-flex h-100 text-center text-bg-dark">

<div class="container d-flex w-100 h-100 p-3 mx-auto flex-column">
  <header class="mb-auto justify-content-center">
    <div>
      <h3 class="float-md-start mb-0">Archivist</h3>
    </div>
  </header>

  <main class="px-3">
    <h1>Member List</h1>
    <table class="table text-white mt-5" id="member-table">
      <thead>
      <tr>
        <th scope="col">Number</th>
        <th scope="col">ID</th>
        <th scope="col">NickName</th>
        <th scope="col">Start Date</th>
        <th scope="col">Authority</th>
        <th scope="col">Control</th>

      </tr>
      </thead>
      <tbody>
      <c:forEach var="list" items="${list}">
        <tr>
          <th scope="row">${list.memberNum}</th>
          <td>${list.memberId}</td>
          <td>${list.memberNick}</td>
          <td><fmt:formatDate value="${list.memberRegDate}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
          <td>${list.memberAuthority}</td>
          <td><a href="/admin/drop_member?memberId=${list.memberId}" class="btn btn-danger text-white">Drop</a></td>
        </tr>
      </c:forEach>
      </tbody>
    </table>
  </main>

  <footer class="mt-5 text-white-50">
    <p>Create, Save, Reminiscence and Archivist.</p>
  </footer>
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
</body>
</html>
