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

h1{
text-align: center;
}

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
	<h1 align="center">수정 및 삭제</h1>
	
	<hr>
	
	<form action="update.do?sbunho=${ssv.bbsID}" method="post">
	
		<table width="700" border="1" style="border-collapse: collapse;" align="center" >
		
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
				<%-- <input type="text" value="${ssv.content}" name="content"> --%>
				</td> 
			</tr>
			
			<tr>

				<td colspan="4">
				<input type="submit" value="수정">
				<input type="reset" value="취소">
			
		</table>
		
		<input type="hidden" value="${ssv.bbsID}" name="bbsID">
		
	</form>
	
	<hr>

 	<div align="center">
		<a href="delete.do?bunho=${ssv.bbsID}">[삭제]</a>
		<a href="getUserBoard2.do">[모두보기]</a>
	</div>

	
	</section>
	
</body>
</html>