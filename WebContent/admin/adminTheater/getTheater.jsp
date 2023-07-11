<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화관 전체 조회</title>

</head>
<body>

	<h1>영화관 전체 조회</h1>
	<hr>
	<table border="3" >
		<tr>
			<td>ID</td>	
			<td>영화관 이름</td>	
			<td>영화관 주소</td>	
			<td>영화관 전화번호</td>	
		</tr>
		<c:forEach var="vo1" items="${thealist1}">
		<tr>
			<td><a href="theSearchone.do?th_id=${vo1.th_id}">${vo1.th_id}</a></td>
			<td>${vo1.th_name}</td>
			<td>${vo1.th_addr}</td>
			<td>${vo1.th_tel}</td>
		</tr>
		</c:forEach>
		
		<table border=0>
			<tr>
				<td><a href="theInsertForm.jsp">[입력]</a></td>
		</table>
	</table>
</body>
</html>