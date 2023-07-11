<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 추가</title>
</head>
<body>
	<h1>영화 추가</h1>
	<form action="insertMovie.do" method="post">
		<table border=1>
			<tr><td>영화 코드</td>	<td><input type="text" name="mo_code" size=100 required></td>
			<tr><td>제목</td><td><input type="text" name="mo_name" size=100 required></td>
			<tr><td>소개글</td><td><textarea name="mo_info" cols=100 rows=10 required></textarea></td>
			<tr><td>이미지 주소</td><td><input type="text" name="mo_post" size=100 required></td>
			<tr><td>런타임</td><td><input type="text" name="mo_run" size=100 required></td>
			<tr><td>장르</td><td><input type="text" name="mo_type" size=100 required></td>
			<tr><td>개봉일</td><td><input type="text" name="mo_open" size=100 required></td>
			<tr><td>등급</td><td><input type="text" name="mo_age" size=100 required></td>
			<tr><td>감독<td><input type="text" name="mo_dirname" size=100 required></td>
			<tr><td>배우</td><td><input type="text" name="mo_actname" size=100 required></td>
			<tr>
				<td colspan=4><input type="submit" value="추가"></td><tr>
			</tr>
		</table>
	</form>
</body>
</html>