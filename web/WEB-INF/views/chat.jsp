<%--
  Created by IntelliJ IDEA.
  User: Student
  Date: 2022-10-13
  Time: 오전 11:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Archivist</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <%--    <!-- Favicons -->--%>
    <%--    <link href="assets/img/favicon.png" rel="icon">--%>
    <%--    <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">--%>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
          rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
    <link href="assets/vendor/aos/aos.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
    <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/sidebars.css" rel="stylesheet">
</head>

<body>


<main id="main">

    <!-- ======= Contents Section ======= -->
    <section id="live-chat" class="services mb-5">
        <div class="container">
            <div class="section-title" data-aos="fade-up" data-aos-delay="100">
                <h2>Live Chat</h2>
            </div>

            <div class="row" data-aos="fade-up" data-aos-delay="200">
                <!-- 로그인한 상태일 경우와 비로그인 상태일 경우의 chat_id설정 -->
                <c:if test="${(sessionScope.member.memberId ne '') and !(empty sessionScope.member.memberId)}">
                    <input type="hidden" value='${sessionScope.member.memberNick}' id='chat_id' />
                </c:if>
                <c:if test="${(sessionScope.member.memberId eq null) or (empty sessionScope.member.memberId)}">
                    <input type="hidden" value='<%=session.getId().substring(0, 6)%>'
                           id='chat_id' />
                </c:if>
                <!-- 채팅창 -->
                <div id="chat-box"  class="border border-secondary rounded-3" style="width: 100%; margin: auto; overflow: scroll">
                    <fieldset class="p-2">
                        <div id="messageWindow" class="p-2"></div>
                        <br /> <input class="form-control me-2" placeholder="메세지를 입력해주세요." id="inputMessage" type="text" onkeyup="enterkey()" style="width: 700px; float: left" />
                        <input class="btn btn-secondary" style="float: left;" type="submit" value="send" onclick="send()" />
                    </fieldset>
                </div>
            </div>
        </div>
    </section><!-- End Contents Section -->
</main>
<!-- End #main -->



<script src="https://code.jquery.com/jquery-3.6.1.js"
        integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
        integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
        integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz"
        crossorigin="anonymous"></script>
<


<!-- Vendor JS Files -->
<script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
<script src="assets/vendor/aos/aos.js"></script>
<script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
<script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
<script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
<script src="assets/vendor/php-email-form/validate.js"></script>

<!-- Template Main JS File -->
<script src="assets/js/main.js"></script>
<script src="assets/js/sidebars.js"></script>
<script src="index/member_form_control.js"></script>
<script src="/resources/chat.js"></script>
</body>

</html>
