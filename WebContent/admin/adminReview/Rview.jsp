<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기설정</title>
<script>
    function Back() {
        window.history.back();
    }
</script>
</head>
<body>
<h1>후기 설정 </h1>
<hr>
<form action="RevUpdate.do" method="post">

<%-- <form action="updateRev.do?mo_code=${rvo.mo_code}&amp;rev_id=${rvo.rev_id}&amp;m_id=${rvo.m_id}&amp;rev_contents=${rvo.rev_contents}" method="post">
 --%>

<table width="700" border="1" style="border-collapse:collapse" >
<tr>
<td align="center"> 번호</td>
<td><input type="text" value="${rvo.rev_id}" name="rev_id"></td>
</tr>
<tr>
<td align="center"> 코드</td>
<td><input type="text" value="${rvo.mo_code}" name="mo_code"></td>
</tr>
<tr>
<td align="center"> 작성자</td>
<td><input type="text" value="${rvo.m_id}" name="m_id"></td>
</tr>
<tr>
<td align="center"> 날짜</td>
<td><input type="text" value="${rvo.write_date}" name="write_date"> </a></td>
</tr>
<tr>
<td align="center"> 리뷰내용</td> <!-- 리뷰내용 수정 못하게 하려면 readonly 적으면됨 -->
<td><textarea name="rev_contents" colspan="2" rows="10" style="resize: none; width: 99%;"  >${rvo.rev_contents}</textarea><td>
</tr>

<tr><td colspan="2">
<input type="submit" value="수정">
<button onclick="Back()">뒤로가기</button>


<a href="RevDelete.do?rev_id=${rvo.rev_id}">삭제</a>
</td></tr>

</table>

</form>

</body>
</html>