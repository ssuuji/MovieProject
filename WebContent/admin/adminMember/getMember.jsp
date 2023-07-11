<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 조회</title>

</head>
<body>

	<h1>회원 조회</h1>
	<hr>
	<table border="5" >
		<tr>
			<th>아이디</th>
  			<th>비밀번호</th>
  			<th>이름</th>
  			<th>전화번호</th>
  			<th>이메일</th>
  					
		</tr>
		
		<c:forEach var="vo1" items="${memberlist1}">
		<tr>
			<td><a href="memberSearchone.do?m_id=${vo1.m_id}">${vo1.m_id}</a></td>
			<td>${vo1.m_pw}</td>
			<td>${vo1.m_name}</td>
			<td>${vo1.m_tel}</td>
			<td>${vo1.m_email}</td>
			
		</tr>
		</c:forEach>
			
		

	</table>
</body>
</html>