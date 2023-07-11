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
	<h1>예매번호 ${bv.book_id} 정보</h1>
	<form action="BookUpdate.do?book_id=${bv.book_id}" method="post">
    <table border="1">
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
        <tr>
            <td><input value="${bv.book_id}" name="book_id" readonly></td>
            <td><input value="${bv.mo_code}" name="mo_code" readonly></td>
            <td><input value="${bv.m_id}" name="m_id" readonly></td>
            <td><input value="${bv.th_id}" name="th_id" readonly></td>
            <td><input value="${bv.t_id}" name="t_id" readonly></td>
            <td><input value="${bv.book_cnt}" name="book_cnt" readonly></td>
            <td><input value="${bv.price}" name="price" readonly></td>
            <td><input value="${bv.state}" name="state" readonly></td> <!-- 예매 취소 시 state 값을 N으로 설정 -->
        </tr>
        <tr>
            <td colspan="5">
                <input type="submit" value="예매취소">
                
            </td>
        </tr>
    </table>
</form>
			
</body>
</html>