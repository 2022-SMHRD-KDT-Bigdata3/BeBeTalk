<%@page import="kr.bebetalk.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

     <!-- jstl 태그들은 다른 태그들과 충돌이 날 수 있기 때문에 접두사로 c를 붙여준다! -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
  
  <!-- contextpath(유지보수하는데 도움이 됨)를 가지고 오는 방법 -->
<c:set var="cpath" value="${pageContext.request.contextPath}" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>


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
        <link href="${cpath}/resources/css/loading.css" rel="stylesheet" />
        <style>
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
                background-color:#228B22;
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
                background-color:#228B22;
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
                background-color:rgb(210, 223, 218);
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
      video { max-width: 80%; display: block; margin: 20px auto; }
    
    /* 헤더 여백 */
     .header_white {
      height: 80px;
   }
   

        </style>
        
        
<script type="text/javascript"> 

<!--로딩페이지 작동후 20초후 이동-->
$(document).ready(function() {
	   $('#waiting').hide();
	   $('#lodingBtn').click(function() {
	       $('#waiting').show();
	       setTimeout(function() {
	           window.location.href = "${cpath}/testCheck.do";
	       }, 20000); // 20초 대기 후 이동
	       return true;
	   });
	});



   <!-- 음성검사 mp3파일 작동 -->
   function play(){
       var audio = document.getElementById("audio");
       audio.play();
   }


     function startRecording() {
           console.log("녹음버튼 클릭!");

           // getUserMedia()에서 성공 또는 실패할 때까지 녹화 버튼을 비활성화합니다
           recordButton.disabled = true;
           stopButton.disabled = false;

           navigator.mediaDevices.getUserMedia({audio: true, video: false}).then(function(stream) {
               console.log("getUserMedia() success, stream created, initializing Recorder.js ...");

               // 저장될 오디오의 sampleRate 조정
               audioContext = new AudioContext({sampleRate: 16000});

               // 나중에 사용할 수 있도록 gumStream에 할당
               gumStream = stream;

               // use the stream
               input = audioContext.createMediaStreamSource(stream);

               // Recorder 개체를 만들고 모노 사운드를 녹음하도록 구성합니다(1채널). 2채널을 녹음하면 파일 크기가 두 배가 됩니다
               rec = new Recorder(input, {numChannels: 1})

               //recording 시작
               rec.record()

               console.log("녹음시작!");

           }).catch(function(err) {
               //getUserMedia()가 실패할 경우 record 버튼을 활성화합니다
               recordButton.disabled = false;
               stopButton.disabled = true;
           });
       }
     
     
     function stopRecording() {
           console.log("녹음완료 버튼 클릭!");

           //중지 버튼을 비활성화하고, 레코드를 활성화하여 새 녹화를 허용합니다
           stopButton.disabled = true;
           recordButton.disabled = false;

           //녹음중지
           rec.stop(); 
           gumStream.getAudioTracks()[0].stop();

           // Wavblob을 생성하여 DownloadLink 생성에 전달합니다
           rec.exportWAV(createDownloadLink);
       }
     
     function createDownloadLink(blob) { // 음성 다운로드 함수(blob을 파라미터로 활용)
           const soundClips = document.getElementById('sound-clips');
        
           // (1) <audio> 태그 담을 컨테이너 객체 생성
           const clipcontainer = document.createElement('article');
           
           // (2) audio 객체 생성 및 속성 설정
           var audio = document.createElement('audio');
           audio.controls = true;
           
           // 오디오를 다운로드 하게된다면 필요한 코드
           //var li = document.createElement('li');
           //var link = document.createElement('a');
           
           // (3) 컨테이너에 audio 연결
           clipcontainer.appendChild(audio);
           
           // <div>에 <audio> 태그 출력
            // 이전에 녹음할 때 추가한 childNode가 존재한다면 제거
            if(soundClips.hasChildNodes())
                soundClips.removeChild(soundClips.childNodes[0]);
            // 녹음한 데이터 추가
            soundClips.appendChild(clipcontainer);
            
            // rec 초기화 (초기화 하지 않으면 녹음 내용이 누적 저장됨)
            rec = [];

            // audio 소스 지정
            var url = URL.createObjectURL(blob);
            audio.src = url;
            
           //업로드 및 다운로드 중에 사용할 파일 이름(확장자 없음)
           var filename ="Voice";
           console.log("audio");
           console.log(audio);
           console.log(blob);
           
           const formData = new FormData(); //formData 객체 생성
           const file = new File([blob], filename+".wav"); // blob오디오를 filename 으로 지정하여 file에 담아줌
           formData.append("file", file); // formData에 append
          
           
           $.ajax({ //url이 test1-1인 flask로 음성을 보내는 ajax
               url : "http://127.0.0.1:5001/test2_3",
               type : "POST",
               data : formData,
               contentType : false,
               processData : false,
               success : function(data){
                  console.log(data); 
                  var prediction=data["prediction"];
                 var probability=data["probability"];
                 // js session에 저장
                 sessionStorage.setItem("prediction", prediction); 
                 sessionStorage.setItem("probability", probability); 
               },
               error : function(e){ console.log(e); }
            });
           
           /*
           //컴퓨터에 저장할 링크
           link.href = url;
           link.download = filename+".wav"; // 확장자설정
           link.innerHTML = "Save to disk";

           //li 에 audio 요소를 추가한다
           li.appendChild(audio);
           
           // li에 파일이름 추가
           li.appendChild(document.createTextNode(filename+".wav"))

           // 다운로드 링크 추가
           li.appendChild(link);

           // ol태그에 li태그르 append
           recordingsList.appendChild(li);*/
       }
