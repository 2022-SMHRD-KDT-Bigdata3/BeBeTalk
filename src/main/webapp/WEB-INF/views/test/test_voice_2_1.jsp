<%@page import="kr.bebetalk.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!-- jstl 태그들은 다른 태그들과 충돌이 날 수 있기 때문에 접두사로 c를 붙여준다! -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
		<title>BeBeTalk</title>
		<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
		<!-- Font Awesome icons (free version)-->
		<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
			crossorigin="anonymous"></script>
		<!-- bebebtalk 로고 Google fonts-->
		<link
			href="https://fonts.googleapis.com/css2?family=Gaegu:wght@700&display=swap"
			rel="stylesheet">
		<!-- Google fonts-->
		<link
			href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic"
			rel="stylesheet" type="text/css" />
		<link
			href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800"
			rel="stylesheet" type="text/css" />
		<!-- Core theme CSS (includes Bootstrap)-->
		<link href="${cpath}/resources/css/styles.css" rel="stylesheet" />
		<style>
		/* 검사 순서안내  반응형 센터정렬 */
		.wrapper {
			display: flex;
			justify-content: center;
		}
		/* 검사 순서안내 원모양 4단계 CSS */
		.step-box1 {
			height: 100px;
			width: 100px;
			border-radius: 50%;
			background-color: #228B22;
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
			background-color: #228B22;
			text-align: center;
			line-height: 100px;
			font-size: 15px;
			font-weight: bolder;
			box-shadow: 3px 3px 3px 3px gray;
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
			background-color: rgb(210, 223, 218);
			text-align: center;
			line-height: 100px;
			font-size: 15px;
			font-weight: bolder;
			/* box-shadow: 2px 2px 2px 2px gray; */
		}
		
		/* 검사 동영상 CSS*/
		video {
			max-width: 80%;
			display: block;
			margin: 20px auto;
		}
		
		/* 헤더 여백 */
		.header_white {
			height: 100px;
		}
		</style>
		<!-- 음성검사 mp3파일 작동 -->
		<script>
		        function play(){
		            var audio = document.getElementById("audio");
		            audio.play();
		        }
		    </script>
		</head>
		
		<body>
			<!-- 상단: 로고와 메뉴-->
			<nav class="navbar navbar-expand-lg navbar-light" id="mainNav">
				<div class="container px-4 px-lg-5">
					<a class="navbar-brand" href="${cpath}/main.do"
						style="font-size: 2.5em; color: rgb(10, 75, 18); font-family: 'Gaegu'; font-weight: 700;">베베톡</a>
					<button class="navbar-toggler" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarResponsive"
						aria-controls="navbarResponsive" aria-expanded="false"
						aria-label="Toggle navigation">
						Menu <i class="fas fa-bars"></i>
					</button>
					<div class="collapse navbar-collapse" id="navbarResponsive">
						<ul class="navbar-nav ms-auto py-4 py-lg-0">
							<li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4"
								href="${cpath}/childList.do?testeeID=${uvo.userID}"
								style="font-size: 1em; color: black;"> TEST </a></li>
							<li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4"
								href="${cpath}/myPage.do?testeeID=${uvo.userID}" style="font-size: 1em; color: black;">
									MY PAGE </a></li>
						</ul>
					</div>
				</div>
			</nav>
		
		
			<!-- 검사관련 동영상 송출 -->
			<!-- <video muted autoplay loop>
		            <source src="./assets/img/해변,게.mp4" type="video/mp4">
		            <strong>Your browser does not support the video tag.</strong>
		          </video>
		          <h3 style="text-align: center; margin-left: 100px; margin-right: 100px;  color: black;  font-family: 'GangwonEdu_OTFBoldA';" >게친구들이 산책을 나왔어요</h3> -->
			<!-- 음성 검사이미지 -->
			<!-- <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
		            <div class="carousel-inner">
		                <div class="carousel-item active" style="background-image: url('assets/img/동화1.jpg')">
		                  <div class="carousel-caption">
		                    <h3 style="background-color: rgb(229, 86, 8); color: black;  font-family: 'GangwonEdu_OTFBoldA';" >여우가 노래를 해요</h3>
		                  </div>
		                </div>
		            </div>
		        </div> -->
		
			<!-- 헤더 여백주기 -->
			<div class="header_white"></div>
		
		
			<!--검사순서 안내-->
			<div class="wrapper">
				<div style="padding-top: 40px;">
					<div class="container px- text-center"
						style="font-family: 'GangwonEdu_OTFBoldA';">
						<div class="row">
							<div class="col">
								<div class="step-box1">1. 자녀선택</div>
							</div>
							<div class="col">
								<div class="step-box2" style="color: white;">2. 음성 검사</div>
							</div>
							<div class="col">
								<div class="step-box3">3. 문항 검사</div>
							</div>
							<div class="col">
								<div class="step-box4">4. 결과보기</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<br>
			<br>
		
			<!-- 검사관련 동영상 송출 -->
			<div class="container" style="width: 2400px;">
				<video muted autoplay loop>
					<source src="resources/assets/img/봄날들판.mp4" type="video/mp4">
					<strong>Your browser does not support the video tag.</strong>
				</video>
				<h3
					style="text-align: center; margin-left: 100px; margin-right: 100px; color: black; font-family: 'GangwonEdu_OTFBoldA';">
					봄이 왔어요! 바람에 꽃이 흔들려요 🌼</h3>
			</div>
			<!-- 재생 버튼-->
			<div class="sound_test">
				<br> <img class="play" src="resources/assets/img/재생.png">
				<button id="myButton" class=value= "PLAY" onclick="play()"
					style="font-family: 'GangwonEdu_OTFBoldA';">재생</button>
				<audio id="audio" src="resources/assets/audio/2-1.mp3"></audio>
		
				<!-- 순서 화살표 -->
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
					fill="currentColor" class="bi bi-chevron-double-right"
					viewBox="0 0 16 16">
		            <path fill-rule="evenodd"
						d="M3.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L9.293 8 3.646 2.354a.5.5 0 0 1 0-.708z" />
		            <path fill-rule="evenodd"
						d="M7.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L13.293 8 7.646 2.354a.5.5 0 0 1 0-.708z" />
		        </svg>
		
		
				<!-- 녹음 버튼-->
				<img class="recode" src="resources/assets/img/녹음.png">
				<button id="myButton2" type="button" type="button">녹음</button>
		
				<!-- 순서 화살표 -->
				<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
					fill="currentColor" class="bi bi-chevron-double-right"
					viewBox="0 0 16 16">
		            <path fill-rule="evenodd"
						d="M3.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L9.293 8 3.646 2.354a.5.5 0 0 1 0-.708z" />
		            <path fill-rule="evenodd"
						d="M7.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L13.293 8 7.646 2.354a.5.5 0 0 1 0-.708z" />
		        </svg>
		
				<!-- 녹음완료 버튼-->
				<img class="stop" src="resources/assets/img/정지.png">
				<button id="myButton3" type="button">완료</button>
				<br>
				<br>
		
				<!--음성검사 녹음 방법 안내 -->
				<div class="container"
					style="box-shadow: 2px 2px 2px 2px rgb(196, 195, 195); border-radius: 20px; width: 1050px;">
					<br>
					<content class="test_record_explain"> <strong
						style="text-align: left; color: #228B22; font-family: 'GangwonEdu_OTFBoldA';">
						음성 테스트 방법 안내 </strong> <br>
					<br>
					<h5>1. [재생] 버튼을 누르시면 테스트 음성이 재생됩니다.</h5>
					<h5>2. [녹음] 버튼을 누른 후 아이의 음성을 녹음해주세요</h5>
					<h5>3. [정지] 버튼을 누르면 녹음이 완료됩니다.</h5>
					<h5>4. [다음] 버튼을 누르시면 다음 검사페이지로 이동합니다.</h5>
					<br>
					</content>
				</div>
				<br>
				<br>
		
		
				<!-- 음성 검사이미지 -->
				<!-- <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
		    <div class="carousel-inner">
		        <div class="carousel-item active" style="background-image: url('assets/img/동화1.jpg')">
		          <div class="carousel-caption">
		            <h3 style="background-color: rgb(229, 86, 8); color: black;  font-family: 'GangwonEdu_OTFBoldA';" >여우가 노래를 해요</h3>
		          </div>
		        </div>
		    </div>
		</div> -->
		
		
				<!--다음(2번째 음성검사)로 가는 버튼-->
				<div style="text-align: center;">
					<button type="button"
						class="btn btn-primary btn-login text-uppercase fw-bold"
						onclick="location.href='${cpath}/testVoice2-2.do'">다음 →</button>
				</div>
			</div>
			<br>
		
			<!-- Footer-->
			<footer class="border-top">
				<div class="container px-4 px-lg-5">
					<div class="row gx-4 gx-lg-5 justify-content-center">
						<div class="col-md-10 col-lg-8 col-xl-7">
							<ul class="list-inline text-center">
								<li class="list-inline-item"><a href="#!"> <span
										class="fa-stack fa-lg"> <i
											class="fas fa-circle fa-stack-2x"></i> <i
											class="fab fa-twitter fa-stack-1x fa-inverse"></i>
									</span>
								</a></li>
								<li class="list-inline-item"><a href="#!"> <span
										class="fa-stack fa-lg"> <i
											class="fas fa-circle fa-stack-2x"></i> <i
											class="fab fa-facebook-f fa-stack-1x fa-inverse"></i>
									</span>
								</a></li>
								<li class="list-inline-item"><a href="#!"> <span
										class="fa-stack fa-lg"> <i
											class="fas fa-circle fa-stack-2x"></i> <i
											class="fab fa-github fa-stack-1x fa-inverse"></i>
									</span>
								</a></li>
							</ul>
							<div class="small text-center text-muted fst-italic">Copyright
								&copy; BEBETALK 2023</div>
		
						</div>
					</div>
				</div>
			</footer>
			<!-- Bootstrap core JS-->
			<script
				src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
			<!-- Core theme JS-->
			<script src="js/scripts.js"></script>
		</body>
		</html>
