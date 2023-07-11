<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script >
</script>

<title>공지사항</title>


<style>
th{
background-color: silver;
}

</style>

</head>
<body>

<section>

<h1>공지사항</h1>

 <table  border="1" width="1000"  style="border-collapse: collapse;">
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
 	
 	
 </table>
 <div><a href="adminInsertForm.jsp">[글쓰기]</a></div>
</section>
</body>
</html>