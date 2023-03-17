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
        <!-- bebebtalk 로고 Google fonts-->
        <link href="https://fonts.googleapis.com/css2?family=Gaegu:wght@700&display=swap" rel="stylesheet">
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="${cpath}/resources/css/styles.css" rel="stylesheet" />
        <style>
            body {
                font-family: Arial, sans-serif;
                max-width: auto;
                margin: 0 auto;
            }
    
            h1 {
                text-align: center;
                margin-bottom: 2rem;
            }
    
            h3 {
                margin-top: 2rem;
            }
    
            ul {
                margin-top: 0.5rem;
                margin-bottom: 2rem;
            }
    
            li {
                margin: 0.5rem 0;
            }
    
            /* 검사 순서안내  반응형 센터정렬 */
           .wrapper{
                display: flex;
                justify-content: center;
            }
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
                background-color:#228B22;
                text-align: center;
                line-height: 100px;
                font-size: 15px;
                font-weight: bolder;
                box-shadow: 3px 3px 3px 3px gray;
            }
    
            .step-box4 {
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
        </style>
    </head>
    
    <body>
        <!-- 상단: 로고와 메뉴-->
        <nav class="navbar navbar-expand-lg navbar-light" id="mainNav">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="${cpath}/main.do" style="font-size: 2.5em; color: rgb(10, 75, 18); font-family: 'Gaegu'; font-weight: 700;" >베베톡</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
                    aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto py-4 py-lg-0">
                    <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="${cpath}/childList.do?testeeID=${uvo.userID}" style="font-size: 1em; color: black;"> TEST </a></li>
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="${cpath}/myPage.do?testeeID=${uvo.userID}" style="font-size: 1em;color: black;"> MY PAGE </a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- 헤더이미지+ 페이지 이름-->
        <header class="masthead" style="background-image: url('resources/assets/img/항목검사페이지_헤더.jpg')">
            <div class="container position-relative px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <div class="page-heading">
                            <h2 style="color:rgb(18, 17, 17); font-weight: bold;">문항 검사</h2>
                            <div class="masthead-content">
                                <div class="container px-5">
                                    <!-- <a class="btn btn-primary btn-xl rounded-pill mt-5" href="#scroll">Learn More</a> -->
                                    <!--<span class="subheading"></span>-->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>

        <!--검사순서 안내-->
        <div class="wrapper">
        <div style="padding-top: 40px;">
            <div class="container px- text-center" style="font-family: 'GangwonEdu_OTFBoldA';">
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
                        <div class="step-box3" style="color: white;">
                            3. 문항 검사
                        </div>
                    </div>
                    <div class="col">
                        <div class="step-box4">
                            4. 결과보기
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </div>
        <br><br>
        <!--문항체크실시-->
        <div class="container px-5 bg-light ">
            <div class="checkform" style="padding-top: 5%;padding-bottom: 10%;">
                <h2 style="text-align: center;">[4세용] 우리아이 간단검사🌱</h2>
                <hr class='hr-solid' style="border : 0px;border-top: 5px solid #88c56a;" />
                <br>
                <form>
                    <h4>1. 언어 이해</h4>
                    <ul>
                        <li>단순한 지시사항을 이해할 수 있나요?</li>
                        <input type="radio" name="question1_1" value="yes"> Yes
                        <input type="radio" name="question1_1" value="no"> No
                        <li>단어와 이미지를 매칭할 수 있나요?</li>
                        <input type="radio" name="question1_2" value="yes"> Yes
                        <input type="radio" name="question1_2" value="no"> No
                    </ul>
    
                    <h4>2. 언어 표현</h4>
                    <ul>
                        <li>문장을 완성할 수 있나요?</li>
                        <input type="radio" name="question2_1" value="yes"> Yes
                        <input type="radio" name="question2_1" value="no"> No
                        <li>복잡한 문장을 이해하고 사용할 수 있나요?</li>
                        <input type="radio" name="question2_2" value="yes"> Yes
                        <input type="radio" name="question2_2" value="no"> No
                        <li>새로운 단어를 배우고 사용할 수 있나요?</li>
                        <input type="radio" name="question2_3" value="yes"> Yes
                        <input type="radio" name="question2_3" value="no"> No
                    </ul>
    
                    <h4>3. 언어 발음</h4>
                    <ul>
                        <li>대부분의 단어를 명확하게 발음할 수 있나요?</li>
                        <input type="radio" name="question3_1" value="yes"> Yes
                        <input type="radio" name="question3-1" value="no"> No
                        <li>발음에 대한 자기 평가가 가능하나요?</li>
                        <input type="radio" name="question3_2" value="yes"> Yes
                        <input type="radio" name="question3_2" value="no"> No
                    </ul>
    
                    <h4>4. 언어 사회화</h4>
                    <ul>
                        <li>대화에서 참여할 수 있나요?</li>
                        <input type="radio" name="question4_1" value="yes"> Yes
                        <input type="radio" name="question4_1" value="no"> No
                        <li>다른 사람의 감정을 이해하고 그에 맞는 대화를 할 수 있나요?</li>
                        <input type="radio" name="question4_2" value="yes"> Yes
                        <input type="radio" name="question4_2" value="no"> No
                        <li>적절한 상황에서 예의와 예절을 지키며 대화할 수 있나요?</li>
                        <input type="radio" name="question4_3" value="yes"> Yes
                        <input type="radio" name="question4_3" value="no"> No
                    </ul>
    
                    <h4>5. 언어 활용</h4>
                    <ul>
                        <li>이야기나 책을 이해하고 다른 사람에게 설명할 수 있나요?</li>
                        <input type="radio" name="question5_1" value="yes"> Yes
                        <input type="radio" name="question5_1" value="no"> No
                        <li>자신의 생각과 감정을 표현할 수 있나요?</li>
                        <input type="radio" name="question5_2" value="yes"> Yes
                        <input type="radio" name="question5_2" value="no"> No
                    </ul>
                    <div class="d-block text-center mt-2 small">
                        <button type="button" class="btn btn-primary" onClick="location.href='${cpath}/result2.do'"> 결과
                            확인하기
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                class="bi bi-arrow-right" viewBox="0 0 16 16">
                                <path fill-rule="evenodd"
                                    d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z" />
                            </svg>
                        </button>
                    </div>
                </form>
            </div>
        </div><br><br>
    
    
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
        <script src="js/scripts.js"></script>
    </body>
    
    </html>