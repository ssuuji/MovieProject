<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/footer.css">
</head>
<body>
<%/*  String url = request.getServletPath(); */




String contextPath11 = request.getContextPath();
String redirectUrl22 = "http://localhost:8080" + contextPath11 ;


String redirectUrl33 = "http://localhost:8080" + contextPath11 + "/FootService/" ;

%>  
<footer>
<a href="<%= redirectUrl22 %>/index.jsp" ><span class="sp1">KG</span> &nbsp;<span class="sp2">HOLDINGS</span></a>

<div class= nav>
	<ul > 
		<li><a href="<%= redirectUrl33 %>intro.jsp">회사소개</a></li><li>|</li>
		<li><a href="<%= redirectUrl33 %>iyong.jsp">이용약관</a>	</li><li>|</li>
		<li><a href="#">개인정보처리방침</a></li><li>|</li>
		<li><a href="#">이메일무단수집거부</a></li><li>|</li>
		<li><a href="#">배정기준</a></li><li>|</li>
		<li><a href="#">채용안내</a></li><li>|</li>
		<li><a href="#">사회적책임</a></li>
	</ul>
</div>
<div class="sp3">
서울특별시 종로구 돈화문로 26 4층 403호 1544-8855 (유료)<br>
대표이사 김호진 사업자등록번호 313-87-00979 통신판매업신고번호 제1184호개인정보 보호 책임자 김수지<br>
COPYRIGHT© KG HOLDINGS ALL RIGHT RESERVED.<br>
</div>
</footer>
</body>
</html>