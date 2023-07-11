<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록된 영화 전체 조회</title>
</head>
<body>
<h1 align="center">영화별 리뷰 확인</h1>
<table  border=1 align="center">
 	<tr>
 		<td>코드</td><td>제목</td><td>소개글</td><td>사진주소</td>
 		<td>런타임</td><td>장르</td><td>개봉일</td><td>등급</td>
 		<td>감독</td><td>배우</td>
 	</tr>
 	<c:forEach var="i" items="${molist}">
 	<tr>
 		<td><a href="RevgetMovie.do?mo_code=${i.mo_code}">${i.mo_code}</a></td>
 		<td >${i.mo_name}</td>
 		<td >${i.mo_info}</td>
 		<td >${i.mo_post}</td>
 		<td >${i.mo_run}</td>
 		<td >${i.mo_type}</td>
 		<td >${i.mo_open}</td>
 		<td >${i.mo_age}</td>
 		<td >${i.mo_dirname}</td>
 		<td >${i.mo_actname}</td>
 	</tr>
 	</c:forEach>
 </table>
<div align="center">
<a href="RgetAllinfo.do" >[전체 리뷰 보기]</a> 
<a href="MovieInsert.jsp" >[영화 추가]</a> 
</div>

</body>
</html>