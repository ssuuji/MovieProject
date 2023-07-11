<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>영화 제목으로 검색 결과</h1>
<c:forEach var="i" items="${molist1}">
<hr>


    코드 : ${i.code}<br> <br>
    제목 : ${i.name}<br><br>
	vod : <a href="${i.url }">링크</a>
	${i.url }
	
    
    <br><br>
<hr>
</c:forEach>
</body>
</html>
