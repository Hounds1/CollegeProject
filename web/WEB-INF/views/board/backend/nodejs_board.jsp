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

    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="memberAssets/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="memberAssets/fonts/iconic/css/material-design-iconic-font.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="memberAssets/vendor/animate/animate.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="memberAssets/vendor/css-hamburgers/hamburgers.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="memberAssets/vendor/animsition/css/animsition.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="memberAssets/vendor/select2/select2.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="memberAssets/vendor/daterangepicker/daterangepicker.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="summernote/summernote-lite.css">
    <link rel="stylesheet" type="text/css" href="memberAssets/css/util.css">
    <link rel="stylesheet" type="text/css" href="memberAssets/css/main.css">
    <!--===============================================================================================-->
    <!-- include codemirror (codemirror.css, codemirror.js, xml.js, formatting.js) -->
    <link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/codemirror.css">
    <link rel="stylesheet" type="text/css" href="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/theme/monokai.css">

</head>

<body>

<!-- ======= Header ======= -->
<header id="header" class="fixed-top header-transparent bg-dark">
    <div class="container d-flex align-items-center justify-content-between">

        <div class="logo">
            <h1 class="text-light"><a href="#" data-bs-toggle="offcanvas" data-bs-target="#offcanvasScrolling"
                                      aria-controls="offcanvasScrolling"><span class="fs-2">Archivist</span></a></h1>
            <!-- Uncomment below if you prefer to use an image logo -->
            <!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
        </div>

        <nav id="navbar" class="navbar">
            <ul>
                <li><a class="nav-link scrollto" href="/">Home</a></li>
                <li><a class="nav-link scrollto" href="#nodejs">Node.js</a></li>
                <li><a class="nav-link scrollto" href="#node-js-contents">Contents</a></li>
                <li class="dropdown"><a href="#"><span>Boards</span> <i class="bi bi-chevron-down"></i></a>
                    <ul>
                        <li class="dropdown"><a href="#"><span>FrontEnd</span> <i class="bi bi-chevron-right"></i></a>
                            <ul>
                                <li><a href="/front/board?langname=js">JavaScript</a></li>
                                <li><a href="/front/board?langname=ts">TypeScript</a></li>
                                <li><a href="/front/board?langname=react">React</a></li>
                                <li><a href="/front/board?langname=vuejs">Vue.js</a></li>
                                <li><a href="/front/board?langname=angular">Angular</a></li>
                            </ul>
                        </li>
                        <li class="dropdown"><a href="#"><span>BackEnd</span> <i class="bi bi-chevron-right"></i></a>
                            <ul>
                                <li><a href="/back/board?langname=java">Java</a></li>
                                <li><a href="/back/board?langname=python">Python</a></li>
                                <li><a href="/back/board?langname=nodejs">Node.js</a></li>
                                <li><a href="/back/board?langname=ummlang">Umm Lang</a></li>
                                <li><a href="/back/board?langname=ruby">Ruby</a></li>
                                <li><a href="/back/board?langname=kotlin">Kotlin</a></li>
                                <li><a href="/back/board?langname=swift">Swift</a></li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li><a class="nav-link scrollto" href="/chat">Live Chat</a></li>
                <c:choose>
                    <c:when test="${sessionScope.member eq null}">
                        <li><a class="nav-link" href="#" data-bs-toggle="modal"
                               data-bs-target="#exampleModalToggle">Sign In</a></li>
                        <li><a class="nav-link" href="/member/signup" data-bs-target="#exampleModalToggle2"
                               data-bs-toggle="modal">Sign Up</a></li>
                    </c:when>
                    <c:otherwise>
                        <li><a class="nav-link" href="/member/escape">Sign Out</a></li>
                    </c:otherwise>
                </c:choose>
            </ul>
            <i class="bi bi-list mobile-nav-toggle"></i>
        </nav><!-- .navbar -->

    </div>
</header><!-- End Header -->


