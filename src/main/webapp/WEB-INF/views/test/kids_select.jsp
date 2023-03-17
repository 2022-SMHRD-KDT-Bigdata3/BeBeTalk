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
      <!-- <link href="${cpath}/resources/css/styles2.css" rel="stylesheet" />--> 
       <!--  <link href="${cpath}/resources/css/styles2.css" rel="stylesheet"/>--> 
        <link href="${cpath}/resources/css/result.css" rel="stylesheet"/>


        <!--모달창 스타일-->
        <style>
            #modal.modal-overlay {
                width: 100%;
                height: 100%;
                position: absolute;
                left: 0;
                top: 0;
                display: none; /* 모달의 초기 상태를 display: none;으로 했다가 특정 버튼을 클릭하면 display: flex; 으로 변하게 하면 됩니다. */
                align-items: center;
                justify-content: center;
                background: rgba(255, 255, 255, 0.25);
                box-shadow: 0 8px 32px 0 rgba(2, 94, 34, 0.37);
                backdrop-filter: blur(1.5px);
                -webkit-backdrop-filter: blur(2.5px);
                border-radius: 10px;
                border: 1px solid rgba(255, 255, 255, 0.18);
            }

            #modal .modal-window {
                background: rgba(46, 138, 4, 0.76);
                box-shadow: 0 8px 32px 0 rgba(2, 94, 34, 0.37);
                /* backdrop-filter: blur( .5px );
                -webkit-backdrop-filter: blur( .5px ); */
                border-radius: 10px;
                border: 1px solid rgba( 255, 255, 255, 0.18 );
                width: 450px;
                height: 450px;
                position: relative;
                top: -100px;
                padding: 50px;
            }

            #modal .title {
                padding-left: 1px;
                display: inline;
                text-shadow: 1px 1px 2px rgb(55, 54, 54);
                color: white;
                
            }
            #modal .title h2 {
                display: inline;
                text-shadow: 1px 1px 2px rgb(55, 54, 54);
            }

            #modal .close-area {
                display: inline;
                float: right;
                padding-right: 10px;
                cursor: pointer;
                text-shadow: 1px 1px 2pxrgb(55, 54, 54);
                color: white;
            }
            
            #modal .content {
                margin-top: 10px;
                padding: 0px 10px;
                text-shadow: 1px 1px 2px rgb(55, 54, 54);
                color: white;
            }


            /* 검사 순서안내 원모양 4단계 CSS */
            
            /* 검사 순서안내  반응형 센터정렬 */
           .wrapper{
                display: flex;
                justify-content: center;
            }
                
            .step-box1 {
                height: 100px;
                width: 100px;
                border-radius: 50%;
                background-color:#228B22;
                text-align: center;
                line-height: 100px;
                font-size: 15px;
                font-weight: bolder;
                box-shadow: 2px 2px 2px 2px gray;
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
                background-color: rgb(210, 223, 218);
                text-align: center;
                line-height: 100px;
                font-size: 15px;
                font-weight: bolder;
                /* box-shadow: 2px 2px 2px 2px gray; */
            }
              #sform {
                 display: inline-block;
                 text-align: center;
            }

             .space {
                 width: 10px;
                 height: auto;
                 display: inline-block;
            }
            
            <!--프로필 이미지 크기조절-->
           /* .img-fluid {
 				 max-width: 50%;
 				 height: auto;
				} */
        </style>
    </head>

    
    <body >
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
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="${cpath}/result.do" style="font-size: 1em; color: rgb(2, 50, 4);"> RESULT </a></li>
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="${cpath}/myPage.do?testeeID=${uvo.userID}" style="font-size: 1em; color: rgb(2, 50, 4);"> MY PAGE</a></li>
                    </ul>
                </div>
            </div>
        </nav>

         <!-- 헤더이미지+ 페이지 이름-->
             <header class="masthead" style="background-image: url('resources/assets/img/아이선택페이지_헤더.jpg')">
                <div class="container position-relative px-4 px-lg-5">
                    <div class="row justify-content-center">
                        <div class="col-md-10 col-lg-8 col-xl-7">
                            <div style="font-size:small" class="page-heading">
                                <h2 style="color:rgb(255, 255, 255);font-family:'GangwonEdu_OTFBoldA'; font-weight: bold; text-shadow: 2px 2px 2px rgb(40, 39, 39);">
                            아이선택</h2>
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
                            <div class="step-box1" style="color: white;">
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
                            <div class="step-box4">
                                4. 결과보기
                            </div>
                        </div>
                    </div>
                </div>
            </div>
           </div>

        <!-- 아이선택 부분-->
        <section class="page-section portfolio" id="portfolio">
            <div class="container">
                <!-- 아이선택 안내멘트-->
                <span><h2 style="font-family:'GangwonEdu_OTFBoldA'; text-align: center; color: rgb(33, 42, 33);">아이의 네임 카드를 선택해주세요✔</h2></span>
                <br>
                <!-- 아이추가버튼: 클릭시 모달창 생성 -->
                <div class="d-block text-center mt-2 small">
                    <button type="button" class="btn btn-outline-success" id="btn-modal" style="font-family:'GangwonEdu_OTFBoldA';">아이 추가등록
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-circle-fill" viewBox="0 0 16 16"   preserveAspectRatio="xMinYMin meet">
                            <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.5 4.5a.5.5 0 0 0-1 0v3h-3a.5.5 0 0 0 0 1h3v3a.5.5 0 0 0 1 0v-3h3a.5.5 0 0 0 0-1h-3v-3z"/>
                          </svg>
                    </button>
                  </div>
                <br>
                <hr class='hr-solid'/>

            
                <!-- 기능: 아이 카드 클릭시 아이정보를 가지고 검사하러 가기 -->
                <!-- 아이선택카드 -->
            <div class="row justify-content-center" style="text-align: center; border-radius: 20px;padding-top:;">
            
            <!-- DB에 저장된 만큼 for문 -->
            <c:if test="${!empty list}">
                <!-- 프로필1-->
                <div style="text-align: center; margin-top: 10px;">
                    <form action="" method="post">
                      <div class="portfolio-item mx-auto" data-bs-toggle="modal" data-bs-target="#portfolioModal1">
                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                                <div class="portfolio-item-caption-content text-center text-white"><i
                                        class="fas fa-plus fa-3x"></i></div>
                            </div>
                            <a href=""><img class="img-fluid" src="resources/assets/img/아이선택페이지_프로필1.jpg"/></a>
                        </div>

                        <!--등록된 아이 출력-->
                        <p style="text-align: center; font-family: 'GangwonEdu_OTFBoldA';">${list.get(0).testKidsNick} 
                            <input type="radio" name=check value="현아" style="margin-top: 10px; margin-left: 15px;"></p>
			</c:if>

