<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<% /* String url = request.getServletPath(); */
String contextPath123 = request.getContextPath();
String redirectgetmem = "http://localhost:8080" + contextPath123 + "/admin/adminMember/getMember.do";
%>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1> 수정</h1>
	<hr>
	<form action="memberUpdate.do?m_id2=${mtv.m_id}" method="get">
		<table border="1">
			<tr>		
				<td>아이디</td>			
				<td>비밀번호</td>			
				<td>이름</td>
				<td>전화번호</td>
				<td>이메일</td>
			</tr>
			<tr>
			    <td><input type="text" value="${mv.m_id}" name="m_id"></td>
				<td><input type="text" value="${mv.m_pw}" name="m_pw"></td>
				<td><input type="text" value="${mv.m_name}" name="m_name"></td>
				<td><input type="text" value="${mv.m_tel}" name="m_tel"></td>
				<td><input type="text" value="${mv.m_email}" name="m_email"></td>
			

				<td><input type="hidden" value="${mv.m_id}" name="m_id2"></td>
				
			</tr>
			<tr>
				<td colspan="5">
					<input type="submit" value="수정">
					<input type="reset" value="취소">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>