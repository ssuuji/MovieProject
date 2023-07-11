<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화관 삭제</title>
</head>

<body>
 
	<h1>영화관 삭제</h1>
	<hr>
	<form action="theDelete.do?th_id=${stv.th_id}" method="get">
		<table border="1">
			<tr>
				<td colsapan="4">삭제할 아이디</td>
				<td><input type="text" value="${stv.th_id}" name="th_id"></td>
				<input type="hidden" value="${stv.th_id2}" name="th_id2">
			</tr>
			<tr>
				<td colspan="4">
					<input type="submit" value="삭제">
					<input type="reset" value="취소">
				</td>
			</tr>
		</table>
	</form>
	<a href="${pageContext.request.contextPath}/getTheater.jsp">모두보기</a>
</body>
</html>
