<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
/* String url = request.getServletPath(); */
String contextPath123 = request.getContextPath();
String redirectgetStime = "http://localhost:8080" + contextPath123 + "/admin/adminStime/getStime.do";
%>
<style>
  .red-text {
    color: red;
  }
</style>
<meta charset="UTF-8">
<title>상영 일정 추가</title>
</head>
<body>
	<h1>상영 일자 추가</h1>
	<form action="stimeInsert.do" method="post">
		<table border="2">

			<tr>
				<td>시작시간</td>
				<td><input type="time" min="00:00" max="23:59" name="stime"></td>
			</tr>
			<tr>
				<td>종료시간</td>
				<td><input type="time" min="00:00" max="23:59" name="etime"></td>
			</tr>
			<tr>
				<td>상영일</td>
				<td><input type="date" name="date"></td>
			</tr>
			<tr>
				<td>스크린아이디</td>
				<td><select name='scr_id' size='6'>
					<option value='' selected>-- 선택 --</option>
					<option value='1'>1관</option>
					<option value='2'>2관</option>
					<option value='3'>3관</option>
					<option value='4'>4관</option>
					<option value='5'>5관</option>
				</select></td>
			</tr>
			<tr>
				<td>영화코드</td>
				<td><input type="text" name="mo_code"></td>
				<p class="red-text">DB에 존재하는 영화코드만 삽입할 수 있습니다.</p>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="추가"></td>
			</tr>
		</table>
	</form>
</body>
</html>