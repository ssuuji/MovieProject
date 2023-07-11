<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
if (request.getAttribute("error") != null) {
    String errorMessage = "아이디 또는 비밀번호가 일치하지 않습니다.";
    %>
    <script>
        alert("<%=errorMessage%>");
    </script>
    <%} String id = (String) session.getAttribute("id");%>

<title>Insert title here</title>
</head>
<body>
	<h1>공지사항 입력</h1>
	
	<form action="admininsert.do" method="post">
	
		<table width="1000" border="1" style="border-collapse: collapse;" >
		
			<tr>
				<td>제목</td>
				<td><input type="text" name="abbsTitle"></td>
			</tr>
			
			<tr>
				<td>작성자</td>
				<td><input value="admin" name="adminID" readonly></td>
			</tr>
			
			<tr>
				<td>내용</td>
				<td>
					<!-- <input type="text" name="content"> -->
					<textarea name="abbsContent" placeholder="내용을 입력하세요" rows="10" style="resize: none; width: 95%;"></textarea>
				</td>
			</tr>
			
			<tr>
				<td colspan="2"><input type="submit" value="입력"></td>
			</tr>
			
		</table>
		
	</form>
	
</body>
</html>