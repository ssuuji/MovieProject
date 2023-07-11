<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> 예매 전체 보기 </h1>
	<hr>
	<table border="1" >
		<tr>
			<th>book_id</th>
      		<th>mo_code</th>
      		<th>m_id</th>
      		<th>th_id</th>
      		<th>t_id</th>
      		<th>book_cnt</th>
      		<th>price</th>
      		<th>예매</th>
			
		</tr>
		<c:forEach var= "vol" items="${blist}"> 
		<tr>
			<tr>
          		<td><a href="BookAdminSearchone.do?book_id=${vol.book_id}">${vol.book_id}</a></td>
     	  		<td>${vol.mo_code}</td>
          		<td>${vol.m_id}</td>
          		<td>${vol.th_id}</td>
          		<td>${vol.t_id}</td>
          		<td>${vol.book_cnt}</td>
          		<td>${vol.price}</td>
          		<td>${vol.state}</td>
        </tr>
		</c:forEach>
	</table>
	
</body>
</html>