<main id="main">

    <!-- ======= About Section ======= -->
    <section id="nodejs" class="about">
        <div class="container">

            <div class="row no-gutters">
                <div class="content col-xl-5 d-flex align-items-stretch" data-aos="fade">
                    <div class="content">
                        <h3><i class="bx bxl-nodejs"></i> Node.js</h3>
                        <p>
                            이 곳은 Node.js와 관련된 질문이나 토론을 할 수 있는 게시판입니다.
                            코드를 공유하거나 질문 해보세요.
                            <c:if test="${sessionScope.member eq null}"><br>로그인 후 작성 가능합니다.</c:if>
                            <br>
                            <c:if test="${not empty sessionScope.member}">
                                <a class="btn btn-secondary mt-1" href="#" data-bs-toggle="modal"
                                   data-bs-target="#content-upload-modal"><i class="bi bi-pencil"></i> 작성하기</a>
                            </c:if>
                        </p>
                    </div>
                </div>
                <div class="col-xl-7 d-flex align-items-stretch">
                    <div class="icon-boxes d-flex flex-column justify-content-center">
                        <div class="row">
                            <div class="col-md-6 icon-box" data-aos="fade" data-aos-delay="100">
                                <i class="bi bi-browser-chrome"></i>
                                <h4>V8 Engine</h4>
                                <p>크롬의 V8 엔진으로 빌드 되었습니다.</p>
                            </div>
                            <div class="col-md-6 icon-box" data-aos="fade" data-aos-delay="200">
                                <i class="bx bx-select-multiple"></i>
                                <h4>Multi Thread</h4>
                                <p>멀티쓰레드로 작업하여 결과를 구현합니다.</p>
                            </div>
                            <div class="col-md-6 icon-box" data-aos="fade" data-aos-delay="300">
                                <i class="bi bi-input-cursor"></i>
                                <h4>non-blocking I/O</h4>
                                <p>이벤트 기반 비동식 방식으로 작동합니다.</p>
                            </div>
                            <div class="col-md-6 icon-box" data-aos="fade" data-aos-delay="400">
                                <i class="bi bi-terminal"></i>
                                <h4>npm</h4>
                                <p>Node Package Manager를 통해 다양한 모듈을 제공합니다</p>
                            </div>
                        </div>
                    </div><!-- End .content-->
                </div>
            </div>
        </div>
    </section><!-- End About Section -->

    <!-- ======= Contents Section ======= -->
    <section id="node-js-contents" class="services mb-5">
        <div class="container">
            <div class="section-title" data-aos="fade" data-aos-delay="100">
                <h2>Contents</h2>
                <form>
                    <div class="d-flex justify-content-center">
                        <div class="input-group mb-3 me-1" style="width: 625px;">
                            <select class="form-select" name="search"
                                    aria-label="Example select with button addon">
                                <option value="0" selected>선택</option>
                                <option value="1" ${pager.search == 1 ? "selected" : ""}>제목</option>
                                <option value="2" ${pager.search == 2 ? "selected" : ""}>내용</option>
                                <option value="3" ${pager.search == 3 ? "selected" : ""}>작성자</option>
                            </select>
                            <input type="text" class="form-control" placeholder="검색어를 입력해주세요." aria-label="검색어를 입력해주세요."
                                   aria-describedby="button-addon2" name="keyword"
                                   value="${pager.search == 0  ? "" : pager.keyword}">
                            <input type="hidden" name="langname" value="nodejs">
                            <button class="btn btn-outline-secondary" id="button-addon2">검색</button>
                        </div>
                    </div>
                </form>
            </div>


            <div class="row">
                <c:forEach var="list" items="${list}">
                    <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0">
                        <div class="icon-box" data-aos="zoom-in-up" data-aos-delay="100"
                             style="width: 294.8px; height: 220.8px">
                            <div class="icon"><i class="bi bi-code-square"></i></div>
                            <h4 class="title"
                                style="width: 230px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap">
                                <a href="/back/detail/${list.contentNum}">${list.contentTitle}</a>
                            </h4>
                            <p class="description">${list.contentUploader} <br>
                                <fmt:formatDate value="${list.contentRegDate}" pattern="yyyy-MM-dd"/>
                            </p>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div class="pagination-wrap mt-5 d-flex justify-content-center" data-aos="fade-in" data-aos-delay="100">
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <li class="page-item"><a class="page-link" href="?page=1&langname=nodejs">처음</a></li>
                        <li class="page-item">
                            <a class="page-link" href="?page=${pager.prev}&langname=nodejs" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                        <c:forEach var="page" items="${pager.list}">
                            <li class="page-item">
                                <a class="page-link ${page eq pager.page ? 'active' : ''}"
                                   href="?page=${page}&langname=nodejs">${page}</a>
                            </li>
                        </c:forEach>
                        <li class="page-item">
                            <a class="page-link" href="?page=${pager.next}&langname=nodejs" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="?page=${pager.last}&langname=nodejs">마지막</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </section><!-- End Contents Section -->