</script> 

         
    </head>

    <body>
        <!-- 상단: 로고와 메뉴-->
        <nav class="navbar navbar-expand-lg navbar-light" id="mainNav">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="${cpath}/main.do" style="font-size: 2.5em; color: rgb(10, 75, 18); font-family: 'Gaegu'; font-weight: 700;" >베베톡</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto py-4 py-lg-0">
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="${cpath}/kidsSelect.do" style="font-size: 1em;color: black;"> TEST </a></li>
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="${cpath}/myPage.do" style="font-size: 1em;color: black;"> MY PAGE </a></li>
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
                <div class="container px- text-center" style="font-family: 'GangwonEdu_OTFBoldA';">
                    <div class="row">
                        <div class="col">
                            <div class="step-box1">
                                1. 자녀선택
                            </div>
                        </div>
                        <div class="col">
                            <div class="step-box2" style="color: white;">
                                2. 음성 검사
                            </div>
                        </div>
                        <div class="col">
                            <div class="step-box3">
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

             <!-- 검사관련 동영상 송출 -->
             <div class="container" style="width: 2400px;">          
                <video autoplay loop>
                    <source src="resources/assets/img/꽃밭강아지.mp4" type="video/mp4">
                    <strong>Your browser does not support the video tag.</strong>
                </video>
                <h3 style="text-align: center; margin-left: 100px; margin-right: 100px;  color: black;  font-family: 'GangwonEdu_OTFBoldA';" >
                꽃밭에 산책을 나온 강아지가 꽃향기를 맡아요 🐶</h3>
             </div>
             <!-- 재생 버튼-->
    <div class="sound_test"><br>
        <img class="play" src="resources/assets/img/재생.png">
        <button id="myButton" class=value="PLAY" onclick="play()" style=" font-family: 'GangwonEdu_OTFBoldA';">재생</button>
        <audio id="audio" src="resources/assets/audio/2-3.mp3"></audio>

        <!-- 순서 화살표 -->
        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
            class="bi bi-chevron-double-right" viewBox="0 0 16 16">
            <path fill-rule="evenodd"
                d="M3.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L9.293 8 3.646 2.354a.5.5 0 0 1 0-.708z" />
            <path fill-rule="evenodd"
                d="M7.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L13.293 8 7.646 2.354a.5.5 0 0 1 0-.708z" />
        </svg>


        <!-- 녹음 버튼-->    
        <img class="recode" src="resources/assets/img/녹음.png">
        <button id="recordButton" type="button" type="button">녹음</button>
        
        <!-- 순서 화살표 -->            
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
            class="bi bi-chevron-double-right" viewBox="0 0 16 16">
            <path fill-rule="evenodd"
                d="M3.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L9.293 8 3.646 2.354a.5.5 0 0 1 0-.708z" />
            <path fill-rule="evenodd"
                d="M7.646 1.646a.5.5 0 0 1 .708 0l6 6a.5.5 0 0 1 0 .708l-6 6a.5.5 0 0 1-.708-.708L13.293 8 7.646 2.354a.5.5 0 0 1 0-.708z" />
        </svg>

        <!-- 녹음완료 버튼-->  
        <img class="stop" src="resources/assets/img/정지.png">
        <button id="stopButton" type="button">완료</button>
        <br>
        <div id="sound-clips"> 
           <ol id="recordingsList"></ol>
        </div> 
        <br>
        <br>
        
        <!--음성검사 녹음 방법 안내 -->
        <div class="container" style="box-shadow:2px 2px 2px 2px rgb(196, 195, 195); border-radius: 20px;width: 1050px;">
            <br>
            <content class="test_record_explain">
                <strong style="text-align: left; color: #228B22; font-family:'GangwonEdu_OTFBoldA';" > 음성 테스트 방법 안내 </strong>
                <br><br>
                <h5>1. [재생] 버튼을 누르시면 테스트 음성이 재생됩니다.</h5>
                <h5>2. [녹음] 버튼을 누른 후 아이의 음성을 녹음해주세요</h5>
                <h5>3. [완료] 버튼을 누르면 녹음이 완료됩니다. </h5>
                <h5>4. [다음] 버튼을 누르시면 다음 검사페이지로 이동합니다.</h5>
                <br>
            </content>
        </div>
        <br><br>


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
            <button id="lodingBtn" type="button"
               class="btn btn-primary btn-login text-uppercase fw-bold"
               >다음 →</button>
         </div>
      </div>
      <br>
      
    <!-- 로딩중일때 뜨는 가게 이미지 -->
    
    <div id="waiting">
    <div class="store-container">
        <div class="border-animation" style="margin-top:85px;">
          <svg role="img" xmlns="http://www.w3.org/2000/svg" id="store" viewBox="130 0 1230 930">
              <title xml:lang="en">Store animation loader</title>
            <defs>
                <filter id="f1">
                    <feGaussianBlur in="SourceGraphic" stdDeviation="0,4" />
                </filter>
              <circle id="sky-circle" fill="none" class="stroke" cx="198.7" cy="314" r="5.5"/>
              <path id="cloud" fill="#FFF" class="stroke" d="M503.6 39.1c-2.9 0.2-5.8 0.7-8.5 1.4 -14.7-24.5-42.3-40-72.8-37.8 -31.2 2.2-56.9 22.4-67.6 49.7 -2.5-0.4-5-0.5-7.6-0.3 -18.5 1.3-32.5 17.4-31.2 35.9s17.4 32.5 35.9 31.2c2.3-0.2 4.6-0.6 6.8-1.2 14.1 26.5 42.9 43.6 74.8 41.3 23.1-1.6 43.2-13.1 56.4-30.1 6.3 2.5 13.2 3.6 20.4 3.1 25.7-1.8 45.1-24.1 43.3-49.9C551.6 56.7 529.3 37.3 503.6 39.1z"/>
              <path id="cloud2" fill="#FFF" class="stroke" transform="scale(.8)" d="M503.6 39.1c-2.9 0.2-5.8 0.7-8.5 1.4 -14.7-24.5-42.3-40-72.8-37.8 -31.2 2.2-56.9 22.4-67.6 49.7 -2.5-0.4-5-0.5-7.6-0.3 -18.5 1.3-32.5 17.4-31.2 35.9s17.4 32.5 35.9 31.2c2.3-0.2 4.6-0.6 6.8-1.2 14.1 26.5 42.9 43.6 74.8 41.3 23.1-1.6 43.2-13.1 56.4-30.1 6.3 2.5 13.2 3.6 20.4 3.1 25.7-1.8 45.1-24.1 43.3-49.9C551.6 56.7 529.3 37.3 503.6 39.1z"/>
              <g id="tree">
                <rect x="1114.2" y="721.5" fill="#FFF" class="stroke" width="22" height="127"/>
                <g opacity="0.4">
                  <path fill="#9acd32" d="M1085.2 552.4c-29.4 14.7-49.5 45-49.5 80.1 0 49.4 40.1 89.5 89.5 89.5 49.4 0 89.5-40.1 89.5-89.5 0-35.2-20.3-65.6-49.8-80.2"/>
                  <path fill="#9acd32" d="M1164.9 552.3c10-10.1 16.1-24 16.1-39.3 0-30.9-25.1-56-56-56s-56 25.1-56 56c0 15.4 6.2 29.3 16.2 39.4"/>
                  <path fill="#9acd32" d="M1153.9 561c4-2.4 7.7-5.4 11-8.7"/>
                  <path fill="#9acd32" d="M1104.3 545.5c-6.7 1.6-13.1 3.9-19.1 7"/>
                </g>
                <path fill="none" class="stroke round-end" d="M1085.2 552.4c-29.4 14.7-49.5 45-49.5 80.1 0 49.4 40.1 89.5 89.5 89.5 49.4 0 89.5-40.1 89.5-89.5 0-35.2-20.3-65.6-49.8-80.2"/>
                <path fill="none" class="stroke round-end" d="M1164.9 552.3c10-10.1 16.1-24 16.1-39.3 0-30.9-25.1-56-56-56s-56 25.1-56 56c0 15.4 6.2 29.3 16.2 39.4"/>
                <path fill="none" class="stroke round-end" d="M1153.9 561c4-2.4 7.7-5.4 11-8.7"/>
                <path fill="none" class="stroke round-end" d="M1104.3 545.5c-6.7 1.6-13.1 3.9-19.1 7"/>
              </g>
              <g id="parachute">
                    <path fill="#9acd32" d="M429.4 2.5c-36.7 0-66.3 32.4-66.3 72.4 -9.3-6.7-19.4-5.9-30.1 0C333 74.9 355 2.5 429.4 2.5"/>
                    <path fill="#9acd32" d="M429.6 2.5c36.7 0 66.3 32.4 66.3 72.4 9.3-6.7 19.4-5.9 30.1 0C526 74.9 504 2.5 429.6 2.5"/>
                    <path fill="#9acd32" d="M429.6 2.5c15.3 0 27.6 36.5 27.7 76 -9.3-3.9-18.5-5.9-27.7-6h-0.2c-9.2 0-18.4 2.1-27.7 6 0.1-39.5 12.4-76 27.7-76"/>
                  <path fill="none" class="stroke" d="M401.8 78.5c0 0-13.4-14.6-38.9-3.6"/>
                  <path fill="none" class="stroke" d="M429.4 2.5c-36.7 0-66.3 32.4-66.3 72.4 -9.3-6.7-19.4-5.9-30.1 0C333 74.9 355 2.5 429.4 2.5"/>
                  <path fill="none" class="stroke" d="M429.6 2.5c36.7 0 66.3 32.4 66.3 72.4 9.3-6.7 19.4-5.9 30.1 0C526 74.9 504 2.5 429.6 2.5"/>
                  <path fill="none" class="stroke" d="M429.6 2.5c15.3 0 27.6 36.5 27.7 76 -9.3-3.9-18.5-5.9-27.7-6h-0.2c-9.2 0-18.4 2.1-27.7 6 0.1-39.5 12.4-76 27.7-76"/>
                  <path fill="none" class="stroke" d="M362.9 75l66.6 104 66-104.1c-25.5-10.9-38.9 3.6-38.9 3.6L429.5 179 401.3 78"/>
                  <polyline fill="none" class="stroke" points="333.3 75 429.5 179 526.3 75 "/>
              </g>
                <g id="box">
                <rect x="356" y="47" fill="#FFF" class="stroke" width="106.2" height="86"/>
                <polygon fill="#FFF" class="stroke" points=" 462.2 47 356 47 403.2 31 500.1 31 "/>
                <polygon fill="#FFF" class="stroke" points=" 500.1 117 462.2 133 462.2 47 500.1 31 "/>
                <polygon opacity="0.4" fill="#9acd32" points="394.1 47 394.5 81.5 408.5 70.5 422.5 81.5 422.5 47 463.3 31 431.7 31 "/>
                <polygon fill="none" class="stroke" points=" 394.1 47 394.5 81.5 408.5 70.5 422.5 81.5 422.5 47 463.3 31 431.7 31 "/>
              </g>
              <path id="tshirt" fill="#FFF" class="stroke" d="M442 717h35.7c1.7 0 3-1.5 3-3.4v-59.2c0-2.6 2.2-4.4 4.3-3.6l10.4 3.8c3.8 2.2 4.5 0.7 7.1-4.7l7.3-14.5c1.6-2.8 0.7-4.6-1.9-6.9C486 611.1 464.7 608 464.7 608c-1.5 0-2.7 1.2-3 2.9 -0.7 4.8-6.7 14.6-17.4 14.6s-16.7-9.8-17.4-14.6c-0.2-1.7-1.5-2.9-3-2.9 0 0-21.3 3-43.2 20.5 -2.6 2.4-3.5 4.1-1.9 6.9l7.3 14.5c2.7 5.4 3.3 6.8 7.1 4.7l10.4-3.8c2.1-0.8 4.3 1 4.3 3.6v59.2c0 1.9 1.3 3.4 3 3.4h35.7H442z"/>
              <g id="cap">
                <path fill="#FFF" class="stroke" d="M495.9 829.4c-0.4 33-19.4 8.5-50 8.5 -31.4 0-50.4 24.5-50-8.5 0.3-27.9 0.6-62.5 50-62.5C495.5 766.9 496.2 801.5 495.9 829.4z"/>
                <path fill="none" class="stroke" d="M396.4 824.4c0 0 18.9-8 49.5-8s49.5 8 49.5 8"/>
                <ellipse fill="#9acd32" cx="445.9" cy="763.4" rx="8.5" ry="3"/>
                <path fill="none" class="stroke" d="M406.4 819.4c0-20.7-4.8-52 39.5-52.5 44.7-0.5 39.5 31.8 39.5 52.5"/>
                <line fill="none" class="stroke" x1="445.9" y1="766.4" x2="445.9" y2="816.4"/>
                <circle fill="#9acd32" cx="429.4" cy="777.4" r="2"/>
                <circle fill="#9acd32" cx="462.4" cy="777.4" r="2"/>
              </g>
              <g id="ball">
                <circle fill="#FFF" class="stroke" cx="446" cy="803.8" r="47.3"/>
                <line fill="none" class="stroke" x1="446" y1="756.8" x2="446" y2="850.8"/>
                <line fill="none" class="stroke" x1="493" y1="804.3" x2="399" y2="804.3"/>
                <path fill="none" class="stroke" d="M484.2 834c-9.1-6.3-22.8-16.4-38.2-16.4s-29.1 10-38.2 16.4"/>
                <path fill="none" class="stroke" d="M407.8 774.6c9.1 6.3 22.8 16.4 38.2 16.4s29.1-10 38.2-16.4"/>
              </g>
                <g id="grass">
                  <path fill="#9acd32" d="M1226.5 857.5c4.7-20.9-7-33.3-20.4-41.3 -2-1.2-4-2.2-6.1-3.1 4.6 8.1 4.6 18.2-1 26.5 -1.3 1.9-2.7 3.5-4.4 5 -1.9-5.6-4.8-11.1-8.9-16 -5.7-6.9-12.9-12.1-20.9-15.4 6.6 10.9 4 24.9-6.5 33 -10.1-7.4-13.4-20.4-8.2-31.3 -7.6 4-14.3 9.8-19.3 17.2 -3.2 4.8-5.5 9.8-6.9 15 -2-1.4-3.8-3.1-5.4-5 -6.4-7.8-7.4-17.8-3.6-26.3 -2 1.1-3.6 2.8-5.7 3.6 -7.2 2.9-9.8 11.8-10.5 21 -3.7-12.9-11.1-24.1-11.1-24.1 -2-1.2-4-2.2-6.1-3.1 4.6 8.1 4.6 18.2-1 26.5 -1.3 1.9-2.7 3.5-4.4 5 -1.9-5.6-4.8-11.1-8.9-16 -5.7-6.9-12.9-12.1-20.9-15.4 6.6 10.9 4 24.9-6.5 33 -10.1-7.4-13.4-20.4-8.2-31.3 -7.6 4-14.3 9.8-19.3 17.2 -3.2 4.8-5.5 9.8-6.9 15 -2-1.4-3.8-3.1-5.4-5 -6.4-7.8-7.4-17.8-3.6-26.3 -2 1.1-3.9 2.3-5.7 3.6 -11 8-17.9 19.2-20.2 31.2 -2.6-13.7-11-26.3-24.4-34.3 -2-1.2-4-2.2-6.1-3.1 4.6 8.1 4.6 18.2-1 26.5 -1.3 1.9-2.7 3.5-4.4 5 -1.9-5.6-4.8-11.1-8.9-16 -5.7-6.9-12.9-12.1-20.9-15.4 6.6 10.9 4 24.9-6.5 33 -10.1-7.4-13.4-20.4-8.2-31.3 -7.6 4-14.3 9.8-19.3 17.2 -3.2 4.8-5.5 9.8-6.8 15 -2-1.4-3.8-3.1-5.4-5 -6.4-7.8-7.4-17.8-3.6-26.3 -2 1.1-3.9 2.3-5.7 3.6 -8.1 5.9-14 13.6-17.5 22 -4-10-11.4-19-21.7-25.2 -2-1.2-4-2.2-6.1-3.1 4.6 8.1 4.6 18.2-1 26.5 -1.3 1.9-2.7 3.5-4.4 5 -1.9-5.6-4.8-11.1-8.9-16 -5.7-6.9-12.9-12.1-20.9-15.4 6.6 10.9 4 24.9-6.5 33 -10.1-7.4-13.4-20.4-8.2-31.3 -7.6 4-14.3 9.8-19.3 17.2 -3.2 4.8-5.5 9.8-6.9 15 -2-1.4-3.8-3.1-5.4-5 -6.4-7.8-7.4-17.8-3.6-26.3 -2 1.1-3.9 2.3-5.7 3.6 -11 8-17.9 19.2-20.2 31.2 -2.6-13.7-11-26.3-24.4-34.3 -2-1.2-4-2.2-6.1-3.1 4.6 8.1 4.6 18.2-1 26.5 -1.3 1.9-2.7 3.5-4.4 5 -1.9-5.6-4.8-11.1-8.9-16 -5.7-6.9-12.9-12.1-20.9-15.4 6.6 10.9 4 24.9-6.5 33 -10.1-7.4-13.4-20.4-8.2-31.3 -7.6 4-14.3 9.8-19.3 17.2 -3.2 4.8-5.5 9.8-6.9 15 -2-1.4-3.8-3.1-5.4-5 -6.4-7.8-7.4-17.8-3.6-26.3 -2 1.1-3.9 2.3-5.7 3.6 -8.5 6.2-14.5 14.2-17.9 23 -3.9-10.4-11.4-19.8-22.1-26.2 -2-1.2-4-2.2-6.1-3.1 4.6 8.1 4.6 18.2-1 26.5 -1.3 1.9-2.7 3.5-4.4 5 -1.9-5.6-4.8-11.1-8.9-16 -5.7-6.9-12.9-12.1-20.9-15.4 6.6 10.9 4 24.9-6.5 33 -10.1-7.4-13.4-20.4-8.2-31.3 -7.6 4-14.3 9.8-19.3 17.2 -3.2 4.8-5.5 9.8-6.8 15 -2-1.4-3.8-3.1-5.4-5 -6.4-7.8-7.4-17.8-3.6-26.3 -2 1.1-3.9 2.3-5.7 3.6 -11 8-17.9 19.2-20.2 31.2 -2.6-13.7-11-26.3-24.4-34.3 -2-1.2-4-2.2-6.1-3.1 4.6 8.1 4.6 18.2-1 26.5 -1.3 1.9-2.7 3.5-4.4 5 -1.9-5.6-4.8-11.1-8.9-16 -5.7-6.9-12.9-12.1-20.9-15.4 6.6 10.9 4 24.9-6.5 33 -10.1-7.4-13.4-20.4-8.2-31.3 -7.6 4-14.3 9.8-19.3 17.2 -3.2 4.8-5.5 9.8-6.9 15 -2-1.4-3.8-3.1-5.4-5 -6.4-7.8-7.4-17.8-3.6-26.3 -2 1.1-3.9 2.3-5.7 3.6 -8.1 5.9-14 13.6-17.5 22 -4-10-11.4-19-21.7-25.2 -2-1.2-4-2.2-6.1-3.1 4.6 8.1 4.6 18.2-1 26.5 -1.3 1.9-2.7 3.5-4.4 5 -1.9-5.6-4.8-11.1-8.9-16 -5.7-6.9-12.9-12.1-20.9-15.4 6.6 10.9 4 24.9-6.5 33 -10.1-7.4-13.4-20.4-8.2-31.3 -7.6 4-14.3 9.8-19.3 17.2 -3.2 4.8-5.5 9.8-6.9 15 -2-1.4-3.8-3.1-5.4-5 -6.4-7.8-7.4-17.8-3.6-26.3 -2 1.1-3.9 2.3-5.7 3.6 -11 8-17.9 19.2-20.2 31.2 -2.6-13.7-11-26.3-24.4-34.3 -2-1.2-4-2.2-6.1-3.1 4.6 8.1 4.6 18.2-1 26.5 -1.3 1.9-2.7 3.5-4.4 5 -1.9-5.6-4.8-11.1-8.9-16 -5.7-6.9-12.9-12.1-20.9-15.4 6.6 10.9 4 24.9-6.5 33 -10.1-7.4-13.4-20.4-8.2-31.3 -7.6 4-14.3 9.8-19.3 17.2 -3.2 4.8-5.5 9.8-6.9 15 -2-1.4-3.8-3.1-5.4-5 -6.4-7.8-7.4-17.8-3.6-26.3 -2 1.1-3.9 2.3-5.7 3.6 -27.2 20.2-8.8 45.6-8.8 45.6"/>
                  <path fill="none" class="stroke round-end" d="M1226.5 857.5c4.7-20.9-7-33.3-20.4-41.3 -2-1.2-4-2.2-6.1-3.1 4.6 8.1 4.6 18.2-1 26.5 -1.3 1.9-2.7 3.5-4.4 5 -1.9-5.6-4.8-11.1-8.9-16 -5.7-6.9-12.9-12.1-20.9-15.4 6.6 10.9 4 24.9-6.5 33 -10.1-7.4-13.4-20.4-8.2-31.3 -7.6 4-14.3 9.8-19.3 17.2 -3.2 4.8-5.5 9.8-6.9 15 -2-1.4-3.8-3.1-5.4-5 -6.4-7.8-7.4-17.8-3.6-26.3 -2 1.1-3.6 2.8-5.7 3.6 -7.2 2.9-9.8 11.8-10.5 21 -3.7-12.9-11.1-24.1-11.1-24.1 -2-1.2-4-2.2-6.1-3.1 4.6 8.1 4.6 18.2-1 26.5 -1.3 1.9-2.7 3.5-4.4 5 -1.9-5.6-4.8-11.1-8.9-16 -5.7-6.9-12.9-12.1-20.9-15.4 6.6 10.9 4 24.9-6.5 33 -10.1-7.4-13.4-20.4-8.2-31.3 -7.6 4-14.3 9.8-19.3 17.2 -3.2 4.8-5.5 9.8-6.9 15 -2-1.4-3.8-3.1-5.4-5 -6.4-7.8-7.4-17.8-3.6-26.3 -2 1.1-3.9 2.3-5.7 3.6 -11 8-17.9 19.2-20.2 31.2 -2.6-13.7-11-26.3-24.4-34.3 -2-1.2-4-2.2-6.1-3.1 4.6 8.1 4.6 18.2-1 26.5 -1.3 1.9-2.7 3.5-4.4 5 -1.9-5.6-4.8-11.1-8.9-16 -5.7-6.9-12.9-12.1-20.9-15.4 6.6 10.9 4 24.9-6.5 33 -10.1-7.4-13.4-20.4-8.2-31.3 -7.6 4-14.3 9.8-19.3 17.2 -3.2 4.8-5.5 9.8-6.8 15 -2-1.4-3.8-3.1-5.4-5 -6.4-7.8-7.4-17.8-3.6-26.3 -2 1.1-3.9 2.3-5.7 3.6 -8.1 5.9-14 13.6-17.5 22 -4-10-11.4-19-21.7-25.2 -2-1.2-4-2.2-6.1-3.1 4.6 8.1 4.6 18.2-1 26.5 -1.3 1.9-2.7 3.5-4.4 5 -1.9-5.6-4.8-11.1-8.9-16 -5.7-6.9-12.9-12.1-20.9-15.4 6.6 10.9 4 24.9-6.5 33 -10.1-7.4-13.4-20.4-8.2-31.3 -7.6 4-14.3 9.8-19.3 17.2 -3.2 4.8-5.5 9.8-6.9 15 -2-1.4-3.8-3.1-5.4-5 -6.4-7.8-7.4-17.8-3.6-26.3 -2 1.1-3.9 2.3-5.7 3.6 -11 8-17.9 19.2-20.2 31.2 -2.6-13.7-11-26.3-24.4-34.3 -2-1.2-4-2.2-6.1-3.1 4.6 8.1 4.6 18.2-1 26.5 -1.3 1.9-2.7 3.5-4.4 5 -1.9-5.6-4.8-11.1-8.9-16 -5.7-6.9-12.9-12.1-20.9-15.4 6.6 10.9 4 24.9-6.5 33 -10.1-7.4-13.4-20.4-8.2-31.3 -7.6 4-14.3 9.8-19.3 17.2 -3.2 4.8-5.5 9.8-6.9 15 -2-1.4-3.8-3.1-5.4-5 -6.4-7.8-7.4-17.8-3.6-26.3 -2 1.1-3.9 2.3-5.7 3.6 -8.5 6.2-14.5 14.2-17.9 23 -3.9-10.4-11.4-19.8-22.1-26.2 -2-1.2-4-2.2-6.1-3.1 4.6 8.1 4.6 18.2-1 26.5 -1.3 1.9-2.7 3.5-4.4 5 -1.9-5.6-4.8-11.1-8.9-16 -5.7-6.9-12.9-12.1-20.9-15.4 6.6 10.9 4 24.9-6.5 33 -10.1-7.4-13.4-20.4-8.2-31.3 -7.6 4-14.3 9.8-19.3 17.2 -3.2 4.8-5.5 9.8-6.8 15 -2-1.4-3.8-3.1-5.4-5 -6.4-7.8-7.4-17.8-3.6-26.3 -2 1.1-3.9 2.3-5.7 3.6 -11 8-17.9 19.2-20.2 31.2 -2.6-13.7-11-26.3-24.4-34.3 -2-1.2-4-2.2-6.1-3.1 4.6 8.1 4.6 18.2-1 26.5 -1.3 1.9-2.7 3.5-4.4 5 -1.9-5.6-4.8-11.1-8.9-16 -5.7-6.9-12.9-12.1-20.9-15.4 6.6 10.9 4 24.9-6.5 33 -10.1-7.4-13.4-20.4-8.2-31.3 -7.6 4-14.3 9.8-19.3 17.2 -3.2 4.8-5.5 9.8-6.9 15 -2-1.4-3.8-3.1-5.4-5 -6.4-7.8-7.4-17.8-3.6-26.3 -2 1.1-3.9 2.3-5.7 3.6 -8.1 5.9-14 13.6-17.5 22 -4-10-11.4-19-21.7-25.2 -2-1.2-4-2.2-6.1-3.1 4.6 8.1 4.6 18.2-1 26.5 -1.3 1.9-2.7 3.5-4.4 5 -1.9-5.6-4.8-11.1-8.9-16 -5.7-6.9-12.9-12.1-20.9-15.4 6.6 10.9 4 24.9-6.5 33 -10.1-7.4-13.4-20.4-8.2-31.3 -7.6 4-14.3 9.8-19.3 17.2 -3.2 4.8-5.5 9.8-6.9 15 -2-1.4-3.8-3.1-5.4-5 -6.4-7.8-7.4-17.8-3.6-26.3 -2 1.1-3.9 2.3-5.7 3.6 -11 8-17.9 19.2-20.2 31.2 -2.6-13.7-11-26.3-24.4-34.3 -2-1.2-4-2.2-6.1-3.1 4.6 8.1 4.6 18.2-1 26.5 -1.3 1.9-2.7 3.5-4.4 5 -1.9-5.6-4.8-11.1-8.9-16 -5.7-6.9-12.9-12.1-20.9-15.4 6.6 10.9 4 24.9-6.5 33 -10.1-7.4-13.4-20.4-8.2-31.3 -7.6 4-14.3 9.8-19.3 17.2 -3.2 4.8-5.5 9.8-6.9 15 -2-1.4-3.8-3.1-5.4-5 -6.4-7.8-7.4-17.8-3.6-26.3 -2 1.1-3.9 2.3-5.7 3.6 -27.2 20.2-8.8 45.6-8.8 45.6"/>
                </g>
                <g id="plane">
                  <path fill="#FFF" class="stroke" d="M966.1 203.5c0 0 70.8 0.9 70.8 10.7 0 20.6-23.3 41.3-88.7 43 -34 0.9-98.5 3.6-120-1.8 -30.5-7.6-109.1-44-112-52.8 -13.4-41.2-18.8-49.3 2.7-49.3 12 0 18.6 0 26 0 14.3 0 12.5 2.7 27.8 42.1 0 0 50.2 8.1 66.3-1.8s24.6-23.3 57.6-23.4l21 0.1C938.5 171.3 949.5 176.3 966.1 203.5z"/>
                  <path fill="#9acd32" d="M896.5 182.4v18c0 1.1-0.9 2-2 2h-39.6c-1.8 0-2.7-2.1-1.5-3.4 5.7-6 19.6-17.9 41-18.6C895.5 180.3 896.5 181.2 896.5 182.4z"/>
                  <path fill="#9acd32" d="M906.5 182.4v18c0 1.1 0.9 2 2 2h39.6c1.8 0 2.4-1.9 1.5-3.4 -6.1-9.6-12.1-18.6-41-18.6C907.4 180.4 906.5 181.2 906.5 182.4z"/>
                  <path fill="none" class="stroke" d="M896.5 182.4v18c0 1.1-0.9 2-2 2h-39.6c-1.8 0-2.7-2.1-1.5-3.4 5.7-6 19.6-17.9 41-18.6C895.5 180.3 896.5 181.2 896.5 182.4z"/>
                  <path fill="none" class="stroke" d="M906.5 182.4v18c0 1.1 0.9 2 2 2h39.6c1.8 0 2.4-1.9 1.5-3.4 -6.1-9.6-12.1-18.6-41-18.6C907.4 180.4 906.5 181.2 906.5 182.4z"/>
                  <path fill="#9acd32" d="M745.3 193.7h-58.2c-3.7 0-6.7-3-6.7-6.7v0c0-3.7 3-6.7 6.7-6.7h58.2c3.7 0 6.7 3 6.7 6.7v0C752 190.6 749 193.7 745.3 193.7z"/>
                  <g id="helix">
                    <path fill="#9acd32" d="M1037.8 233.5h-1.8c-4.2 0-3.1-12.1-3.1-12.1s-1.1-12.1 3.1-12.1l0 0c5.2 0 9.4 4.2 9.4 9.4v7.2C1045.4 230.1 1041.9 233.5 1037.8 233.5z"/>
                    <path fill="#9acd32" d="M1037.2 214.4L1037.2 214.4c-4.6 0-8.3-34-8.3-34 0-4.6 3.8-8.3 8.3-8.3h0c4.6 0 8.3 3.8 8.3 8.3C1045.6 180.3 1041.8 214.4 1037.2 214.4z"/>
                    <path fill="#9acd32" d="M1037.2 228.5L1037.2 228.5c4.6 0 8.3 34 8.3 34 0 4.6-3.8 8.3-8.3 8.3h0c-4.6 0-8.3-3.8-8.3-8.3C1028.9 262.5 1032.7 228.5 1037.2 228.5z"/>
                    <path fill="none" class="stroke" d="M1037.2 214.4L1037.2 214.4c-4.6 0-8.3-34-8.3-34 0-4.6 3.8-8.3 8.3-8.3h0c4.6 0 8.3 3.8 8.3 8.3C1045.6 180.3 1041.8 214.4 1037.2 214.4z"/>
                    <path fill="none" class="stroke" d="M1037.2 228.5L1037.2 228.5c4.6 0 8.3 34 8.3 34 0 4.6-3.8 8.3-8.3 8.3h0c-4.6 0-8.3-3.8-8.3-8.3C1028.9 262.5 1032.7 228.5 1037.2 228.5z"/>
                </g>
                    <use class="helix" xlink:href="#helix" filter="url(#f1)"></use>
                  <line fill="none" class="stroke" x1="728" y1="213.3" x2="520" y2="213.2"/>
                  <polyline fill="none" class="stroke" points="520 182.8 558.5 214.2 520 243.7 "/>
                  <path fill="#FFF" class="stroke" d="M506.9 253.6H21.2c-6.6 0-12-5.4-12-12v-56.7c0-6.6 5.4-12 12-12h485.8c6.6 0 12 5.4 12 12v56.7C518.9 248.2 513.5 253.6 506.9 253.6z"/>
                  <text transform="matrix(1.0027 0 0 1 44.8218 224.8768)" font-family='GangwonEdu_OTFBoldA' font-size="34" fill="#03612f"> 문항 체크 테스트로 이동중입니다-💚</text>
                  <path fill="#9acd32" d="M850.5 216.5h79.7l-4.5 10.7c0 0-2.7 7.2-9.9 7.2h-72.6c0 0-6.3-0.9-1.8-7.2L850.5 216.5z"/>
                  <path fill="none" class="stroke" d="M745.3 193.7h-58.2c-3.7 0-6.7-3-6.7-6.7v0c0-3.7 3-6.7 6.7-6.7h58.2c3.7 0 6.7 3 6.7 6.7v0C752 190.6 749 193.7 745.3 193.7z"/>
                  <path fill="none" class="stroke" d="M850.5 216.5h79.7l-4.5 10.7c0 0-2.7 7.2-9.9 7.2h-72.6c0 0-6.3-0.9-1.8-7.2L850.5 216.5z"/>
                </g>
            </defs>
        
              <g id="window">
                <path opacity="0.4" fill="#9acd32" d="M683.6 773H368c-8.1 0-14.7-6.6-14.7-14.7V565.2c0-8.1 6.6-14.7 14.7-14.7h315.6c8.1 0 14.7 6.6 14.7 14.7v193.1C698.3 766.4 691.7 773 683.6 773z"/>
                <path fill="none" class="stroke" d="M683.6 773H368c-8.1 0-14.7-6.6-14.7-14.7V565.2c0-8.1 6.6-14.7 14.7-14.7h315.6c8.1 0 14.7 6.6 14.7 14.7v193.1C698.3 766.4 691.7 773 683.6 773z"/>
              </g>
                  <use class="box" xlink:href="#box" x="20" y="30"></use>
                  <use class="parachute" xlink:href="#parachute" x="20" y="-112"></use>
                  <rect fill="white" x="320" y="310" width="665" height="238"></rect>
                  <use class="tshirt" xlink:href="#tshirt"></use>
                  <use class="cap" xlink:href="#cap" y="-150"></use>
                  <use class="ball" xlink:href="#ball" y="-140"></use>
              <use class="sky-circle" xlink:href="#sky-circle" x="-10px" y="5"></use>
                  <use class="sky-circle2" xlink:href="#sky-circle" x="500px" y="-125"></use>
                  <use class="sky-circle3" xlink:href="#sky-circle" x="1000px" y="50"></use>
                  <use class="cloud" xlink:href="#cloud2" x="0" y="10"></use>
                  <use class="plane" xlink:href="#plane" y="-80"></use>
                        
                  <use class="cloud2" xlink:href="#cloud" x="0" y="130"></use>
                  <use class="trees" xlink:href="#tree" x="40" y="0"></use>
              <circle class="cat-shadow" fill="#9acd32" cx="1160" cy="620" r="23"></circle>
                  <use class="cat" xlink:href="#cat" x="15" y="5"></use>
              <g id="browser">
                <path fill="none" class="stroke" d="M972.4 847h-640c-8.2 0-15-6.8-15-15V322.5c0-8.2 6.8-15 15-15h640c8.2 0 15 6.8 15 15V832C987.4 840.3 980.7 847 972.4 847z"/>
                <circle opacity="0.4" fill="#9acd32" cx="363.7" cy="349.3" r="12.3"/>
                <circle fill="none" class="stroke" cx="402.2" cy="349.3" r="12.3"/>
                <path fill="none" stroke="#9acd32" class="stroke" d="M943.5 361.5H454.1c-5.5 0-9.9-4.5-9.9-9.9V344c0-5.5 4.5-9.9 9.9-9.9h489.4c5.5 0 9.9 4.5 9.9 9.9v7.6C953.4 357.1 949 361.5 943.5 361.5z"/>
                <circle fill="none" class="stroke" cx="363.7" cy="349.3" r="12.3"/>
              </g>
              <g id="toldo">
                  <polyline fill="#FFF" class="stroke round-end" points=" 277.6 468.6 317.7 391.8 987.6 391.8 1026.9 468.6 "/>
                  <path fill="#FFF" class="stroke" d="M392.2 391.8l-31.3 79.5c0 22.7 18.4 41 41 41 22.7 0 41-18.4 41-41"/>
                  <path fill="#FFF" class="stroke" d="M466.6 391.8l-22.3 79.5c0 22.7 18.4 41 41 41s41-18.4 41-41"/>
                  <path id="tol" fill="#FFF" class="stroke" d="M527.6 471.2c0 22.7 18.4 41 41 41 22.7 0 41-18.4 41-41"/>
                  <path fill="#FFF" class="stroke" d="M615.5 391.8l-4.5 79.5c0 22.7 18.4 41 41 41 22.7 0 41-18.4 41-41"/>
                  <path fill="#FFF" class="stroke" d="M689.9 391.8l4.4 79.5c0 22.7 18.4 41 41 41s41-18.4 41-41"/>
                  <path fill="#FFF" class="stroke" d="M859.7 471.2c0 22.7-18.4 41-41 41 -22.7 0-41-18.4-41-41l-13.3-79.5"/>
                  <use class="tol" xlink:href="#tol" x="-250"></use>
                  <use class="tol" xlink:href="#tol" x="334"></use>
                  <use class="tol" xlink:href="#tol" x="417"></use>
                  <line class="stroke round-end" x1="277" y1="470.5" x2="1027" y2="470.5"/>
                  <line class="stroke" x1="541" y1="391.8" x2="526.5" y2="471.2"/>
                  <line class="stroke" x1="838.8" y1="391.8" x2="860.1" y2="471.2"/>
                  <path opacity="0.4" fill="#9acd32" d="M467.3 392.1h73.4l-14 79.5c0 22.7-18.4 41-41 41 -22.7 0-41-18.4-41-41L467.3 392.1z"/>
                  <path opacity="0.4" fill="#9acd32" d="M615.7 392.1H690l3.5 79.5c0 22.7-18.4 41-41 41 -22.7 0-41-18.4-41-41L615.7 392.1z"/>
                  <path opacity="0.4" fill="#9acd32" d="M765.1 392.1h73.4l21.8 79.5c0 22.7-18.4 41-41 41s-41-18.4-41-41L765.1 392.1z"/>
                  <path opacity="0.4" fill="#9acd32" d="M913.6 392.1h73.4l40.2 79.5c0 22.7-18.4 41-41 41 -22.7 0-41-18.4-41-41L913.6 392.1z"/>
                  <path opacity="0.4" fill="#9acd32" d="M317.9 392.1h73.4l-31.4 79.5c0 22.7-18.4 41-41 41 -22.7 0-41-18.4-41-41L317.9 392.1z"/>
                <line fill="none" class="stroke" x1="944.4" y1="471.6" x2="913.2" y2="392.2"/>
              </g>
              <g id="door">
                <path fill="none" class="stroke" d="M955.8 846V560.5c0-5.5-4.5-10-10-10H738.6c-5.5 0-10 4.5-10 10V846"/>
                <rect fill="#9acd32" x="730" y="700" width="225" height="15"></rect>
                <g id="sign">
                  <polyline fill="none" class="stroke" points=" 800.8 672.8 842.5 601 883.6 672.8 "/>
                  <ellipse fill="#FFF" class="stroke" cx="842.2" cy="601" rx="10" ry="10"/>
                  <path fill="#03612f" d="M909.3 740.7H775.1c-5.5 0-10-4.5-10-10v-47.9c0-5.5 4.5-10 10-10h134.2c5.5 0 10 4.5 10 10v47.9C919.3 736.2 914.8 740.7 909.3 740.7z"/>
                  <text transform="matrix(1.0027 0 0 1 789.6294 721.7501)" fill="#FFF" font-family='Fredoka One' font-size="22"> BEBETALK </text>
                  <path fill="none" class="stroke" d="M909.3 740.7H775.1c-5.5 0-10-4.5-10-10v-47.9c0-5.5 4.5-10 10-10h134.2c5.5 0 10 4.5 10 10v47.9C919.3 736.2 914.8 740.7 909.3 740.7z"/>
              </g>
              </g>
                <g id="button">
                  <path opacity="0.4" fill="#9acd32"d="M650.5 725.5H547.8c-4.7 0-8.6-3.9-8.6-8.6v-18.1c0-4.7 3.9-8.6 8.6-8.6h102.7c4.7 0 8.6 3.9 8.6 8.6v18.1C659.2 721.7 655.3 725.5 650.5 725.5z"/>
                  <path fill="none" class="stroke" d="M650.5 725.5H547.8c-4.7 0-8.6-3.9-8.6-8.6v-18.1c0-4.7 3.9-8.6 8.6-8.6h102.7c4.7 0 8.6 3.9 8.6 8.6v18.1C659.2 721.7 655.3 725.5 650.5 725.5z"/>
              </g>
                <g id="text">
                  <line fill="none" class="stroke round-end" x1="539.2" y1="605.5" x2="652.2" y2="605.5"/>
                  <line fill="none" class="stroke round-end" x1="539.2" y1="630.5" x2="669.2" y2="630.5"/>
                  <line fill="none" class="stroke round-end" x1="539.2" y1="655.5" x2="619.2" y2="655.5"/>
               </g>
                  <use class="grass" xlink:href="#grass" x="130" y="0"></use>
              <rect class="grass" x="130" y="850" fill="#9acd32" width="100%" height="80"></rect>
            </svg>
          </div>
                 
        <!--가게 밑 로딩중 안내멘트-->
        <article class="mb-4">
            <div class="container px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                    	<div class="infotext"></div style="padding-top:20px;"><h4 style="text-align: center; color: #2e3228">음성결과를 분석중입니다.<br>조금만 기다려주세요</h4></div>
                    <div>
                <div>
            </div>
        </article>
        <br><br> 
        </div>       
   </div>

      
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
        <script src="${cpath}/resources/js/scripts.js"></script>
        <script src="https://cdn.rawgit.com/mattdiamond/Recorderjs/08e7abd9/dist/recorder.js"></script>
        <script src="${cpath}/resources/js/app.js"></script>
              
   </body>
</html>