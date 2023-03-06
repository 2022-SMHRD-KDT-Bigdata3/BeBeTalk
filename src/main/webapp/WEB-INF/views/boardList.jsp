<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <!-- 태그들을 연결시킬때 사용하는 지시자  -->
   <!-- jstl 태그들은 다른 태그들과 충돌이 날 수 있기 때문에 접두사로 c를 붙여준다! -->
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
  <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>  
  <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
  <!-- contextpath(유지보수하는데 도움이 됨)를 가지고 오는 방법 -->
  <c:set var="cpath" value="${pageContext.request.contextPath}"/> 
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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

</body>
</html>