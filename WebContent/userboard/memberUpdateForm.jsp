<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/header_style.css">
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

.backimg{
height: 19px;
width: 25px;
}
</style>

<% /* String url = request.getServletPath(); */

String contextPath22 = request.getContextPath();


String redirectgmb= contextPath22 + "/userboard/getMember.do";

String redirectmup= contextPath22 + "/userboard/memberUpdate.do";


String redirectdel= contextPath22 + "/memberDelete.do";
//http://localhost:8080/MovieProject/userboard/memberUpdate.do?m_id=kim
%> 
</head>
<body>
<h1> 수정</h1>
	<hr>
	<form action="<%=redirectmup %>?m_id2=${mtv.m_id}" method="post">
		<table border="1">
			<tr>		
				<td>아이디</td>			
				<td>비밀번호</td>			
				<td>이름</td>
				<td>전화번호</td>
				<td>이메일</td>
			</tr>
			<tr>
			    <td><input value="${mv.m_id}" name="m_id" readonly></td>
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
					<a  href="<%=redirectgmb%>"><img class="backimg" src="../img/back.png"> </a>
					<a href="<%=redirectdel%>">회원탈퇴</a>
				</td>
			</tr>
		</table>
	</form>

</body>
</html>