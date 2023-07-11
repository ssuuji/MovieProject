<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화코드 ${smovo.mo_code}의 정보</title>
<script>
	function confirmDelete() {
		if (confirm("정말 삭제하시겠습니까?")) {
			document.getElementById("deleteForm").submit();
		} else {
			location.reload();
		}
	}
</script>
</head>
<body>
	<h1>영화코드 ${smovo.mo_code}의 정보</h1>
	<hr>
	<form action="updateMovie.do" method="get">
		<table border="1">
				<tr><td>코드</td><td><input type=text value="${smovo.mo_code}" name="mo_code" size=100 readonly></td>
				<tr><td>제목</td><td><input type=text value="${smovo.mo_name}" name="mo_name" size=100 required></td>
				<tr><td>소개글</td><td><textarea name="mo_info" cols=100 rows=10 required>${smovo.mo_info}</textarea></td>
				<tr><td>사진주소</td><td><input type=text value="${smovo.mo_post}" name="mo_post" size=100 required></td>
				<tr><td>런타임</td><td><input type=text value="${smovo.mo_run}" name="mo_run" size=100 required></td>
				<tr><td>장르</td><td><input type=text value="${smovo.mo_type}" name="mo_type" size=100 required></td>
				<tr><td>개봉일</td><td><input type=text value="${smovo.mo_open}" name="mo_open" size=100 required></td>
				<tr><td>등급</td><td><input type=text value="${smovo.mo_age}" name="mo_age" size=100 required></td>
				<tr><td>감독</td><td><input type=text value="${smovo.mo_dirname}" name="mo_dirname" size=100 required></td>
				<tr><td>배우</td><td><input type=text value="${smovo.mo_actname}" name="mo_actname" size=100 required></td>
			</tr>
			<tr>
				<td colspan=4><input type="submit" value="수정하기"> 
				<a href="DeleteMovie.do?mo_code=${smovo.mo_code}" id="deleteForm"
					onclick="confirmDelete()"><input type="button" value="삭제하기"></a>
					<a href="MovieGetAll.do"><input type="button" value="전체보기"></a>
			</tr>
		</table>
		<%-- <input type="hidden" value="${sbvo.num}" name="num"> 
		<input type="hidden" value="${sbvo.name}" name="name"> <input
			type="hidden" value="${sbvo.writer}" name="writer"> <input
			type="hidden" value="${sbvo.content}" name="content"> --%>
	</form>
</body>
</html>