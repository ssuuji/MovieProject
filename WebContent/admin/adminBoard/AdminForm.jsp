<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



</head>

<body>



	<h1>공지사항</h1>
	
	<hr>
	
	<form action="adminUpdate.do?adminID=${ssv1.adminID}" method="post">
	
		<table width="700" border="1" style="border-collapse: collapse;"  >
		
			<tr>
				<td id="a" align="center">번호</td>
				<td>${ssv1.abbsID}</td>
			</tr>
			
			<tr>
				<td id="a" align="center">제목</td>
				<td><input type="text" value="${ssv1.abbsTitle}" name="abbsTitle" readonly></td>
			</tr>
			
			<tr>
				<td id="a" align="center">작성자</td>
				<td><input value="${ssv1.adminID}" name="adminID" readonly></td>
			</tr>
			
			<tr>
				<td id="a" align="center">내용</td>
				<td colspan="2">
				<textarea name="abbsContent" rows="10" style="resize: none; width: 95%;" placeholder="${ssv1.abbsContent}" readonly></textarea>
				<%-- <input type="text" value="${ssv.content}" name="content"> --%>
				</td> 
			</tr>
			
			<a href="getUserBoard.do">[뒤로가기]</a>
		</table>
	</form>
		
	
	<hr>
	

	
</body>
</html>