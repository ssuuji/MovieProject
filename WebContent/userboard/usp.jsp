<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%String mypage= "http://localhost:8080"+request.getContextPath()+"/userboard/BookInfo.do";%>
<script>
  setTimeout(function() {
    window.location.href ="<%=mypage%>" ;
  }, 2000); // 2초 후에 메인페이지로 이동
</script>
<style>
h1{
color:red;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
  Object er = request.getAttribute("er");
  if (er != null) {
%>
  <h1>비밀번호 확인이 일치하지 않습니다.</h1>
<%
  }else{
%>
<h1>정보 수정이 완료되었습니다.</h1>
<%} %>
</body>
</html>