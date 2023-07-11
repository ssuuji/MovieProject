<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

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



<section>
<h1 align="center">게시글 입력</h1>
	
	<form action="insert2.do" method="post">
	
		<table width="1000" border="1" style="border-collapse: collapse;" align="center">
		
			<tr>
				<td>제목</td>
				<td><input type="text" name="bbsTitle"></td>
			</tr>
			
			<tr>
				<td>작성자</td>
				<td><input value="admin " name="userID" readonly></td>
			</tr>
			
			<tr>
				<td>내용</td>
				<td>
					<textarea name="bbsContent" placeholder="내용을 입력하세요" rows="10" style="resize: none; width: 95%;"></textarea>
				</td>
			</tr>
			
			<tr>
				<td colspan="2"><input type="submit" value="입력"></td>
				
			</tr>
			
		</table>
		<a href="getUserBoard2.do">[뒤로가기]</a>
	</form>
</section>
</body>
</html>