<!--                         프로필2 -->
<!--                         <div class="portfolio-item mx-auto" data-bs-toggle="modal" data-bs-target="#portfolioModal2"> -->
<!--                             <div -->
<!--                                 class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100"> -->
<!--                                 <div class="portfolio-item-caption-content text-center text-white"> -->
<!--                                 <i class="fas fa-plus fa-3x"></i></div> -->
<!--                             </div> -->
<!--                             <img class="img-fluid" src="resources/assets/img/아이선택페이지_프로필3.jpg" alt="..." /> -->
<!--                         </div> -->
<!--                         등록된 아이 출력 -->
<!--                         <p style="text-align: center; font-family: 'GangwonEdu_OTFBoldA';">유나니 -->
<!--                             <input type="radio" name=check value="유나니" style="margin-top: 10px; margin-left: 15px;"> -->
<!--                         </p> <br> -->
<!--                         <div class="post-preview"> -->



                        <h4 class="post-meta">
                           🎤조용한 환경에서 음성테스트를 진행해주세요
                        </h4>
                        <br><br>
                    </div>
                            <button type="submit" class="btn btn-outline-success" name="button1" style="font-family:'GangwonEdu_OTFBoldA';">바다테마<br>음성검사하기
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                    class="bi bi-arrow-right" viewBox="0 0 16 16">
                                    <path fill-rule="evenodd"
                                        d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z" />
                                </svg>
                                
                            </button>
                            <div class="space"></div>
                            <button type="submit" class="btn btn-outline-success" name="button2" style="font-family:'GangwonEdu_OTFBoldA';">꽃밭테마<Br>음성검사하기
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                    class="bi bi-arrow-right" viewBox="0 0 16 16">
                                    <path fill-rule="evenodd"
                                        d="M1 8a.5.5 0 0 1 .5-.5h11.793l-3.147-3.146a.5.5 0 0 1 .708-.708l4 4a.5.5 0 0 1 0 .708l-4 4a.5.5 0 0 1-.708-.708L13.293 8.5H1.5A.5.5 0 0 1 1 8z" />
                                </svg>
                            </button>
                        <!-- </div><br> -->
                    </form>
                    <script>
                        document.querySelector('form').addEventListener('submit', function(e) {
                          e.preventDefault(); // 기본 submit 이벤트 중지
                          
                          // 버튼 구분
                          var buttonName = e.submitter.name;
                          if (buttonName === 'button1') {
                            window.location.href = '${cpath}/testVoice1-1.do'; // 버튼1을 클릭한 경우 페이지1로 이동
                          } else if (buttonName === 'button2') {
                            window.location.href = '${cpath}/testVoice2-1.do'; // 버튼2를 클릭한 경우 페이지2로 이동
                          }
                        });
                      </script>
                </div>
            </div>
        </section>
              

        <!-- 모달창 디자인 -->
        <div>                              
            <div id="modal" class="modal-overlay">
                <div class="modal-window">
                    <div class="close-area">X</div><br>
                        <div class="content">
                        
                        <!-- 아이 등록 시작 -->
                            <form method="post" action="${cpath}/childInsert.do" style="text-align: center; font-family: 'GangwonEdu_OTFBoldA;'">
                            	<!-- 로그인 한 보호자의 ID 가져오기 -->
                            	<input type="hidden" name="testeeID" value="${uvo.userID}"/>
                            	<!-- 아이 애칭 입력 -->
                                <label for="childrenNickname" style="font-family: 'GangwonEdu_OTFBoldA;'">아이의 애칭을 입력해주세요</label>
                                <input type="text" name="testKidsNick" maxlength="5"><br><br>
                                                                
                            	<!-- 아이 생년 입력 -->
                                <label for="childrenbirth" style="font-family: 'GangwonEdu_OTFBoldA;'">아이의 출생년도를 선택해주세요</label>
                                <select name="testeeBirth">
                                    <option value="2023년생" selected="selected">&nbsp;2023년</option>
                                    <option value="2022년생">&nbsp;2022년</option>
                                    <option value="2021년생">&nbsp;2021년</option>
                                    <option value="2020년생">&nbsp;2020년</option>
                                    <option value="2019년생">&nbsp;2019년</option>
                                    <option value="2018년생">&nbsp;2018년</option>
                                </select>
                                <br><br>
                                <label for="childrenSex" style="font-family:'GangwonEdu_OTFBoldA;'"> 아이의 성별을 선택해주세요 </label>
								<br>
                                남<input type="radio" name="testeeSex" value="남">&nbsp;&nbsp;&nbsp;  
                                여<input type="radio" name="testeeSex" value="여"><br><br>  
                                <input class="child_summit" type="submit" value="전송">
                            </form>
                         
                            <!--모달창 작동-->
                            <script>
                                // 특정 버튼을 누르면 모달창이 켜지게 하기
                                const modal = document.getElementById("modal")
                                const btnModal = document.getElementById("btn-modal")
                                btnModal.addEventListener("click", e => {
                                modal.style.display = "flex"
                                })

                                // 모달창의 클로즈(x) 버튼을 누르면 모달창이 꺼지게 하기
                                const closeBtn = modal.querySelector(".close-area")
                                closeBtn.addEventListener("click", e => {
                                modal.style.display = "none"
                                })

                                // 모달창 바깥 영역을 클릭하면 모달창이 꺼지게 하기
                                modal.addEventListener("click", e => {
                                const evTarget = e.target
                                if(evTarget.classList.contains("modal-overlay")) {
                                modal.style.display = "none"
                                }
                                })
                            </script>
                        </div>
                    </div>
              </div>
            </div>        
        </div>            
                    
                    <!-- 음성테스트 진행 여부 묻기& 주의사항 안내--> 
                    
                    <br>
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Core theme JS-->
    <script src="js/scripts1.js"></script>
</body>

</html>
