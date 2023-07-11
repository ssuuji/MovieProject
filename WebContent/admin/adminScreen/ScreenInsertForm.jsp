<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<% /* String url = request.getServletPath(); */
String contextPath123 = request.getContextPath();
String redirectscgetall = "http://localhost:8080" + contextPath123 + "/admin/adminScreen/ScreenGetAll.do";
%>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> 스크린 추가</h1>
	<form action="ScreenInsert.do" method = "post">
		<table border=2>
			<tr>
				<td>상영관</td>
				<td><input type="text" name="scr_id"></td>
			</tr>
			<tr>
				<td>극장코드</td>
				<td><input type="text" name="th_id"></td>
			</tr>
			<tr>
				<td>총 좌석 수</td>
				<td><input type="text" name="scr_tot"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="추가"></td>
			</tr>
			
		</table>
		<table border=0>
			<tr>
				<td><a href="ScreenInsertForm.jsp">[입력]</a></td>
			
				<td><a href="<%=redirectscgetall%>">모두보기</a></td>
		</table>
	</form>
</body>
</html>