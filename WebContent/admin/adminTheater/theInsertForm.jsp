<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화관 추가</title>
</head>
<body>
	<h1>영화관 추가</h1>
	<form action="theInsert.do" method="post">
		<table border="2">
			<tr>
				<td>영화관 ID</td>
				<td><input type="text" name="th_id"></td>
			</tr>
			<tr>	
				<td>영화관 이름</td>
				<td><input type="text" name="th_name"></td>
			</tr>
			<tr>
				<td>영화관 주소</td>
				<td><input type="text" name="th_addr"></td>
			</tr>
			<tr>
				<td>영화관 전화번호</td>
				<td><input type="text" name="th_tel"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="추가"></td>
			</tr>
		</table>
		
		<table border=0>
			<tr>
				<td><a href="getTheater.jsp">[모두보기]</a></td>
			</tr>	
		</table>
	</form>
</body>
</html>