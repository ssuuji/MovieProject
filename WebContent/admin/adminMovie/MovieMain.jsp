<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>영화 제목으로 검색 결과</h1>
<c:forEach var="i1" items="${molist2}">
<hr>


	순위 : ${i1.mo_rank}<br><br>
	누적관객수 : ${i1.mo_audiAcc}<br><br> 
    코드 : ${i1.mo_code}<br> <br>
    제목 : ${i1.mo_name}<br><br>
    줄거리 : ${i1.mo_info}<br><br><br>
    <img src="${i1.mo_post}">
    이미지 주소 : ${i1.mo_post}<br><br>
    런타임 : ${i1.mo_run}분<br><br>
    장르 : ${i1.mo_type}<br><br>
    개봉일 : ${i1.mo_open}<br><br>
    관람등급: ${i1.mo_age}<br><br>
    감독명 : ${i1.mo_dirname}<br><br>

    배우 : ${i1.mo_actname} 

    
    <br><br>
<hr>
</c:forEach>
</body>
</html>
