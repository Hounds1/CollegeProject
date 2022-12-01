<%--
  Created by IntelliJ IDEA.
  User: Student
  Date: 2022-10-13
  Time: 오전 11:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

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
                <li><a class="nav-link scrollto" href="#about">Notice</a></li>
                <li><a class="nav-link scrollto" href="#my-page">My page</a></li>
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
    <section id="about" class="about">
        <div class="container">

            <div class="row no-gutters">
                <div class="content col-xl-5 d-flex align-items-stretch" data-aos="fade-up">
                    <div class="content">
                        <h3>Notice</h3>
                        <p>
                            다음은 Archivist에서 권장 드리는 보안 또는 사용 가이드라인과 관련된 내용들입니다.
                            부디 읽어주시고 피해가 발생하지 않도록 함께 노력해 주시기 바랍니다.
                            Archivist는 언제나 유저의 편에서 가동하겠습니다.
                        </p>
                    </div>
                </div>
                <div class="col-xl-7 d-flex align-items-stretch">
                    <div class="icon-boxes d-flex flex-column justify-content-center">
                        <div class="row">
                            <div class="col-md-6 icon-box" data-aos="fade-up" data-aos-delay="100">
                                <i class="bx bx-lock"></i>
                                <h4>절대 비밀번호를 타인에게 알려주어서는 안됩니다.</h4>
                                <p>비밀번호의 보안을 강화하고 타인에게 알려주어서는 안됩니다.</p>
                            </div>
                            <div class="col-md-6 icon-box" data-aos="fade-up" data-aos-delay="200">
                                <i class="bx bx-shield"></i>
                                <h4>Archivist 현재 보안상 문제없이 가동 중입니다.</h4>
                                <p>더욱더 정보를 다루는데 신중해지겠습니다.</p>
                            </div>
                            <div class="col-md-6 icon-box" data-aos="fade-up" data-aos-delay="300">
                                <i class="bx bx-notification"></i>
                                <h4>변경하신 정보를 기억해 주십시오.</h4>
                                <p>비밀번호 등과 같은 중요한 정보는 기록하기 보다 기억하시길 권장 드립니다.</p>
                            </div>
                            <div class="col-md-6 icon-box" data-aos="fade-up" data-aos-delay="400">
                                <i class="bx bx-info-square"></i>
                                <h4>우리는 개인정보를 요구하지 않습니다.</h4>
                                <p>우리는 당신을 부를 수 있는 "닉네임"을 제외한 추가정보를 요구하지 않습니다.</p>
                            </div>
                        </div>
                    </div><!-- End .content-->
                </div>
            </div>
        </div>
    </section><!-- End About Section -->

    <!-- ======= Services Section ======= -->
    <section id="my-page" class="services mb-5">
        <div class="container">

            <div class="section-title" data-aos="fade-in" data-aos-delay="100">
                <h2>My page</h2>
                <p>
                    이곳은 당신의 기록을 확인거나 정보를 수정할 수 있는 공간입니다.<br>
                    당신의 기록을 확인해 보세요.
                </p>
            </div>

            <div class="row">
                <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0">
                    <div class="icon-box" data-aos="fade-up">
                        <div class="icon"><i class="bi bi-pass"></i></div>
                        <h4 class="title"><a href="#" data-bs-toggle="modal" data-bs-target="#exampleModal"
                                             id="password-changer">Password</a></h4>
                        <p class="description">비밀번호를 변경하고 보안을 강화하세요.</p>
                    </div>
                </div>

                <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0">
                    <div class="icon-box" data-aos="fade-up" data-aos-delay="100">
                        <div class="icon"><i class="bi bi-alarm"></i></div>
                        <h4 class="title"><a href="#">Record</a></h4>
                        <p class="description">당신이 쓴 글을 다시 볼 수 있습니다.</p>
                    </div>
                </div>


                <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0">
                    <div class="icon-box" data-aos="fade-up" data-aos-delay="200">
                        <div class="icon"><i class="bi bi-escape"></i></div>
                        <h4 class="title"><a href="#" data-bs-toggle="modal" data-bs-target="#member-drop-account">Withdraw</a>
                        </h4>
                        <p class="description">현재 접속 중인 계정을 삭제합니다.</p>
                    </div>
                </div>


                <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0">
                    <div class="icon-box" data-aos="fade-up" data-aos-delay="300">
                        <div class="icon"><i class="bi bi-code-square"></i></div>
                        <h4 class="title"><a href="">Update soon</a></h4>
                        <p class="description">현재 개발 중인 기능입니다. 곧 출시 될 예정입니다.</p>
                    </div>
                </div>

            </div>

        </div>
    </section><!-- End Services Section -->