</main>
<!-- End #main -->

<!-- ======= Footer ======= -->
<footer id="footer">
    <div class="footer-top">
        <div class="container">
            <div class="row">

                <div class="col-lg-4 col-md-6">
                    <div class="footer-info">
                        <h3>Archivist</h3>
                        <p class="pb-3"><em>We'll always be supporting your development with many users.</em></p>
                        <p>
                            대전광역시 동구 가양로 <br>
                            우암로 352-21 <br><br>
                            <strong>Phone:</strong> +82 111 1111 1111<br>
                            <strong>Email:</strong> soft@kr.ac.kopo<br>
                        </p>
                        <div class="social-links mt-3">
                            <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
                            <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
                            <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
                            <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
                            <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-2 col-md-6 footer-links">
                    <h4>Useful Links</h4>
                    <ul>
                        <li><i class="bx bx-chevron-right"></i> <a href="/">Home</a></li>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">About us</a></li>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">Services</a></li>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">Terms of service</a></li>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">Privacy policy</a></li>
                    </ul>
                </div>

                <div class="col-lg-2 col-md-6 footer-links">
                    <h4>Our Services</h4>
                    <ul>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">Web Design</a></li>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">Web Development</a></li>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">Product Management</a></li>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">Marketing</a></li>
                        <li><i class="bx bx-chevron-right"></i> <a href="#">Graphic Design</a></li>
                    </ul>
                </div>

                <div class="col-lg-4 col-md-6 footer-newsletter">
                    <h4>Our Newsletter</h4>
                    <p class="text-white">새로운 언어의 출시나 정보들에 대해 전해드립니다.</p>
                    <form action="" method="post">
                        <input type="email" name="email"><input type="submit" value="Subscribe">
                    </form>

                </div>

            </div>
        </div>
    </div>

    <div class="container">
        <div class="copyright">
            &copy; Copyright <strong><span>Umm-Jun-Sik</span></strong>. still alive.
        </div>
        <div class="credits">
            <!-- All the links in the footer should remain intact. -->
            <!-- You can delete the links only if you purchased the pro version. -->
            <!-- Licensing information: https://bootstrapmade.com/license/ -->
            <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/squadfree-free-bootstrap-template-creative/ -->
            Create, Save, Reminiscence and Archivist.
        </div>
    </div>
</footer>
<!-- End Footer -->

<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
        class="bi bi-arrow-up-short"></i></a>

