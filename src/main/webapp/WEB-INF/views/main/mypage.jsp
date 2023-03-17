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
    <style>
	      hr {
	  border: none;
	  border-top: 1px dotted #f89808;
	  color: #fff;
	  background-color: #fff;
	  height: 1px;
	  width: 100%;
	}
	    </style>
</head>

<body>
     <!-- 상단: 로고와 메뉴-->
    <nav class="navbar navbar-expand-lg navbar-light" id="mainNav">
        <div class="container px-4 px-lg-5">

            <a class="navbar-brand" href="${cpath}/main.do"
                style="font-size: 2.5em; color: rgb(255, 255, 255); text-shadow: 2px 2px 2px rgb(0, 0, 0); font-family: 'Gaegu', cursive; font-weight: 700;">베베톡</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
                aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                Menu
                <i class="fas fa-bars"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ms-auto py-4 py-lg-0">
                    <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="${cpath}/kidsSelect.do" style="font-size: 1em;color: rgb(2, 50, 4);"> TEST </a></li>
                    <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="${cpath}/myPage.do" style="font-size: 1em; color: rgb(2, 50, 4);"> MY PAGE </a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- 헤더이미지+ 페이지 이름-->
    <header class="masthead" style="background-image: url('resources/assets/img/마이페이지_헤더.jpg')">
        <div class="container position-relative px-4 px-lg-5">
            <div class="row gx-4 gx-lg-5 justify-content-center">
                <div class="col-md-10 col-lg-8 col-xl-7">
                    <div class="page-heading">
                        <h2 style="text-align: center;">마이페이지</h2>
                        <div class="masthead-content">
                            <div class="container px-5">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
    </header>

    <!--로그인된 회원 이름 보여주기-->
    <section>
        <div class="container px-5 " style="padding-top:40px;">
            <h1>"홍길동"님 환영합니다.</h1>
        </div>
    </section>

    <!-- 등록된 자녀 보여주기 1, 2, 3 선택한 이미지 보여주기-->
    <section class="page-section bg-light" style="margin-top: 40px;">
        <div class="container px-5 "><br>
            <div class="p-2">
                <h2>등록된 자녀</h2>
                <hr class='hr-solid' style="border : 0px;border-top: 5px solid #88c56a;" />
                <br>
            </div>
            <div class="row gx-5 align-items-center"></div>
            <div class="row row-cols-1 row-cols-sm-3 g-4" style="padding: 1px 1px 50px 1px;">
                <div class="col">
                    <div class="card">
                        <img src="resources/assets/img/아이선택페이지_프로필1.jpg" class="card-img-top" alt="...">
                        <div class="card-body ">
                            <h5 class="card-title text-center">"경워니"</h5>
                            <p class="card-text text-center"> 4세 / 여 </p>
                            <button type="button" class="btn btn-default btn-sm text-white"
                                style="background-color:#228B22; float: right; border-radius: 10px;">삭제</button>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card">
                        <img src="resources/assets/img/아이선택페이지_프로필3.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title text-center">"유나니"</h5>
                            <p class="card-text text-center"> 5세 / 남 </p>
                            <button type="button" class="btn btn-default btn-sm text-white"
                               style="background-color:#228B22; float: right; border-radius: 10px;">삭제</button>
                        </div>
                    </div>
                </div>
                <div class="col">
                    <div class="card">
                        <img src="resources/assets/img/아이선택페이지_프로필3.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                            <h5 class="card-title text-center">"은지니"</h5>
                            <p class="card-text text-center"> 6세 / 여 </p>
                            <button type="button" class="btn btn-default btn-sm text-white"
                                style="background-color:#228B22; float: right; border-radius: 10px;">삭제</button>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="page-section bg-light">
        <div class="container">
            <div class="p-2" style="margine-top: 100px;">
                <h2 style="padding-top: 30px;">이전 검사 결과</h2>
                <hr class='hr-solid' style="border : 0px;border-top: 5px solid #88c56a;" />
                <br>
            </div>
            <div class="row justify-content-center">
                <div class="item col-12 col-lg-4 p-3 mb-4" >
                    <div class="item-inner theme-bg-light rounded p-4 " style="border : 2px solid #f89808;background-color: white;">
                        <h6>검사 날짜</h6>
                        <hr>
                        <blockquote class="quote">
                            "이전 검사 결과 "
                        </blockquote>
                        <div class="source row gx-md-3 gy-3 gy-md-0">
                            <div class="col source-info text-center text-md-start">
                                <div class="source-name" style="text-align: right;">자녀이름</div>
                                <div class="source-info" style="text-align: right;">성별/나이</div>
                            </div>
                        </div>                    
                    </div>     
                </div>
                <div class="item col-12 col-lg-4 p-3 mb-4" >
                    <div class="item-inner theme-bg-light rounded p-4 " style="border : 2px solid #f89808;background-color: white;">
                        <h6>검사 날짜</h6>
                        <hr>
                        <blockquote class="quote">
                            "이전 검사 결과 "
                        </blockquote>
                        <div class="source row gx-md-3 gy-3 gy-md-0">
                            <div class="col source-info text-center text-md-start">
                                <div class="source-name" style="text-align: right;">자녀이름</div>
                                <div class="source-info" style="text-align: right;">성별/나이</div>
                            </div>
                        </div>                    
                    </div>     
                </div>
                <div class="item col-12 col-lg-4 p-3 mb-4" >
                    <div class="item-inner theme-bg-light rounded p-4 " style="border : 2px solid #f89808;background-color: white;">
                        <h6>검사 날짜</h6>
                        <hr>
                        <blockquote class="quote">
                            "이전 검사 결과 "
                        </blockquote>
                        <div class="source row gx-md-3 gy-3 gy-md-0">
                            <div class="col source-info text-center text-md-start">
                                <div class="source-name" style="text-align: right;">자녀이름</div>
                                <div class="source-info" style="text-align: right;">성별/나이</div>
                            </div>
                        </div>                    
                    </div>     
                </div>
    
            </div>
            
        
        </div>
    </section>
    <br><br><br>
    <!-- 검사 이력 보여주기
    <section class="bg-light" style="padding: 20px 0px 20px 0px;">
        <div class="container px-5">
            <div class="row gx-5 align-items-center">
                <div class="col-lg-6 order-lg-2">
                        <div class="p-5"><img class="img-fluid rounded-circle" src="assets/img/03.jpg" alt="..." /></div>
                    </div>
                <div class="col-lg-6 order-lg-5">
                    <div class="p-5">
                        <h2>검사 이력</h2>
                        <hr class='hr-solid' style="border : 0px;border-top: 5px solid #88c56a;"/>
                    </div>
                    <div style="width: 9px;">
                        <table class="table" style="width: 900px;">
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col-">자녀이름</th>
                                    <th scope="col">결과</th>
                                    <th scope="col">검사일</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <th scope="row">1</th>
                                    <td>경워니</td>
                                    <td>" 잊었니, 날 잊어버렸니 "</td>
                                    <td>2023.03.08</td>
                                </tr>
                                <tr>
                                    <th scope="row">2</th>
                                    <td>은지니</td>
                                    <td>" 사물을 보고 느낌 "</td>
                                    <td>2023.03.07</td>
                                </tr>
                                <tr>
                                    <th scope="row">3</th>
                                    <td>유나니</td>
                                    <td>" 큐알 찍으세요 "</td>
                                    <td>2023.03.06</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>-->

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