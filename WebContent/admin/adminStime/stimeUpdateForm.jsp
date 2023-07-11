<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
String contextPath123 = request.getContextPath();
String redirectgetStime = "http://localhost:8080" + contextPath123 + "/admin/adminStime/getStime.do";
%>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>상영일정 수정</h1>
	<hr>
	<form action="stimeUpdate.do" method="get">
		<table border="1">
			<tr>
				<th>상영ID</th>
				<th>시작시간</th>
				<th>종료시간</th>
				<th>상영일</th>
				<th>스크린</th>
				<th>영화 코드</th>
			</tr>
			<tr>
				<td><input type="hidden" name="t_id" value="${sv.t_id}">${sv.t_id}</td>
				<td><input type="time" min="00:00" max="23:59" name="stime"
					value="${sv.scr_stime}"></td>
				<td><input type="time" min="00:00" max="23:59" name="etime"
					value="${sv.scr_etime}"></td>
				<td><input type="date" name="date" value="${sv.scr_date}"></td>
				<td><select name='scr_id' size='1'>
						<option value='1' ${sv.scr_id == '1' ? 'selected' : ''}>1관</option>
						<option value='2' ${sv.scr_id == '2' ? 'selected' : ''}>2관</option>
						<option value='3' ${sv.scr_id == '3' ? 'selected' : ''}>3관</option>
						<option value='4' ${sv.scr_id == '4' ? 'selected' : ''}>4관</option>
						<option value='5' ${sv.scr_id == '5' ? 'selected' : ''}>5관</option>
				</select></td>
				<td><input type="text" name="mo_code" value="${sv.mo_code}"></td>
			</tr>
			<tr>
				<td colspan="4"><input type="submit" value="수정"> <input
					type="reset" value="취소"></td>
			</tr>
		</table>
	</form>
	<a href="<%=redirectgetStime%>">[모두보기]</a>
	<a href="stimeDelete.do?t_id=${sv.t_id}">삭제</a>
</body>
</html>