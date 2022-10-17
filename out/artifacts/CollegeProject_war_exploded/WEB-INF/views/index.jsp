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

    <!-- Favicons -->
    <link href="assets/img/favicon.png" rel="icon">
    <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

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
    <link rel="stylesheet" type="text/css" href="memberAssets/css/util.css">
    <link rel="stylesheet" type="text/css" href="memberAssets/css/main.css">
    <!--===============================================================================================-->


</head>

<body>

<!-- ======= Header ======= -->
<header id="header" class="fixed-top header-transparent">
    <div class="container d-flex align-items-center justify-content-between">

        <div class="logo">
            <h1 class="text-light"><a href="#" data-bs-toggle="offcanvas" data-bs-target="#offcanvasScrolling"
                                      aria-controls="offcanvasScrolling"><span class="fs-2">Archivist</span></a></h1>
            <!-- Uncomment below if you prefer to use an image logo -->
            <!-- <a href="index.html"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
        </div>

        <nav id="navbar" class="navbar">
            <ul>
                <li><a class="nav-link scrollto active" href="#hero">Home</a></li>
                <li><a class="nav-link scrollto" href="#about">Forum</a></li>
                <li><a class="nav-link scrollto" href="#services">Services</a></li>
                <li><a class="nav-link scrollto" href="#portfolio">Languages</a></li>
                <%--                <li><a class="nav-link scrollto" href="#team">Team</a></li>--%>
                <li class="dropdown"><a href="#"><span>Boards</span> <i class="bi bi-chevron-down"></i></a>
                    <ul>
                        <li class="dropdown"><a href="#"><span>FrontEnd</span> <i class="bi bi-chevron-right"></i></a>
                            <ul>
                                <li><a href="#">JavaScript</a></li>
                                <li><a href="#">TypeScript</a></li>
                                <li><a href="#">React</a></li>
                                <li><a href="#">Vue.js</a></li>
                                <li><a href="#">Angular</a></li>
                            </ul>
                        </li>
                        <li class="dropdown"><a href="#"><span>BackEnd</span> <i class="bi bi-chevron-right"></i></a>
                            <ul>
                                <li><a href="#">Java</a></li>
                                <li><a href="#">Python</a></li>
                                <li><a href="#">Node.js</a></li>
                                <li><a href="#">Umm Lang</a></li>
                                <li><a href="#">Ruby</a></li>
                                <li><a href="#">Swift</a></li>
                                <li><a href="#">Kotlin</a></li>
                            </ul>
                        </li>
                    </ul>
                </li>
                <li><a class="nav-link scrollto" href="#contact">Contact</a></li>
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

<!-- ======= Hero Section ======= -->
<section id="hero">
    <div class="hero-container" data-aos="fade-up">
        <h1>Welcome to Archivist</h1>
        <h2>We'll always be supporting your development with many users.</h2>
        <a href="#about" class="btn-get-started scrollto"><i class="bx bx-chevrons-down"></i></a>
    </div>
</section><!-- End Hero -->

