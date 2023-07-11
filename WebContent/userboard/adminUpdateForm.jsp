<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
#a {
background-color: silver;
}


</style>
</head>
<body>
<section>
	<h1 align="center">수정 및 삭제</h1>
	<hr>
	
	<form action="update.do?sbunho=${ssv.bbsID}" method="post">
	
		<table width="700" border="1" style="border-collapse: collapse;"  >
		
			<tr>
				<td id="a" align="center">번호</td>
				<td>${ssv.bbsID}</td>
			</tr>
			
			<tr>
				<td id="a" align="center">제목</td>
				<td><input type="text" value="${ssv.bbsTitle}" name="bbsTitle"></td>
			</tr>
			
			<tr>
				<td id="a" align="center">작성자</td>
				<td><input value="${ssv.userID}" name="userID" readonly></td>
			</tr>
			
			<tr>
				<td id="a" align="center">내용</td>
				<td colspan="2">
				<textarea name="bbsContent" rows="10" style="resize: none; width: 95%;" placeholder="${ssv.bbsContent}"></textarea>
				</td> 
			</tr>
			<tr>
				<td colspan="4">
		</table>
		<input type="hidden" value="${ssv.bbsID}" name="bbsID">
	</form>
	<hr>
		<a href="delete2.do?bunho=${ssv.bbsID}">[삭제]</a>


	
	</section>
	
</body>
</html>