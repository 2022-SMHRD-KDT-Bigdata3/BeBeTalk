<%@page import="kr.bebetalk.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <!-- jstl 태그들은 다른 태그들과 충돌이 날 수 있기 때문에 접두사로 c를 붙여준다! -->
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
  <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
  <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
  
  <!-- contextpath(유지보수하는데 도움이 됨)를 가지고 오는 방법 -->
<c:set var="cpath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <!--반응형 사이즈 맞추기-->
    <meta name="viewport" content="width=640, user-scalable=yes">
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title> BeBeTalk </title>
    <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet"
        type="text/css" />
    <link
        href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
        rel="stylesheet" type="text/css" />
    <!-- bebebtalk Google fonts-->
    <link href="https://fonts.googleapis.com/css2?family=Gaegu:wght@700&display=swap" rel="stylesheet">
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="${cpath}/resources/css/styles.css" rel="stylesheet" />
    <link href="${cpath}/resources/css/result.css" rel="stylesheet" />

    <style>
         /* 검사 순서안내 원모양 4단계 CSS */
        .step-box1 {
            height: 100px;
            width: 100px;
            border-radius: 50%;
            background-color: rgb(210, 223, 218);
            text-align: center;
            line-height: 100px;
            font-size: 15px;
            font-weight: bolder;
            /* box-shadow: 2px 2px 2px 2px gray; */
        }

        .step-box2 {
            height: 100px;
            width: 100px;
            border-radius: 50%;
            background-color: rgb(210, 223, 218);
            text-align: center;
            line-height: 100px;
            font-size: 15px;
            font-weight: bolder;
            /* box-shadow: 3px 3px 3px 3px gray; */
        }


        .step-box3 {
            height: 100px;
            width: 100px;
            border-radius: 50%;
            background-color: rgb(210, 223, 218);
            text-align: center;
            line-height: 100px;
            font-size: 15px;
            font-weight: bolder;
            /* box-shadow: 3px 3px 3px 3px gray; */
        }

        .step-box4 {
            height: 100px;
            width: 100px;
            border-radius: 50%;
            background-color: #228B22;
            text-align: center;
            line-height: 100px;
            font-size: 15px;
            font-weight: bolder;
            box-shadow: 3px 3px 3px 3px gray;
        }
    </style>
</head>