<main id="main">

    <!-- ======= About Section ======= -->
    <section id="about" class="about">
        <div class="container">

            <div class="row no-gutters">
                <div class="content col-xl-5 d-flex align-items-stretch" data-aos="fade-up">
                    <div class="content">
                        <h3>함께 생각한다면 더 쉽게 코드를 구현하고, 수정할 수 있습니다.</h3>
                        <p>
                            모든 개발자들이 가끔 논리적인 모순에 막혀 앞으로 전진하지 못합니다. Archivist의 포럼에서 도움을 받고, 다른 이에게 도움을 주세요. 언제나 당신의 개발에 오류가
                            없길 바랍니다. :)
                        </p>
                        <a href="#" class="about-btn">Visit the forum.<i class="bx bx-chevron-right"></i></a>
                    </div>
                </div>
                <div class="col-xl-7 d-flex align-items-stretch">
                    <div class="icon-boxes d-flex flex-column justify-content-center">
                        <div class="row">
                            <div class="col-md-6 icon-box" data-aos="fade-up" data-aos-delay="100">
                                <i class="bx bx-receipt"></i>
                                <h4>당신의 코드를 다른 이들에게 보여주십시오.</h4>
                                <p>당신이 다른 이에게 도움을 주듯, 당신을 도울 준비된 사람들이 있습니다.</p>
                            </div>
                            <div class="col-md-6 icon-box" data-aos="fade-up" data-aos-delay="200">
                                <i class="bx bx-cube-alt"></i>
                                <h4>우리는 CodeBlock을 지원합니다.</h4>
                                <p>CodeBlock을 통해 게시글에 코드를 삽입해 보십시오. 다른 이들이 조금 더 쉽게 읽을 수 있을 겁니다.</p>
                            </div>
                            <div class="col-md-6 icon-box" data-aos="fade-up" data-aos-delay="300">
                                <i class="bx bx-images"></i>
                                <h4>멋진 결과물이 탄생했습니까?</h4>
                                <p>그렇다면 사진을 통해 자랑해 보십시오. 그리고 다른 개발자들의 생각을 들어보십시오.</p>
                            </div>
                            <div class="col-md-6 icon-box" data-aos="fade-up" data-aos-delay="400">
                                <i class="bx bx-shield"></i>
                                <h4>보안에 신경 써주십시오.</h4>
                                <p>유출되어서는 안되는 코드를 게시하지 않도록 주의해 주십시오. Archivist는 해당 피해에 대한 책임을 지지 않습니다.</p>
                            </div>
                        </div>
                    </div><!-- End .content-->
                </div>
            </div>

        </div>
    </section><!-- End About Section -->

    <!-- ======= Services Section ======= -->
    <section id="services" class="services">
        <div class="container">

            <div class="section-title" data-aos="fade-in" data-aos-delay="100">
                <h2>Services</h2>
                <p>Archivist는 개발이 단순한 업무가 아닌 하나의 즐길 거리가 될 수 있도록 노력하겠습니다. <br>
                    Archivist의 뜻인 "기록물 관리자"는 곧 우리가 할 일을 의미합니다. <br>
                    처음 시작한 순간으로부터 먼 훗날 다시 그때를 되돌아볼 때 하나의 추억이 될 수 있도록 우리가 당신의 과거를 보관해 드리겠습니다. <br>
                    가끔 과거가 그리울 때 들러 당신의 발자국을 확인해 보세요.</p>
            </div>

            <div class="row">
                <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0">
                    <div class="icon-box" data-aos="fade-up">
                        <div class="icon"><i class="bx bxl-discord"></i></div>
                        <h4 class="title"><a href="https://discord.com/">Discord</a></h4>
                        <p class="description">Archivist의 Discord 채널에서 음성으로 대화하세요!</p>
                    </div>
                </div>

                <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0">
                    <div class="icon-box" data-aos="fade-up" data-aos-delay="100">
                        <div class="icon"><i class="bx bx-book"></i></div>
                        <h4 class="title"><a href="">Read codes</a></h4>
                        <p class="description">다른 사람의 코드를 읽고 공부해 보세요!</p>
                    </div>
                </div>

                <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0">
                    <div class="icon-box" data-aos="fade-up" data-aos-delay="200">
                        <div class="icon"><i class="bx bx-camera"></i></div>
                        <h4 class="title"><a href="">Save your codes</a></h4>
                        <p class="description">현재의 코드를 저장하고 나중에 과거를 회상해 보세요!</p>
                    </div>
                </div>

                <div class="col-md-6 col-lg-3 d-flex align-items-stretch mb-5 mb-lg-0">
                    <div class="icon-box" data-aos="fade-up" data-aos-delay="300">
                        <div class="icon"><i class="bx bx-child"></i></div>
                        <h4 class="title"><a href="">Raise a junior developer</a></h4>
                        <p class="description">많은 초보 개발자들이 도움을 요청합니다. 어서 가서 도와주세요!</p>
                    </div>
                </div>

            </div>

        </div>
    </section><!-- End Services Section -->

    <!-- ======= Counts Section ======= -->
    <section id="counts" class="counts  section-bg">
        <div class="container">

            <div class="row no-gutters">

                <div class="col-lg-3 col-md-6 d-md-flex align-items-md-stretch">
                    <div class="count-box">
                        <i class="bi bi-emoji-smile"></i>
                        <span data-purecounter-start="0" data-purecounter-end="232" data-purecounter-duration="1"
                              class="purecounter"></span>
                        <p><strong>명의 이용자가</strong> <br>사이트를 이용하고 있습니다.</p>
                    </div>
                </div>

                <div class="col-lg-3 col-md-6 d-md-flex align-items-md-stretch">
                    <div class="count-box">
                        <i class="bi bi-journal-richtext"></i>
                        <span data-purecounter-start="0" data-purecounter-end="521" data-purecounter-duration="1"
                              class="purecounter"></span>
                        <p><strong>개의 글이</strong> <br>게시되었습니다.</p>
                    </div>
                </div>

                <div class="col-lg-3 col-md-6 d-md-flex align-items-md-stretch">
                    <div class="count-box">
                        <i class="bi bi-code"></i>
                        <span data-purecounter-start="0" data-purecounter-end="1463" data-purecounter-duration="1"
                              class="purecounter"></span>
                        <p><strong>번의 도움이</strong> <br>이루어졌습니다.</p>
                    </div>
                </div>

                <div class="col-lg-3 col-md-6 d-md-flex align-items-md-stretch">
                    <div class="count-box">
                        <i class="bi bi-people"></i>
                        <span data-purecounter-start="0" data-purecounter-end="15" data-purecounter-duration="1"
                              class="purecounter"></span>
                        <p><strong>명의 관리자가</strong> <br>활동하고 있습니다.</p>
                    </div>
                </div>

            </div>

        </div>
    </section><!-- End Counts Section -->

    <!-- ======= Cta Section ======= -->
    <section id="cta" class="cta">
        <div class="container" data-aos="zoom-in">

            <div class="text-center">
                <h3>아직 계정이 없으신가요?</h3>
                <p>회원가입을 하고 더 많은 정보들을 읽어보세요! 아마 당신이 찾는 해답이 있을 수 있습니다.</p>
                <a class="cta-btn" href="#" data-bs-target="#exampleModalToggle2"
                   data-bs-toggle="modal">Get a new account.</a>
            </div>

        </div>
    </section><!-- End Cta Section -->

    <!-- ======= Portfolio Section ======= -->
    <section id="portfolio" class="portfolio">
        <div class="container">

            <div class="section-title" data-aos="fade-in" data-aos-delay="100">
                <h2>Languages</h2>
                <p>Front-End 와 Back-End는 다양한 언어가 존재합니다. 여기 당신의 언어를 찾아보세요. 이 외에도 다양한 언어들이 준비되어 있습니다.</p>
            </div>

            <div class="row" data-aos="fade-in">
                <div class="col-lg-12 d-flex justify-content-center">
                    <ul id="portfolio-flters">
                        <li data-filter="*" class="filter-active">All</li>
                        <li data-filter=".filter-front">Front</li>
                        <li data-filter=".filter-back">Back</li>
                    </ul>
                </div>
            </div>

            <div class="row portfolio-container" data-aos="fade-up">

                <div class="col-lg-4 col-md-6 portfolio-item filter-back">
                    <div class="portfolio-wrap">
                        <img src="images/javawall.png" class="img-fluid" alt="">
                        <div class="portfolio-links">
                            <a href="images/javawall.png" data-gallery="portfolioGallery" class="portfolio-lightbox"
                               title="Java - James Arthur Gosling"><i class="bx bx-plus"></i></a>
                            <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6 portfolio-item filter-back">
                    <div class="portfolio-wrap">
                        <img src="images/python.jpg" class="img-fluid" alt="">
                        <div class="portfolio-links">
                            <a href="images/python.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox"
                               title="Python - Guido van Rossum"><i class="bx bx-plus"></i></a>
                            <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6 portfolio-item filter-front">
                    <div class="portfolio-wrap">
                        <img src="images/javascriptwall.png" class="img-fluid" alt="">
                        <div class="portfolio-links">
                            <a href="images/javascriptwall.png" data-gallery="portfolioGallery"
                               class="portfolio-lightbox" title="JavaScript - Brendan Eich"><i
                                    class="bx bx-plus"></i></a>
                            <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6 portfolio-item filter-front">
                    <div class="portfolio-wrap">
                        <img src="images/vuejs.png" class="img-fluid" alt="">
                        <div class="portfolio-links">
                            <a href="images/vuejs.png" data-gallery="portfolioGallery" class="portfolio-lightbox"
                               title="Vue.js - Evan You"><i class="bx bx-plus"></i></a>
                            <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6 portfolio-item filter-back">
                    <div class="portfolio-wrap">
                        <img src="/images/ruby.png" class="img-fluid" alt="">
                        <div class="portfolio-links">
                            <a href="/images/ruby.png" data-gallery="portfolioGallery" class="portfolio-lightbox"
                               title="Ruby - Yukihiro Matsumoto"><i class="bx bx-plus"></i></a>
                            <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6 portfolio-item filter-back">
                    <div class="portfolio-wrap">
                        <img src="images/nodejswall.jpg" class="img-fluid" alt="">
                        <div class="portfolio-links">
                            <a href="images/nodejswall.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox"
                               title="Node.js - Ryan Lienhart Dahl"><i class="bx bx-plus"></i></a>
                            <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6 portfolio-item filter-front">
                    <div class="portfolio-wrap">
                        <img src="images/react.png" class="img-fluid" alt="">
                        <div class="portfolio-links">
                            <a href="images/react.png" data-gallery="portfolioGallery" class="portfolio-lightbox"
                               title="React - Meta"><i class="bx bx-plus"></i></a>
                            <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6 portfolio-item filter-back">
                    <div class="portfolio-wrap">
                        <img src="images/ummlang.jpg" class="img-fluid" alt="" style="width: 416px; height: 234px;">
                        <div class="portfolio-links">
                            <a href="images/ummlang.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox"
                               title="Umm Lang - Umm Jun Sik"><i class="bx bx-plus"></i></a>
                            <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6 portfolio-item filter-front">
                    <div class="portfolio-wrap">
                        <img src="images/typescriptwall.png" class="img-fluid" alt="">
                        <div class="portfolio-links">
                            <a href="images/typescriptwall.png" data-gallery="portfolioGallery"
                               class="portfolio-lightbox" title="TypeScript - Microsoft"><i class="bx bx-plus"></i></a>
                            <a href="portfolio-details.html" title="More Details"><i class="bx bx-link"></i></a>
                        </div>
                    </div>
                </div>

            </div>

        </div>
    </section><!-- End Portfolio Section -->

    <!-- ======= Testimonials Section ======= -->
    <section id="testimonials" class="testimonials section-bg">
        <div class="container">

            <div class="section-title" data-aos="fade-in" data-aos-delay="100">
                <h2>Senior Developers</h2>
                <p>정상급 개발자들은 어떤 생각을 가지고 있는지 읽어보고 나에게 대입해 보세요.</p>
            </div>

            <div class="testimonials-slider swiper" data-aos="fade-up" data-aos-delay="100">
                <div class="swiper-wrapper">

                    <div class="swiper-slide">
                        <div class="testimonial-item">
                            <p>
                                <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                                ‘컴퓨터가 생각할 수 있을까?’ <br>
                                이렇게 묻는 것은 ‘잠수함이 물 속을 다닐 수 있을까?’라고 묻는 것과 같다. <br>
                                <br>
                                Edsger W.Dijkstra - 컴퓨터 과학자
                                <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                            </p>
                            <img src="images/Edsger_W_Dijkstra.jpg" class="testimonial-img" alt="">
                            <h3>Edsger W.Dijkstra</h3>
                            <h4>Computer scientist</h4>
                        </div>
                    </div><!-- End testimonial item -->

                    <div class="swiper-slide">
                        <div class="testimonial-item">
                            <p>
                                <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                                진정한 혁신이란 시장을 만들 수는 있지만, 소유할 힘은 없는 작은 스타트업으로부터 일어난다.<br>
                                <br>
                                <br>
                                Timm T.Martin - 게임 개발자
                                <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                            </p>
                            <img src="images/Timm_T_Martin.jpg" class="testimonial-img" alt="">
                            <h3>Timm T.Martin</h3>
                            <h4>Game Developer</h4>
                        </div>
                    </div><!-- End testimonial item -->

                    <div class="swiper-slide">
                        <div class="testimonial-item">
                            <p>
                                <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                                모든 특허는 헛소리다. 그것을 읽느라 시간을 낭비할 필요가 없다.<br>
                                왜냐하면 특허란 소유권자가 그렇게 할거냐 아니냐에 좌우되기 때문이다.<br>
                                Linus Torvalds - 리눅스의 창시자
                                <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                            </p>
                            <img src="images/Linus_Torvalds.jpg" class="testimonial-img" alt="">
                            <h3>Linus Torvalds</h3>
                            <h4>Developer</h4>
                        </div>
                    </div><!-- End testimonial item -->

                    <div class="swiper-slide">
                        <div class="testimonial-item">
                            <p>
                                <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                                소프트웨어에는 사실 의미있는 것들이 거의 없다.
                                만일 그런 게 있다고 할지라도, 유일한 성공척도는 고객들이 뭐가 문제인지 몰라 갈팡질팡하는 걸 도와주었냐 하는 것이다. <br>
                                Jeff Atwood - StackOverflow의 창시자
                                <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                            </p>
                            <img src="images/Jeff_Atwood.png" class="testimonial-img" alt="">
                            <h3>Jeff Atwood</h3>
                            <h4>Developer</h4>
                        </div>
                    </div><!-- End testimonial item -->

                    <div class="swiper-slide">
                        <div class="testimonial-item">
                            <p>
                                <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                                코드 수를 기준으로 프로그램의 진도를 측정하는 것은 <br>
                                비행기 제작 진도를 무게로 측정하는 것과 같다. <br>
                                <br>
                                <br>
                                Bill Gates - 가장 성공한 개발자
                                <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                            </p>
                            <img src="images/Bill_gates.jpg" class="testimonial-img" alt="">
                            <h3>William Henry Gates III (Bill Gates)</h3>
                            <h4>Entrepreneur & Developer</h4>
                        </div>
                    </div><!-- End testimonial item -->

                </div>
                <div class="swiper-pagination"></div>
            </div>

        </div>
    </section><!-- End Testimonials Section -->

    <%--    <!-- ======= Team Section ======= -->--%>
    <%--    <section id="team" class="team">--%>
    <%--        <div class="container">--%>

    <%--            <div class="section-title" data-aos="fade-in" data-aos-delay="100">--%>
    <%--                <h2>Team</h2>--%>
    <%--                <p>Magnam dolores commodi suscipit. Necessitatibus eius consequatur ex aliquid fuga eum quidem. Sit sint--%>
    <%--                    consectetur velit. Quisquam quos quisquam cupiditate. Et nemo qui impedit suscipit alias ea. Quia--%>
    <%--                    fugiat sit in iste officiis commodi quidem hic quas.</p>--%>
    <%--            </div>--%>

    <%--            <div class="row">--%>

    <%--                <div class="col-lg-4 col-md-6">--%>
    <%--                    <div class="member" data-aos="fade-up">--%>
    <%--                        <div class="pic"><img src="assets/img/team/team-1.jpg" class="img-fluid" alt=""></div>--%>
    <%--                        <div class="member-info">--%>
    <%--                            <h4>Walter White</h4>--%>
    <%--                            <span>Chief Executive Officer</span>--%>
    <%--                            <div class="social">--%>
    <%--                                <a href=""><i class="bi bi-twitter"></i></a>--%>
    <%--                                <a href=""><i class="bi bi-facebook"></i></a>--%>
    <%--                                <a href=""><i class="bi bi-instagram"></i></a>--%>
    <%--                                <a href=""><i class="bi bi-linkedin"></i></a>--%>
    <%--                            </div>--%>
    <%--                        </div>--%>
    <%--                    </div>--%>
    <%--                </div>--%>

    <%--                <div class="col-lg-4 col-md-6">--%>
    <%--                    <div class="member" data-aos="fade-up" data-aos-delay="150">--%>
    <%--                        <div class="pic"><img src="assets/img/team/team-2.jpg" class="img-fluid" alt=""></div>--%>
    <%--                        <div class="member-info">--%>
    <%--                            <h4>Sarah Jhonson</h4>--%>
    <%--                            <span>Product Manager</span>--%>
    <%--                            <div class="social">--%>
    <%--                                <a href=""><i class="bi bi-twitter"></i></a>--%>
    <%--                                <a href=""><i class="bi bi-facebook"></i></a>--%>
    <%--                                <a href=""><i class="bi bi-instagram"></i></a>--%>
    <%--                                <a href=""><i class="bi bi-linkedin"></i></a>--%>
    <%--                            </div>--%>
    <%--                        </div>--%>
    <%--                    </div>--%>
    <%--                </div>--%>

    <%--                <div class="col-lg-4 col-md-6">--%>
    <%--                    <div class="member" data-aos="fade-up" data-aos-delay="300">--%>
    <%--                        <div class="pic"><img src="assets/img/team/team-3.jpg" class="img-fluid" alt=""></div>--%>
    <%--                        <div class="member-info">--%>
    <%--                            <h4>William Anderson</h4>--%>
    <%--                            <span>CTO</span>--%>
    <%--                            <div class="social">--%>
    <%--                                <a href=""><i class="bi bi-twitter"></i></a>--%>
    <%--                                <a href=""><i class="bi bi-facebook"></i></a>--%>
    <%--                                <a href=""><i class="bi bi-instagram"></i></a>--%>
    <%--                                <a href=""><i class="bi bi-linkedin"></i></a>--%>
    <%--                            </div>--%>
    <%--                        </div>--%>
    <%--                    </div>--%>
    <%--                </div>--%>

    <%--            </div>--%>

    <%--        </div>--%>
    <%--    </section><!-- End Team Section -->--%>

    <!-- ======= Contact Section ======= -->
    <section id="contact" class="contact">
        <div class="container" data-aos="fade-up">

            <div class="section-title">
                <h2>Contact</h2>
                <p>사이트 이용에 문의점이 있다면 언제든지 연락 주세요.</p>
            </div>

            <div class="row">
                <div class="col-lg-6">
                    <div class="info-box mb-4">
                        <i class="bx bx-map"></i>
                        <h3>Our Address</h3>
                        <p>대한민국 대전광역시 동구 가양로 352-21</p>
                    </div>
                </div>

                <div class="col-lg-3 col-md-6">
                    <div class="info-box  mb-4">
                        <i class="bx bx-envelope"></i>
                        <h3>Email Us</h3>
                        <p>soft@kr.ac.kopo</p>
                    </div>
                </div>

                <div class="col-lg-3 col-md-6">
                    <div class="info-box  mb-4">
                        <i class="bx bx-phone-call"></i>
                        <h3>Call Us</h3>
                        <p>+82 111 1111 1111</p>
                    </div>
                </div>

            </div>

            <div class="row">

                <div class="col-lg-6 ">
                    <iframe class="mb-4 mb-lg-0"
                            src="https://maps.google.com/maps?q=%ED%95%9C%EA%B5%AD%ED%8F%B4%EB%A6%AC%ED%85%8D%EB%8C%80%ED%95%99&t=&z=13&ie=UTF8&iwloc=&output=embed"
                            frameborder="0" style="border:0; width: 100%; height: 384px;" allowfullscreen></iframe>
                </div>

                <div class="col-lg-6">
                    <form action="forms/contact.php" method="post" role="form" class="php-email-form">
                        <div class="row">
                            <div class="col-md-6 form-group">
                                <input type="text" name="name" class="form-control" id="name" placeholder="Your Name"
                                       required>
                            </div>
                            <div class="col-md-6 form-group mt-3 mt-md-0">
                                <input type="email" class="form-control" name="email" id="email"
                                       placeholder="Your Email" required>
                            </div>
                        </div>
                        <div class="form-group mt-3">
                            <input type="text" class="form-control" name="subject" id="subject" placeholder="Subject"
                                   required>
                        </div>
                        <div class="form-group mt-3">
                            <textarea class="form-control" name="message" rows="5" placeholder="Message"
                                      required></textarea>
                        </div>
                        <div class="my-3">
                            <div class="loading">Loading</div>
                            <div class="error-message"></div>
                            <div class="sent-message">Your message has been sent. Thank you!</div>
                        </div>
                        <div class="text-center">
                            <button type="submit">Send Message</button>
                        </div>
                    </form>
                </div>

            </div>

        </div>
    </section><!-- End Contact Section -->

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
                <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="true">
                    Home
                </button>
                <div class="collapse show" id="home-collapse">
                    <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                        <li><a href="/" class="link-dark d-inline-flex text-decoration-none rounded">Index</a></li>
                        <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">Update soon</a></li>
                        <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">Update soon</a></li>
                    </ul>
                </div>
            </li>
            <li class="mb-1">
                <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#dashboard-collapse" aria-expanded="false">
                Boards
                </button>
                <div class="collapse" id="dashboard-collapse">
                    <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                        <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">Java</a></li>
                        <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">Python</a></li>
                        <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">Node.js</a></li>
                        <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded"></a></li>
                        <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">Annually</a></li>
                        <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">Annually</a></li>
                        <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">Annually</a></li>
                        <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">Annually</a></li>
                        <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">Annually</a></li>
                        <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">Annually</a></li>
                    </ul>
                </div>
            </li>
            <li class="mb-1">
                <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#orders-collapse" aria-expanded="false">
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
                <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#admin-collapse" aria-expanded="false">
                    Archivist Controls
                </button>
                <div class="collapse" id="admin-collapse">
                    <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                        <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">Notice</a></li>
                        <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">Board</a></li>
                        <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">Lang Append</a></li>
                        <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">Members</a></li>
                    </ul>
                </div>
            </li>
            </c:if>
            <c:if test="${not empty sessionScope.member}">
            <li class="border-top my-3"></li>
            <li class="mb-1">
                <button class="btn btn-toggle d-inline-flex align-items-center rounded border-0 collapsed" data-bs-toggle="collapse" data-bs-target="#account-collapse" aria-expanded="false">
                    ${sessionScope.member.memberNick}
                </button>
                <div class="collapse" id="account-collapse">
                    <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
                        <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">Profile</a></li>
                        <li><a href="#" class="link-dark d-inline-flex text-decoration-none rounded">Settings</a></li>
                        <li><a href="/member/escape" class="link-dark d-inline-flex text-decoration-none rounded">Sign out</a></li>
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
                        <input class="input100" type="email" name="memberId">
                        <span class="focus-input100" data-placeholder="Email"></span>
                    </div>

                    <div class="wrap-input100 validate-input" data-validate="Enter password">
						<span class="btn-show-pass">
							<i class="zmdi zmdi-eye"></i>
						</span>
                        <input class="input100" type="password" name="memberPass">
                        <span class="focus-input100" data-placeholder="Password"></span>
                    </div>

                    <div class="container-login100-form-btn">
                        <div class="wrap-login100-form-btn">
                            <div class="login100-form-bgbtn"></div>
                            <button class="login100-form-btn"
                                    onclick="document.getElementById('signInSubmitHandler').submit();">
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
                            <button type="button" class="login100-form-btn btn-control"
                                    onclick="document.getElementById('signUpSubmitHandler').submit();" disabled>
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

</body>

</html>
