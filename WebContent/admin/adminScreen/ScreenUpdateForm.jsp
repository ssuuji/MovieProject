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
	<h1>스크린 정보</h1>
	<form action="ScreenUpdate.do" method="get">
		<table border=1 >
			<tr>
				<td>상영관</td>
				<td>극장코드</td>
				<td>총 좌석 수</td>
			</tr>
			
			<tr>
				<td><input type="text" value="${svo2.scr_id}" name="scr_id" readonly></td>
				<td><input type="text" value="${svo2.th_id}" name="th_id"></td>
				<td><input type="text" value="${svo2.scr_tot}" name="scr_tot"></td>
			</tr>
			<tr>
				<td colspan="4">
					<input type="submit" value="수정">
					<input type="reset" value="취소">
					
				</td>
			</tr>
		</table>
		
	</form>
	<br>
	
	<a href="<%=redirectscgetall%>">모두보기</a>
		<a href="ScreenDelete.do?scr_id=${svo2.scr_id}">삭제</a>
			
</body>
</html>