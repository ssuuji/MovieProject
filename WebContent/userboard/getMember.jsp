<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 조회</title>
<link rel="stylesheet" href="../css/header_style.css">
<style>
table{
margin: auto;
}
h1{
text-align: center;
}
section{
margin-top: 150px;
}
</style>

<% /* String url = request.getServletPath(); */

String contextPath12 = request.getContextPath();


	
String redirectmso= contextPath12 + "/userboard/memberSearchone.do";
//http://localhost:8080/MovieProject/userboard/memberSearchone.do?m_id=kim

%> 
</head>
<body>
<header>
<%@ include file="/header.jsp" %>
</header>

<section>

   <h1>회원 조회</h1>
   <hr>
   <table border="5">
      <tr>
         <th>아이디</th>
           <th>이름</th>
           <th>전화번호</th>
           <th>이메일</th>
                 
      </tr>
      
<tr>
<td><a href="<%=redirectmso %>?m_id=${membervo.m_id}">${membervo.m_id}</a></td>
<td>${membervo.m_name}</td>
<td>${membervo.m_tel}</td>
<td>${membervo.m_email}</td>
</tr>
   </table>
   
  
   

   
   
   </section>
</body>
</html>