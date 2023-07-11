<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/header_style.css">
<title>Insert title here</title>

<style>
section{
padding: 15%;
}
table {
  margin: auto;

}
</style>
</head>
<body>


<header>
<%@ include file="/header.jsp" %>
</header>
<section>
<h1 align="center">게시글 입력</h1>
	
	<form action="insert.do" method="post">
	
		<table width="1000" border="1" style="border-collapse: collapse;" align="center">
		
			<tr>
				<td>제목</td>
				<td><input type="text" name="bbsTitle"></td>
			</tr>
			
			<tr>
				<td>작성자</td>
				<td><input value="<%= id %>" name="userID" readonly></td>
			</tr>
			
			<tr>
				<td>내용</td>
				<td>
					<!-- <input type="text" name="content"> -->
					<textarea name="bbsContent" placeholder="내용을 입력하세요" rows="10" style="resize: none; width: 95%;"></textarea>
				</td>
			</tr>
			
			<tr>
				<td colspan="2"><input type="submit" value="입력"></td>
			</tr>
			
		</table>
		
	</form>
</section>
</body>
</html>

