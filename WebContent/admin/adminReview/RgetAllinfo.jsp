<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1 align="center">영화별 리뷰 목록</h1>

<table border="2" width="800" align="center" style="border-collapse:collapse">
<tr>
<th>게시글번호</th><th>영화코드</th><th>영화이름</th><th>작성일</th><th>글내용</th><th>회원아이디</th>
</tr>
<c:forEach var="i" items="${rlist1}">

<tr>
 	<td width="100" align="center"><a href="Revsearch.do?rev_id=${i.rev_id}">${i.rev_id}</a></td>
	<td width="100" align="center">${i.mo_code}</td>
	<td width="100" align="center">${i.mo_name}</td>
	<td width="100" align="center">${i.write_date}</td>
	<!-- 나중에 리뷰 최소 n글자 이상 입력하라고 해놔야함. 안그럼 substring에서 오류난다.. -->
	<td width="400" align="center">${i.rev_contents.substring(0, 3)}</td>
	<td width="100" align="center">${i.m_id}</td>
</tr>

<%-- <a href="insertR.jsp?mo_code=${i.mo_code}" >[리뷰작성 임시]</a>  --%>

</c:forEach>
</table>
<a href="insertR.jsp?mo_code=${rlist1[0].mo_code}" >[리뷰작성 임시]</a> 
<div align="center"><a href="MovieGetAll.do" >[영화목록]</a></div>
<div align="left">
</div>


</body>
</html>