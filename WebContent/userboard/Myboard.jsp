<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내가 작성한 글</title>
<style>
th{
background-color: silver;
}
section{
align : center;
flex-direction: column;

padding-top: 10%;

}
table {
  margin: auto;

}


.bold-text {
    font-weight: bold;
  }
</style>
</head>
<body>
<section>

<h1 align="center">자유게시판</h1>
 <table  border="1" width="1000" align="center" style="border-collapse: collapse;">
 	<tr>
 		<th>번호</th> 
 		<th>제목</th>
 		<th>아이디</th>
 		<th>작성일</th>
 	</tr>
<c:forEach var="v1" items="${ulist1}">
			<tr>
				<td align="center"><a href="Mysearchone.do?bunho=${v1.bbsID}">${v1.bbsID}</a></td>
				<td>${v1.bbsTitle}</td>
				<td>${v1.userID}</td>
				<td width="700">${v1.bbsDate}</td>
			</tr>
		</c:forEach>
 </table>
</section>
</body>
</html>