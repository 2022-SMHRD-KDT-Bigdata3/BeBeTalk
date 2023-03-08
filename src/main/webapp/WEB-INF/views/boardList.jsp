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
<title>Insert title here</title>

<script type="text/javascript">
	$(function() {
		$("input[type=button]").click(function() {
			console.log("o~~~k")
			console.log(location.origin); // "https://www.naver.com" (포트 번호 80번은 생략됨)
			//폼태그에서 보내준 데이터 받기 
			
			var form = $("#fileUploadForm")[0];  
		 	var data = new FormData(form);
		 		
			//var title = $("#title")
			//var content = $("#content")
			//var writer = $("#writer")
			//data = {"title" : title, "content" : content, "writer" : writer},
			
			$("input[type=button]").prop("disabled", true);
			$.ajax({
			url : "http://127.0.0.1:5000/receive_data", //flask주소
			async : true,
			type : "POST",
			data : data,
			processData : false,
			contentType : false,
			cache : false,
			timeout : 600000,
			success : function(data) {
		 		var title=data["title"];
		 		var content=data["content"];
		 		var writer=data["writer"];
		 		console.log(data)
				$.ajax({
				    url: "${cpath}/dataInsert.do",
				    type: "POST",
				    data : {"title" : title, "content" : content, "writer" : writer},
				    success: function() { },
				    error: function(){ alert("error");}
					});
				},
			error : function(e) {
			console.log("ERROR : ", e);
			alert("fail");
				}
			});
		})
	});
</script> 

</head>
<body>


<table border = "1">
	<tr>
		<td>번호</td>
		<td>제목</td>
		<td>작성자</td>
		<td>작성일</td>
		<td>조회수</td>
	</tr>
	<c:forEach var="vo"  items="${list}"> 
	<tr>
		<td>${vo.idx}</td>
		<td><a href = "${cpath}/content.do">${vo.title}</a></td>
		<td>${vo.writer}</td>
		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${vo.indate}"/></td>
		<td>${vo.count}</td>
	</tr>
	</c:forEach>
</table>


	<form method="post" enctype="multipart/form-data" id="fileUploadForm">
		<div class="form-group">
			<label for="title"> 제목 : </label>
			<input type="text" id = "title" name="title">
		</div>
		<div class="form-group">
			<label for="title"> 내용 : </label>
			<input type="text" id = "content" name="content">
		</div>
		<div class="form-group">
			<label for="title"> 작가 : </label>
			<input type="text" id = "writer" name="writer" >
		</div>
		<input type="button" value=" 비동기 요청 ">		
	</form>


</body>
</html>