<!-- Off-canvas sidebar-->
<div class="offcanvas offcanvas-start" data-bs-scroll="true" data-bs-backdrop="false" tabindex="-1"
     id="offcanvasScrolling" aria-labelledby="offcanvasScrollingLabel">
    <div class="offcanvas-header">
        <h5 class="offcanvas-title" id="offcanvasScrollingLabel">
            <c:choose>
                <c:when test="${not empty sessionScope.member}">
                    Now account is ${sessionScope.member.memberNick}
                </c:when>
                <c:otherwise>
                    Archivist
                </c:otherwise>
            </c:choose>
        </h5>
        <button type="button" class="btn-close btn-light" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
    <hr>
    <div class="offcanvas-body">
        <ul class="list-unstyled ps-0">
            <li class="mb-1">
                <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
                        data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="true">
                    Home
                </button>
                <div class="collapse show" id="home-collapse">
                    <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                        <li><a href="/" class="link-dark d-inline-flex text-decoration-none rounded">Index</a></li>
                        <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">Update soon</a>
                        </li>
                        <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">Update soon</a>
                        </li>
                    </ul>
                </div>
            </li>
            <li class="mb-1">
                <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
                        data-bs-toggle="collapse" data-bs-target="#dashboard-collapse" aria-expanded="false">
                    Boards
                </button>
                <div class="collapse" id="dashboard-collapse">
                    <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                        <li><a href="/back/board?langname=java"
                               class="link-dark d-inline-flex text-decoration-none rounded">Java</a>
                        </li>
                        <li><a href="/back/board?langname=python"
                               class="link-dark d-inline-flex text-decoration-none rounded">Python</a></li>
                        <li><a href="/back/board?langname=nodejs"
                               class="link-dark d-inline-flex text-decoration-none rounded">Node.js</a></li>
                        <li><a href="/back/board?langname=nodejs"
                               class="link-dark d-inline-flex text-decoration-none rounded">Ruby</a>
                        </li>
                        <li><a href="/back/board?langname=ummlang"
                               class="link-dark d-inline-flex text-decoration-none rounded">Umm
                            Lang</a></li>
                        <li><a href="/back/board?langname=kotlin"
                               class="link-dark d-inline-flex text-decoration-none rounded">Kotlin</a></li>
                        <li><a href="/back/board?langname=swift"
                               class="link-dark d-inline-flex text-decoration-none rounded">Swift</a>
                        </li>
                        <li><a href="/front/board?langname=js"
                               class="link-dark d-inline-flex text-decoration-none rounded">JavaScript</a></li>
                        <li><a href="/front/board?langname=ts"
                               class="link-dark d-inline-flex text-decoration-none rounded">TypeScript</a></li>
                        <li><a href="/front/board?langname=react"
                               class="link-dark d-inline-flex text-decoration-none rounded">React</a></li>
                        <li><a href="/front/board?langname=vuejs"
                               class="link-dark d-inline-flex text-decoration-none rounded">Vue.js</a></li>
                        <li><a href="/front/board?langname=angular"
                               class="link-dark d-inline-flex text-decoration-none rounded">Angular</a>
                        </li>
                    </ul>
                </div>
            </li>
            <li class="mb-1">
                <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
                        data-bs-toggle="collapse" data-bs-target="#orders-collapse" aria-expanded="false">
                    Orders
                </button>
                <div class="collapse" id="orders-collapse">
                    <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                        <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">New</a></li>
                        <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">Processed</a></li>
                        <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">Shipped</a></li>
                        <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">Returned</a></li>
                    </ul>
                </div>
            </li>
            <c:if test="${sessionScope.member.memberAuthority eq 'Archivist'}">
                <li class="mb-1">
                    <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
                            data-bs-toggle="collapse" data-bs-target="#admin-collapse" aria-expanded="false">
                        Archivist Controls
                    </button>
                    <div class="collapse" id="admin-collapse">
                        <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                            <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">Notice</a></li>
                            <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">Board</a></li>
                            <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">Lang Append</a>
                            </li>
                            <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">Members</a>
                            </li>
                        </ul>
                    </div>
                </li>
            </c:if>
            <c:if test="${not empty sessionScope.member}">
                <li class="border-top my-3"></li>
                <li class="mb-1">
                    <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed"
                            data-bs-toggle="collapse" data-bs-target="#account-collapse" aria-expanded="false">
                            ${sessionScope.member.memberNick}
                    </button>
                    <div class="collapse" id="account-collapse">
                        <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                            <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">Profile</a>
                            </li>
                            <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">Settings</a>
                            </li>
                            <li><a href="/member/escape" class="link-dark d-inline-flex text-decoration-none rounded">Sign
                                out</a></li>
                        </ul>
                    </div>
                </li>
            </c:if>
        </ul>
    </div>
</div>
<!-- Off-canvas sidebar-->

<!-- Login modal -->
<div class="modal fade" id="exampleModalToggle" aria-hidden="true" aria-labelledby="exampleModalToggleLabel"
     tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content" style="!important; width:390px;">
            <div class="wrap-login100">
                <form class="login100-form validate-form" method="post" action="/member/login"
                      id="signInSubmitHandler">
					<span class="login100-form-title p-b-26">
						Welcome
					</span>
                    <span class="login100-form-title p-b-48">
						<i class="zmdi zmdi-font"></i>
					</span>

                    <div class="wrap-input100 validate-input " data-validate="Valid email is: a@b.c">
                        <input class="input100 login-id-val" type="email" name="memberId">
                        <span class="focus-input100" data-placeholder="Email"></span>
                    </div>

                    <div class="wrap-input100 validate-input" data-validate="Enter password">
						<span class="btn-show-pass">
							<i class="zmdi zmdi-eye"></i>
						</span>
                        <input class="input100 login-pass-val" type="password" name="memberPass">
                        <span class="focus-input100" data-placeholder="Password"></span>
                    </div>

                    <div class="container-login100-form-btn">
                        <div class="wrap-login100-form-btn" id="login-submit-btn">
                            <div class="login100-form-bgbtn"></div>
                            <button class="login100-form-btn">
                                Sign IN
                            </button>
                        </div>
                    </div>

                    <div class="text-center p-t-115">
						<span class="txt1">
							Don’t have an account?
						</span>
                        <a class="txt2" href="#" data-bs-target="#exampleModalToggle2" data-bs-toggle="modal">
                            Sign Up
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- Login modal-->


