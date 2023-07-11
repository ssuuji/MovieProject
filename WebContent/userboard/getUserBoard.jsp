<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/header_style.css">

<title>자유게시판</title>


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
<header>
<%@ include file="/header.jsp" %>
</header>

<section>

<h1 align="center">자유게시판</h1>

 <table  border="1" width="1000" align="center" style="border-collapse: collapse;">
 	<tr>
 		<th>번호</th> 
 		<th>제목</th>
 		<th>아이디</th>
 		<th>작성일</th>
 	</tr>

 		<c:forEach var="v2" items="${ulist2}">
 		 	<tr>
  			  	<td align="center"><a href="adminsearchone.do?bunho=${v2.abbsID}">${v2.abbsID}</td>
    			<td><span class="bold-text">${v2.abbsTitle}</span></td>
    			<td><span class="bold-text">${v2.adminID}</span></td>
    			<td width="700"><span class="bold-text">${v2.abbsDate}</span></td>
  			</tr>
		</c:forEach> 
 	
 	<c:forEach var="v1" items="${ulist1}">
			<tr>
				<td align="center"><a href="searchone.do?bunho=${v1.bbsID}">${v1.bbsID}</a></td>
				<td>${v1.bbsTitle}</td>
				<td>${v1.userID}</td>
				<td width="700">${v1.bbsDate}</td>
			</tr>
		</c:forEach>
 	
 </table>
 	<div align="center"><a href="InsertForm.jsp">[글쓰기]</a></div> 
</section>
</body>
</html>