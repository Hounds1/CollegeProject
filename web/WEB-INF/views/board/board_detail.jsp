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

    <!-- =======================================================
    * Template Name: Squadfree - v4.9.1
    * Template URL: https://bootstrapmade.com/squadfree-free-bootstrap-template-creative/
    * Author: BootstrapMade.com
    * License: https://bootstrapmade.com/license/
    ======================================================== -->

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
                <li><a class="nav-link scrollto" href="#content-header">Head Line</a></li>
                <li><a class="nav-link scrollto" href="#content-detail">Details</a></li>
                <li class="dropdown"><a href="#"><span>Boards</span> <i class="bi bi-chevron-down"></i></a>
                    <ul>
                        <li class="dropdown"><a href="#"><span>FrontEnd</span> <i class="bi bi-chevron-right"></i></a>
                            <ul>
                                <li><a href="#">JavaScript</a></li>
                                <li><a href="#">TypeScript</a></li>
                                <li><a href="#">React</a></li>
                                <li><a href="#">Vue.js</a></li>
                                <li><a href="#">Angular</a></li>
                                <li><a href="#">Swift</a></li>
                            </ul>
                        </li>
                        <li class="dropdown"><a href="#"><span>BackEnd</span> <i class="bi bi-chevron-right"></i></a>
                            <ul>
                                <li><a href="/board/java">Java</a></li>
                                <li><a href="#">Python</a></li>
                                <li><a href="#">Node.js</a></li>
                                <li><a href="#">Umm Lang</a></li>
                                <li><a href="#">Ruby</a></li>
                                <li><a href="#">Kotlin</a></li>
                            </ul>
                        </li>
                    </ul>
                </li>
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
    <section id="content-header" class="about">
        <div class="container">

            <div class="row no-gutters">
                <div class="content col-xl-5 d-flex align-items-stretch" data-aos="fade-up">
                    <div class="content">
                        <h3>${contentDetail.contentTitle}</h3>
                        <p>
                            게시일 : <fmt:formatDate value="${contentDetail.contentRegDate}" pattern="yyyy-MM-dd"/> <br>
                            <a class="btn btn-secondary mt-1 content-editor-call" href="#" data-bs-toggle="modal"
                               data-bs-target="#content-edit-modal" id="${contentDetail.contentNum}"><i class="bi bi-pencil"></i> 수정하기</a>
                            <a class="btn btn-secondary mt-1 ms-1" href="/board/delete/${contentDetail.contentNum}">삭제</a>
                        </p>
                    </div>
                </div>
                <div class="col-xl-7 d-flex align-items-stretch">
                    <div class="icon-boxes d-flex flex-column justify-content-center">
                        <div class="row">
                            <div class="col-md-6 icon-box" data-aos="fade-up" data-aos-delay="100">
                                <i class="bx bx-upload"></i>
                                <h4>${contentDetail.contentUploader} <c:if test="${contentDetail.contentUploader eq sessionScope.member.memberNick}">(me)</c:if></h4>
                                <p>by uploaded.</p>
                            </div>
                            <div class="col-md-6 icon-box" data-aos="fade-up" data-aos-delay="200">
                                <i class="bx bxl-java"></i>
                                <h4>${contentDetail.contentLangName}</h4>
                                <p>contents language name.</p>
                            </div>
                            <div class="col-md-6 icon-box" data-aos="fade-up" data-aos-delay="300">
                                <i class="bi bi-person"></i>
                                <h4><span data-purecounter-start="0" data-purecounter-end="${contentDetail.contentHit}" data-purecounter-duration="1"
                                          class="purecounter"></span></h4>
                                <p>contents hits</p>
                            </div>
                            <div class="col-md-6 icon-box" data-aos="fade-up" data-aos-delay="400">
                                <i class="bi bi-pencil"></i>
                                <h4><span data-purecounter-start="0" data-purecounter-end="${contentDetail.contentCommentHit}" data-purecounter-duration="1"
                                          class="purecounter"></span></h4>
                                <p>comments hit</p>
                            </div>
                        </div>
                    </div><!-- End .content-->
                </div>
            </div>
        </div>
    </section><!-- End About Section -->

    <!-- ======= Contents Section ======= -->
    <section id="content-detail" class="services mb-5">
        <div class="container">
            <div class="section-title" data-aos="fade-in" data-aos-delay="100">
                <h2>Contents Details</h2>
            </div>


            <div class="row border border-secondary rounded-3 text-center" data-aos="fade-in" data-aos-delay="200">
                <div style="padding: 30px;">
                    ${contentDetail.contentDetail}
                </div>
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
                        <li><i class="bx bx-chevron-right"></i> <a href="#">Home</a></li>
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
                        <li><a href="/board/java" class="link-dark d-inline-flex text-decoration-none rounded">Java</a>
                        </li>
                        <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">Python</a></li>
                        <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">Node.js</a></li>
                        <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">Ruby</a></li>
                        <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">Umm Lang</a></li>
                        <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">Kotlin</a></li>
                        <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">Swift</a></li>
                        <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">JavaScript</a></li>
                        <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">TypeScript</a></li>
                        <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">React</a></li>
                        <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">Vue.js</a></li>
                        <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">Angular</a></li>
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

                    <div class="container-login100-form-btn" >
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

<!-- Contents edit modal -->
<!-- Modal -->
<div class="modal modal-xl fade" id="content-edit-modal" tabindex="-1" aria-labelledby="content-edit-modalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="contentEditModalLabel">Upload Content</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form>
                    <div class="mb-3">
                        <label for="editor-title" class="col-form-label">Title:</label>
                        <input type="text" class="form-control" id="editor-title" name="contentTitle">
                    </div>
                    <textarea class="summernote" id="editor-summernote" name="contentDetail"></textarea>
                    <input type="hidden" id="editor-targetNum" value="${contentDetail.contentNum}">
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-secondary" id="editor-submit-btn">Edit Content</button>
            </div>
        </div>
    </div>
</div>
<!-- Contents edit modal -->

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

<!-- Template Main JS File -->
<script src="assets/js/main.js"></script>
<script src="assets/js/sidebars.js"></script>
<script src="backendboard/content_detail_summernote.js"></script>
<script src="backendboard/member_form_control.js"></script>
<script src="backendboard/backendboard_content_control.js"></script>
</body>

</html>
