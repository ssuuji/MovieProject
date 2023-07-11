<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/header_style.css">
<style>
#a {
background-color: silver;
}





</style>

</head>

<body>


<section>
	<h1>수정 및 삭제</h1>
	
	<hr>
	
	<form action="adminUpdate.do?abbsID=${ssv1.abbsID}" method="post">
	
		<table width="700" border="1" style="border-collapse: collapse;"  >
		
			<tr>
				<td id="a" align="center">번호</td>
				<td>${ssv1.abbsID}</td>
			</tr>
			
			<tr>
				<td id="a" align="center">제목</td>
				<td><input type="text" value="${ssv1.abbsTitle}" name="abbsTitle"></td>
			</tr>
			
			<tr>
				<td id="a" align="center">작성자</td>
				<td><input value="${ssv1.adminID}" name="adminID" readonly></td>
			</tr>
			
			<tr>
				<td id="a" align="center">내용</td>
				<td colspan="2">
				<textarea name="abbsContent" rows="10" style="resize: none; width: 95%;" placeholder="${ssv1.abbsContent}"></textarea>
				<%-- <input type="text" value="${ssv.content}" name="content"> --%>
				</td> 
			</tr>
			
			<tr>
				<td colspan="4">
				<input type="submit" value="수정">
				<input type="reset" value="취소">
				
		</table>
		
		<input type="hidden" value="${ssv1.abbsID}" name="abbsID">
		
	</form>
	
	<hr>
	
	<div>
		<a href="admindelete.do?abbsID=${ssv1.abbsID}">[삭제]</a>
	</div>
	</section>
</body>
</html>