</main><!-- End #main -->

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
                            <a href="#" class="github"><i class="bx bxl-github"></i></a>
                            <a href="#" class="discord"><i class="bx bxl-discord"></i></a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-2 col-md-6">

                </div>

                <div class="col-lg-2 col-md-6">

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

<!-- member password change modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">

        <div class="modal-content" style="!important; width:390px;">
            <div class="wrap-login100">
                <form class="login100-form validate-form" id="pass-change-form">
					<span class="login100-form-title p-b-26">
						Password Change
					</span>
                    <span class="login100-form-title p-b-48">
						<i class="zmdi zmdi-font"></i>
					</span>

                    <div class="wrap-input100 validate-input" data-validate="Enter password">
						<span class="btn-duplicate-check btn-old-pass-val-chk me-4">
                            <i class="zmdi zmdi-check"></i>
                        </span>
                        <span class="btn-show-pass">
							<i class="zmdi zmdi-eye"></i>
						</span>
                        <input class="input100 old-pass-val" type="password" name="memberPass">
                        <span class="focus-input100" data-placeholder="Old Password"></span>
                    </div>

                    <div class="wrap-input100 validate-input" data-validate="Enter password">
						<span class="btn-show-pass">
							<i class="zmdi zmdi-eye"></i>
						</span>
                        <input class="input100 new-pass-val" type="password" name="newMemberPass">
                        <span class="focus-input100" data-placeholder="New Password"></span>
                    </div>

                    <div class="wrap-input100 validate-input" data-validate="Enter password">
						<span class="btn-duplicate-check btn-new-pass-val-chk me-4">
                            <i class="zmdi zmdi-check"></i>
                        </span>
                        <span class="btn-show-pass">
							<i class="zmdi zmdi-eye"></i>
						</span>
                        <input class="input100 new-pass-chk" type="password" name="newMemberPassChk">
                        <span class="focus-input100" data-placeholder="New Password"></span>
                    </div>

                    <input type="hidden" class="pass-change-id" value="${sessionScope.member.memberId}">

                    <div class="container-login100-form-btn" id="pass-change-btn">
                        <div class="wrap-login100-form-btn">
                            <div class="login100-form-bgbtn"></div>
                            <button type="button" class="login100-form-btn change-btn-control" disabled>
                                Change
                            </button>
                        </div>
                    </div>

                    <div class="text-center p-t-115">
						<span class="txt1">
							Forgot your password?
						</span>
                        <a class="txt2" href="/member/find_pass">
                            click here
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!-- member password change modal -->
<!-- member drop account modal -->
<div class="modal fade" id="member-drop-account" tabindex="-1">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Delete Your Account</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>계정이 삭제 된 이후 남겨진 기록들은 <br> 어떠한 이유에서든 다시 사용되지 않습니다. <br>
                정말 계정을 탈퇴하신다면 아래의 입력창에 '지금 탈퇴'를 입력해주십시오.</p>
                <div class="drop-input-warp mt-5">
                    <input class="form-control" id="agree-delete" type="text" placeholder="지금 탈퇴">
                    <input type="hidden" id="delete-target-member" value="${sessionScope.member.memberId}">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-secondary" id="member-delete-btn">Delete Account</button>
            </div>
        </div>
    </div>
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

<!-- Template Main JS File -->
<script src="assets/js/main.js"></script>
<script src="assets/js/sidebars.js"></script>
<script src="mypage/main.js"></script>

</body>

</html>
