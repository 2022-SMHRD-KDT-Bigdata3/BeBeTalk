<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <!-- 태그들을 연결시킬때 사용하는 지시자  -->
   <!-- jstl 태그들은 다른 태그들과 충돌이 날 수 있기 때문에 접두사로 c를 붙여준다! -->
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
  <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
  <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
  <!-- contextpath(유지보수하는데 도움이 됨)를 가지고 오는 방법 -->
  <c:set var="cpath" value="${pageContext.request.contextPath}"/> 
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
        <!--반응형 사이즈 맞추기-->
        <meta name="viewport" content="width=640, user-scalable=yes">
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Clean Blog - Start Bootstrap Theme</title>
        <link rel="icon" type="image/x-icon" href="${cpath}/resources/assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <!-- bebebtalk Google fonts-->
        <link href="https://fonts.googleapis.com/css2?family=Gaegu:wght@700&display=swap" rel="stylesheet">
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${cpath}/resources/css/styles.css" rel="stylesheet" />
</head>
<body>
 <!-- 상단: 로고와 메뉴-->
        <nav class="navbar navbar-expand-lg navbar-light" id="mainNav">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="main copy.html" style="font-size: 2.5em; color: rgb(10, 75, 18); font-family: 'Gaegu'; font-weight: 700; " >베베톡</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto py-4 py-lg-0">
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="login.html" style="font-size: 1em; color: rgb(2, 50, 4);">Test</a></li>
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4"href="mypage.html" style="font-size: 1em; color: rgb(2, 50, 4);">My page</a></li>
                    </ul>
                </div>
            </div>
        </nav>

    
         <!-- 헤더이미지+ 내용 애니메이션 효과-->
        <header class="masthead10" style="background-image: url('${cpath}/resources/assets/img/메인페이지_헤더(현재).jpg');">
            <div class="container position-relative px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <div class="page-heading">
                            <div style="text-align:left; font-family: 'GangwonEdu_OTFBoldA';" >
                                <p style="color: darkgreen; text-align:left; margin-bottom: 0% !important;">
                                    <span class="bbt">B</span>
                                    <span class="bbt">E</span>
                                    <span class="bbt">B</span>
                                    <span class="bbt">E</span>
                                    <span class="bbt">T</span>
                                    <span class="bbt">A</span>
                                    <span class="bbt">L</span>
                                    <span class="bbt">K</span>
                                </p> 
                            </div>
                            <h3 style="text-align: left; font-weight: bolder;">
                                <span class="bbt"> 딥러닝을 활용한<br>영유아 표준 음성 분석시스템</span>
                            </h3>
                        </div>
                    </div>
                </div>
            </div>
        </header>

        <script>
        const introText = document.querySelectorAll("span.bbt");
            window.onload = () => {
            let timer = 150;
            introText.forEach((item) => {
                item.style.animation = `fade 500ms ${(timer += 150)}ms forwards`;
            });
            };
        </script>
                    
            <!-- 중간 베베톡 서비스 소개창-->
            <section id="scroll">
            <div style="background-color:rgb(158, 201, 84)">
                <section class="content-section bg-primary1 text-white text-center" id="services" style="background-color:#008000 rgb (0,128,0); ">
                    <div class="container px-4 px-lg-5"   style="background-color:rgb(158, 201, 84)">
                        <div class="content-section-heading"  style="background-color:rgb(158, 201, 84)"><br>
                            <h2 class="mb-5">Services</h2>
                        </div>
                        <div class="row gx-4 gx-lg-5" style="background-color:rgb(158, 201, 84)">
                            <div class="col-lg-3 col-md-6 mb-5 mb-lg-0">
                                <span class="service-icon rounded-circle mx-auto mb-3">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="45" height="45" fill="currentColor" class="bi bi-music-note-list" viewBox="0 0 16 16">
                                        <path d="M12 13c0 1.105-1.12 2-2.5 2S7 14.105 7 13s1.12-2 2.5-2 2.5.895 2.5 2z"/>
                                        <path fill-rule="evenodd" d="M12 3v10h-1V3h1z"/>
                                        <path d="M11 2.82a1 1 0 0 1 .804-.98l3-.6A1 1 0 0 1 16 2.22V4l-5 1V2.82z"/>
                                        <path fill-rule="evenodd" d="M0 11.5a.5.5 0 0 1 .5-.5H4a.5.5 0 0 1 0 1H.5a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 .5 7H8a.5.5 0 0 1 0 1H.5a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 .5 3H8a.5.5 0 0 1 0 1H.5a.5.5 0 0 1-.5-.5z"/>
                                    </svg>
                                    <i class="icon-screen-smartphone"></i>
                                </span>
                                <h4><strong style="color: white !important">표준 음성데이터 제공</strong></h4>
                            </div>

                            <div class="col-lg-3 col-md-6 mb-5 mb-lg-0">
                                <span class="service-icon rounded-circle mx-auto mb-3">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="45" height="45" fill="currentColor" class="bi bi-soundwave" viewBox="0 0 16 16">
                                        <path fill-rule="evenodd" d="M8.5 2a.5.5 0 0 1 .5.5v11a.5.5 0 0 1-1 0v-11a.5.5 0 0 1 .5-.5zm-2 2a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zm4 0a.5.5 0 0 1 .5.5v7a.5.5 0 0 1-1 0v-7a.5.5 0 0 1 .5-.5zm-6 1.5A.5.5 0 0 1 5 6v4a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm8 0a.5.5 0 0 1 .5.5v4a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm-10 1A.5.5 0 0 1 3 7v2a.5.5 0 0 1-1 0V7a.5.5 0 0 1 .5-.5zm12 0a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-1 0V7a.5.5 0 0 1 .5-.5z"/>
                                    </svg>
                                    <i class="icon-pencil"></i>
                                </span>
                                <h4><strong>음성데이터 검사</strong></h4>
                            </div>

                            <div class="col-lg-3 col-md-6 mb-5 mb-md-0">
                                <span class="service-icon rounded-circle mx-auto mb-3">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="45" height="45" fill="currentColor" class="bi bi-ui-checks" viewBox="0 0 16 16">
                                        <path d="M7 2.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-7a.5.5 0 0 1-.5-.5v-1zM2 1a2 2 0 0 0-2 2v2a2 2 0 0 0 2 2h2a2 2 0 0 0 2-2V3a2 2 0 0 0-2-2H2zm0 8a2 2 0 0 0-2 2v2a2 2 0 0 0 2 2h2a2 2 0 0 0 2-2v-2a2 2 0 0 0-2-2H2zm.854-3.646a.5.5 0 0 1-.708 0l-1-1a.5.5 0 1 1 .708-.708l.646.647 1.646-1.647a.5.5 0 1 1 .708.708l-2 2zm0 8a.5.5 0 0 1-.708 0l-1-1a.5.5 0 0 1 .708-.708l.646.647 1.646-1.647a.5.5 0 0 1 .708.708l-2 2zM7 10.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-7a.5.5 0 0 1-.5-.5v-1zm0-5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5zm0 8a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5z"/>
                                    </svg>
                                    <i class="icon-like"></i>
                                </span>
                                <h4><strong>문항 검사</strong></h4>
                            </div>
                                
                            <div class="col-lg-3 col-md-6">
                                <span class="service-icon rounded-circle mx-auto mb-3">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="45" height="45" fill="currentColor" class="bi bi-card-list" viewBox="0 0 16 16">
                                        <path d="M14.5 3a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-13a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h13zm-13-1A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13z"/>
                                        <path d="M5 8a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7A.5.5 0 0 1 5 8zm0-2.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm0 5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 0 1h-7a.5.5 0 0 1-.5-.5zm-1-5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zM4 8a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0zm0 2.5a.5.5 0 1 1-1 0 .5.5 0 0 1 1 0z"/>
                                    </svg>
                                    <i class="icon-mustache"></i>
                                    </span>
                                <h4><strong>결과안내</strong></h4><br>
                            </div>
                    </div>
                </section>
            </div>

            <!-- 서비스 소개 아래 이미지-->
            <header class="masthead" style="background-image: url('${cpath}/resources/assets/img/메인페이지_아래2.jpg')">    
            </header>


            <!-- Footer-->
            <footer class="border-top">
                <div class="container px-4 px-lg-5">
                    <div class="row gx-4 gx-lg-5 justify-content-center">
                        <div class="col-md-10 col-lg-8 col-xl-7">
                            <ul class="list-inline text-center">
                                <li class="list-inline-item">
                                    <a href="#!">
                                        <span class="fa-stack fa-lg">
                                            <i class="fas fa-circle fa-stack-2x"></i>
                                            <i class="fab fa-twitter fa-stack-1x fa-inverse"></i>
                                        </span>
                                    </a>
                                </li>
                                <li class="list-inline-item">
                                    <a href="#!">
                                        <span class="fa-stack fa-lg">
                                            <i class="fas fa-circle fa-stack-2x"></i>
                                            <i class="fab fa-facebook-f fa-stack-1x fa-inverse"></i>
                                        </span>
                                    </a>
                                </li>
                                <li class="list-inline-item">
                                    <a href="#!">
                                        <span class="fa-stack fa-lg">
                                            <i class="fas fa-circle fa-stack-2x"></i>
                                            <i class="fab fa-github fa-stack-1x fa-inverse"></i>
                                        </span>
                                    </a>
                                </li>
                            </ul>
                            <div class="small text-center text-muted fst-italic">Copyright &copy; BEBETALK 2023</div>
                        </div>
                    </div>
                </div>
            </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="${cpath}/resources/js/scripts.js"></script>
</body>
</html>