<body style="font-family: 'GangwonEdu_OTFBoldA';">
 <!-- 상단: 로고와 메뉴-->
    <nav class="navbar navbar-expand-lg navbar-light" id="mainNav">
        <div class="container px-4 px-md-5">
            <a class="navbar-brand" href="${cpath}/main.do"
                style="font-size: 2.5em; color: rgb(10, 75, 18); font-family: 'Gaegu'; font-weight: 700;">베베톡</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive"

            
                aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                Menu
                <i class="fas fa-bars"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ms-auto py-4 py-lg-0">
                    <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="${cpath}/kidsSelect.do"
                            style="font-size: 1em; color: black;"> TEST </a></li>
                    <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="${cpath}/myPage.do"
                            style="font-size: 1em; color: black;"> MY PAGE </a></li>
                            
                </ul>
            </div>
        </div>
    </nav>
    <!-- 헤더이미지+ 페이지 이름-->
    <header class="masthead" style="background-image: url('resources/assets/img/결과페이지_헤더.jpg')">
        <div class="container position-relative px-4 px-lg-5">
            <div class="row gx-4 gx-lg-5 justify-content-center">
                <div class="col-md-10 col-lg-8 col-xl-7">
                    <div class="page-heading">
                        <h2 style="text-align: center;">결과</h2>
                        <!--<span class="subheading"></span>-->
                    </div>
                </div>
            </div>
        </div>
    </header>

   <!--검사순서 안내-->
    <div style="padding-top: 40px;">
        <div class="container px- text-center">
            <div class="row">
                <div class="col">
                    <div class="step-box1">
                        1. 자녀선택
                    </div>
                </div>
                <div class="col">
                    <div class="step-box2">
                        2. 음성 비교
                    </div>
                </div>
                <div class="col">
                    <div class="step-box3">
                        3. 문항 검사
                    </div>
                </div>
                <div class="col">
                    <div class="step-box4" style="font-family: 'GangwonEdu_OTFBoldA' ;color:white;">
                        4. 결과보기
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br><br>


    <!--검사결과-->
    <div class="container">
        <div class="container px-4 text-center">
            <h3 style="font-family: 'GangwonEdu_OTFBoldA'; text-align: center;"><strong>검사결과</strong></h3>
            <hr class='hr-solid' style="border : 0px;border-top: 5px solid #88c56a;" />
            <br>
            <div class="result">
                <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-megaphone" viewBox="0 0 16 16">
                    <path d="M13 2.5a1.5 1.5 0 0 1 3 0v11a1.5 1.5 0 0 1-3 0v-.214c-2.162-1.241-4.49-1.843-6.912-2.083l.405 2.712A1 1 0 0 1 5.51 15.1h-.548a1 1 0 0 1-.916-.599l-1.85-3.49a68.14 68.14 0 0 0-.202-.003A2.014 2.014 0 0 1 0 9V7a2.02 2.02 0 0 1 1.992-2.013 74.663 74.663 0 0 0 2.483-.075c3.043-.154 6.148-.849 8.525-2.199V2.5zm1 0v11a.5.5 0 0 0 1 0v-11a.5.5 0 0 0-1 0zm-1 1.35c-2.344 1.205-5.209 1.842-8 2.033v4.233c.18.01.359.022.537.036 2.568.189 5.093.744 7.463 1.993V3.85zm-9 6.215v-4.13a95.09 95.09 0 0 1-1.992.052A1.02 1.02 0 0 0 1 7v2c0 .55.448 1.002 1.006 1.009A60.49 60.49 0 0 1 4 10.065zm-.657.975 1.609 3.037.01.024h.548l-.002-.014-.443-2.966a68.019 68.019 0 0 0-1.722-.082z"/>
                  </svg><span style="font-size: 25px; font-family: 'GangwonEdu_OTFBoldA';">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${result.resultString}</span>
            </div>

        </div>
        <br><br><br>

        <!--발달 확인 기준-->
        <div>
            <div class="container px-4 text-center">
                <h3 style= "font-family: 'GangwonEdu_OTFBoldA'";> 4세 언어 발달 특징🌱 </h3>
                <hr class='hr-solid' style="border : 0px;border-top: 5px solid #88c56a;" />

                <div class="container px-5">
                    <div class="row gx-lg-5 align-items-center" style="padding-top: 0%;">
                        <div class="row gx-lg-4 align-items-center">
                            <!-- <div class="p-4"><img class="img-fluid rounded-circle" src="assets/img/01.jpg" alt="..." /></div> -->

                            <div class="p-2">
                                <h5 style="text-align: left;color: #f89808;">수용언어</h5>
                                <ul>
                                    <li style="text-align: left;">간접적인 대화(유머, 거짓말)를 이해할 수 있습니다.</li>
                                    <li style="text-align: left;">2800개 이상의 수용어휘를 습득합니다.</li>
                                    <li style="text-align: left;">짧고 단순한 이야기를 경청합니다.</li>
                                    <li style="text-align: left;">리듬, 노래, 무의미 음절 등을 즐깁니다.</li>
                                </ul>
                                <h5 style="text-align: left;color: #f89808;">표현언어</h5>
                                <ul>
                                    <li style="text-align: left;">문법에 맞고 길이가 긴 문장을 사용할 수 있게 됩니다.</li>
                                    <li style="text-align: left;">4~5단어로 된 문장을 사용할 수 있습니다.</li>
                                    <li style="text-align: left;">약1500~2000개의 어휘를 사용할 수 있습니다. </li>
                                    <li style="text-align: left;">모방을 하면서 5까지 셀 수 있습니다.</li>
                                    <li style="text-align: left;">두 부분으로 되어 있는 복잡한 질문에 대답합니다. </li>
                                    <li style="text-align: left;">생략, 대치와 같은 조음 오류가 줄어듭니다.</li>
                                    <li style="text-align: left;">발음 명료도가 높아져 낯선 사람에게도 대체로 명료하게 들립니다.</li>
                                    <li style="text-align: left;">자신의 경험을 이야기합니다.</li>
                                    <li style="text-align: left;">이야기를 듣고 그에 대한 간단한 질문을 합니다.</li>
                                    <li style="text-align: left;">피동형 문장을 사용합니다.</li>
                                    <li style="text-align: left;">계속 반복하며 말하기를 좋아합니다.</li>
                                    <li style="text-align: left;">최상급 표현을 사용합니다.(예. 가장 큰 것, 가장 많은 것)</li>
                                    <li style="text-align: left;">앞으로 일어날 일에 대해 이야기합니다.</li>
                                    <li style="text-align: left;">오늘, 어제, 내일의 개념을 알고 있습니다.</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
    </div>
    <br><br><br>

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
                    <div class="small text-center text-muted fst-italic">Copyright &copy; Your Website 2022</div>
                </div>
            </div>
        </div>
    </footer>
    <!-- Bootstrap core JS-->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts.js"></script>
    <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
    <!-- * *                               SB Forms JS                               * *-->
    <!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
    <!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
    <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script>
</body>

</html>