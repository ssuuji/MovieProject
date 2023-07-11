<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> 스크린 전체 보기 </h1>
	<hr>
	<table border="1">
		<tr>
			<td>상영관</td>
			<td>극장코드</td>
			<td>총 좌석 수</td>
		</tr>
		
		<c:forEach var= "vol" items="${slist}"> 
		<tr>
			<td><a href="ScreenSearchone.do?scr_id=${vol.scr_id}">${vol.scr_id}</a></td>
			<td>${vol.th_id}</td>
			<td>${vol.scr_tot}</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>