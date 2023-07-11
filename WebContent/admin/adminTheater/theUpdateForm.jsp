<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화관 수정</title>
</head>

<body>
	<h1>영화관 수정</h1>
	<hr>
	<form action="theUpdate.do?th_id2=${stv.th_id}" method="get">
		<table border="1">
			<tr>
				<td>ID</td>			
				<td>영화관 이름</td>			
				<td>영화관 주소</td>			
				<td>영화관 전화번호</td>
			</tr>
			<tr>
				<td><input type="text" value="${stv.th_id}" name="th_id"></td>
				<td><input type="text" value="${stv.th_name}" name="th_name"></td>
				<td><input type="text" value="${stv.th_addr}" name="th_addr"></td>
				<td><input type="text" value="${stv.th_tel}" name="th_tel"></td>
				<td><input type="hidden" value="${stv.th_id}" name="th_id2"></td>
			</tr>
			<tr>
				<td colspan="4">
					<input type="submit" value="수정">
					<input type="reset" value="취소">
				</td>
			</tr>
		</table>
	</form>
	<a href="${pageContext.request.contextPath}/getTheater.jsp">모두보기</a>
	<a href="theDelete.do?th_id=${stv.th_id}">삭제</a>
</body>
</html>




