<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 작성</title>
</head>
<body>
<h1 align="center">후기 작성</h1>
<form action="InsertRev.do" method="post">
<hr>
<table border="2" width="800" align="center" style="border-collapse:collapse">

<!-- 번호는 rev_seq.NEXTVAL 처리  -->
<%-- <tr>
<td align="center"> 번호</td>
<td>${rvo.rev_id}</td>
</tr> --%>

<!-- 코드는 영화 목록에서 눌러서 리뷰하러 들어가면 됨 삭제하는 거랑 비슷 -->
<%-- <tr>
<td align="center"> 코드</td>
<td>${rvo.mo_code}</td>
</tr> --%>

<!-- 작성자 로그인한 상태에서 작성할수 있게해야함 나중에 구현? -->
<tr>
<td align="center"> 작성자</td>
<td><input type="text" name="m_id"></td>
</tr> 
<tr>


<tr>
<td align="center"> 리뷰 내용</td>
<td><textarea name="rev_contents" colspan="2" rows="10" style="resize: none; width: 99%;">${rvo.rev_contents}</textarea><td>
</tr>
<tr><td colspan="2">
<input type="submit" value="글쓰기">
</td></tr>




<%-- <div>
<a href="RevDelete.do?rev_id=${rvo.rev_id}">[삭제]</a>
</div> --%>
</table>


<%
	int code = Integer.parseInt(request.getParameter("mo_code"));
%>
<input type="hidden" value=<%=code %> name="mo_code">


</form>


</body>
</html>