<!-- Account modal-->
<div class="modal fade" id="exampleModalToggle2" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2"
     tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content" style="!important; width:390px;">
            <div class="wrap-login100">
                <form class="login100-form validate-form" method="post" action="/member/new_account"
                      id="signUpSubmitHandler">
					<span class="login100-form-title p-b-26">
						Welcome
					</span>
                    <span class="login100-form-title p-b-48">
						<i class="zmdi zmdi-font"></i>
					</span>

                    <div class="wrap-input100 validate-input " data-validate="Valid email is: a@b.c">
                        <span class="btn-duplicate-check id-dup-chk">
                            <i class="zmdi zmdi-check"></i>
                        </span>
                        <input class="input100" type="text" name="memberId" id="memberId">
                        <span class="focus-input100" data-placeholder="Email"></span>
                    </div>

                    <div class="wrap-input100 validate-input" data-validate="Enter memberNick">
                        <span class="btn-duplicate-check nick-dup-chk">
                            <i class="zmdi zmdi-check"></i>
                        </span>
                        <input class="input100" type="text" name="memberNick" id="memberNick">
                        <span class="focus-input100" data-placeholder="Nickname"></span>
                    </div>

                    <div class="wrap-input100 validate-input" data-validate="Enter password">
						<span class="btn-show-pass">
							<i class="zmdi zmdi-eye"></i>
						</span>
                        <input class="input100" type="password" name="memberPass" id="memberPass">
                        <span class="focus-input100" data-placeholder="Password"></span>
                    </div>

                    <input type="hidden" name="memberAuthority" value="common" id="memberAuthority">


                    <div class="container-login100-form-btn">
                        <div class="wrap-login100-form-btn">
                            <div class="login100-form-bgbtn"></div>
                            <button type="button" class="login100-form-btn btn-control" disabled>
                                Sign Up
                            </button>
                        </div>
                    </div>
                </form>
                <div class="text-center p-t-115">
						<span class="txt1">
							If you already our member
						</span>
                    <a class="txt2" href="#" data-bs-target="#exampleModalToggle" data-bs-toggle="modal">
                        Sign In
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Account modal -->

<!-- Contents send modal -->
<!-- Modal -->
<div class="modal modal-xl fade" id="content-upload-modal" tabindex="-1" aria-labelledby="content-upload-modalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Upload Content</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="/back/upload" method="post" enctype="multipart/form-data">
                    <div class="mb-3">
                        <label for="recipient-title" class="col-form-label">Title:</label>
                        <input type="text" class="form-control" id="recipient-title" name="contentTitle">
                    </div>

                    <textarea class="summernote" id="content-upload-detail" name="contentDetail"></textarea>

                    <div class="input-group mt-3">
                        <input type="file" class="form-control" name="paramFiles">
                    </div>
                    <div class="input-group mt-3">
                        <input type="file" class="form-control" name="paramFiles">
                    </div>

                    <input type="hidden" id="content-upload-loader" value="${sessionScope.member.memberNick}"
                           name="contentUploader">
                    <input type="hidden" id="content-lang" value="nodejs" name="contentLangName">

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button class="btn btn-secondary">Send Content</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<!-- Contents send modal -->

<script src="https://code.jquery.com/jquery-3.6.1.js"
        integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI="
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
        integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
        integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz"
        crossorigin="anonymous"></script>
<!--===============================================================================================-->
<script src="memberAssets/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
<script src="memberAssets/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
<script src="memberAssets/vendor/daterangepicker/moment.min.js"></script>
<script src="memberAssets/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
<script src="memberAssets/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
<script src="memberAssets/js/main.js"></script>


<!-- Vendor JS Files -->
<script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
<script src="assets/vendor/aos/aos.js"></script>
<script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
<script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
<script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
<script src="assets/vendor/php-email-form/validate.js"></script>
<script src="summernote/summernote-ko-KR.js"></script>
<script src="summernote/summernote-lite.js"></script>
<script src="summernote/summernote-ext-highlight.js"></script>

<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/codemirror.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/codemirror/3.20.0/mode/xml/xml.js"></script>
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/codemirror/2.36.0/formatting.js"></script>

<!-- Template Main JS File -->
<script src="assets/js/main.js"></script>
<script src="assets/js/sidebars.js"></script>
<script src="backendboard/summernote.js"></script>
<script src="backendboard/member_form_control.js"></script>
<script src="backendboard/backendboard_content_control.js"></script>
</body>

</html>
