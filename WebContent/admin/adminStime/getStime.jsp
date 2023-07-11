<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 시간</title>

</head>
<body>

	<h1>영화 시간</h1>
	<hr>
	<table border="3" >
		<tr>
			<th>상영ID</th>
  			<th>시작시간</th>
  			<th>종료시간</th>		
			<th>상영일</th>
			<th>스크린</th>
			<th>예매된 좌석</th>
			<th>영화 코드</th>
		</tr>
		<c:forEach var="vo1" items="${stimelist1}">
		<tr>
			<td><a href="stimeSearchone.do?t_id=${vo1.t_id}">${vo1.t_id}</a></td>
			<td>${vo1.scr_stime}</td>
			<td>${vo1.scr_etime}</td>
			<td>${vo1.scr_date}</td>
			<td>${vo1.scr_id}</td>
			<td>${vo1.seat_plot}</td>
			<td>${vo1.mo_code}</td>
			
		</tr>
		</c:forEach>
			<tr>
				<td><a href="stimeInsertForm.jsp">[입력]</a></td>
				<td><a href="stimeDeleteForm.jsp">[삭제]</a></td>
	</table>
</body>
</html>