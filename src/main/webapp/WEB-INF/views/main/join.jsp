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
        <title> BeBeTalk </title>
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
            <a class="navbar-brand" href="${cpath}/main.do" style="font-size: 2.5em; color: rgb(10, 75, 18); font-family: 'Gaegu'; font-weight: 700;" >베베톡</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                Menu
                <i class="fas fa-bars"></i>
            </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto py-4 py-lg-0">
                      <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="${cpath}/login.do"  style="font-size: 1em;color: rgb(2, 50, 4);"> LOGIN </a></li>
                    </ul>
                </div>
            </div>
        </nav>


         <!-- 헤더이미지+ 페이지 이름-->
        <header class="masthead" style=" background-image: url('${cpath}/resources/assets/img/회원가입_로그인_헤더.jpg')">
            <div class="container position-relative px-4 px-lg-5">
                <div class="row justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <div style="font-size:small" class="page-heading">
                            <h2 style="color:rgb(255, 255, 255);  font-weight: bold; text-shadow: 2px 2px 2px rgb(40, 39, 39);">회원가입</h2>
                        </div>
                    </div>
                </div>
            </div>
        </header>
       
       
<!--회원가입 입력창 -->
  <div class="container" font>
    <div class="row">
      <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="card flex-row my-5 border-0 shadow rounded-3 overflow-hidden">
          <div class="card-img-left d-none d-md-flex">
          </div>
          <hr class='hr-solid'/>
          <div class="card-body p-4 p-sm-5">
            <h3 class="card-title text-center">회원가입</h3>
            <hr class='hr-solid'/>
            
           <!-- 회원가입 form태그 시작 -->
            <form action="" method="post" id="_frmForm" name="frmForm" >
              <div class="form-floating mb-3">
                    <input type="text" class="form-control" id="floatingInputUsername" name="UserID" placeholder="ID를 입력해주세요" required autofocus>
                    <label for="floatingInputUserid">아이디</label>
              </div>


              <div class="form-floating mb-3">
                    <input type="password" class="form-control" id="floatingPassword" name="UserPassword" placeholder="비밀번호를 입력해주세요">
                    <label for="floatingPassword">Password</label>
                    <label for="floatingInput">Password를 입력해주세요</label>
              </div>  
              
          
              <div class="form-floating mb-3">
                <input type="password" class="form-control" id="floatingPasswordConfirm" placeholder="비밀번호를 확인해주세요">
                <label for="floatingPasswordConfirm">비밀번호를 재확인해주세요</label>
              </div>


              <div class="form-floating mb-3">
                <input type="text" class="form-control userName" id="floatingInputUsername" name="UserName" placeholder="이름" required autofocus>
                <label for="floatingInputUsername">이름</label>
              </div>
              
              <div class="form-floating mb-3">
                <input type="email" class="form-control" id="floatingInputEmail" name="UserEmail" placeholder="name@example.com">
                <label for="floatingInputEmail">Email address</label>
              </div>

             

              <div class="form-floating mb-3">
            </div>
            
            <br>
              <div class="d-block text-center mt-2 small">
                <button type="button" id="_btnJoin" class="btn btn-primary btn-login text-uppercase fw-bold">회원가입 완료</button>
              </div>
         <!-- 회원가입 form태그 끝 -->
         
              <hr class="my-4">
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>



      
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
        
        <script type="text/javascript">

        $("#_btnJoin").click(function () {
        	// 회원가입
        	if($("#floatingInputUsername").val().trim() == ""){
        		alert("아이디를 입력해주세요");
        		$("#floatingInputUsername").focus();
        	}else if($("#floatingPassword").val().trim() == ""){
        		alert("비밀번호를 입력해주세요");
        		$("#floatingPassword").focus();
        	}else if($(".userName").val().trim() == ""){
        		alert("보호자님의 이름을 입력해 주세요");
        		$(".userName").focus();
        	}else if($("#floatingInputEmail").val().trim() == ""){
        		alert("보호자님의 이메일을 입력해 주세요");
        		$("#floatingInputEmail").focus();
        	}else{
        		$("#_frmForm").attr("action", "join.do").submit();		
        	}
        	
        });
        
        </script>
</body>
</html>