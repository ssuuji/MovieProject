<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<link rel="stylesheet" href="../css/header_1.css">
<link rel="stylesheet" href="../mov.css">
<link rel="stylesheet" href="../css/footer.css">

<style>


section{
padding-top: 150px;
padding-left: 20%;

}
footer{
padding-top: 50px;
}
th{
background-color:  silver;
}

hr{
width: 1000px;

border-width:5px;
border-color: orange;
}
td{
padding-left: 5px;
}

@media screen and (max-width: 1400px) {
  section {
    padding-left: calc(10% + ((100vw - 1200px) / 2));
  }
}

@media screen and (max-width: 1000px) {
  section {
    padding-left: 5%;
  }
}
</style>
</head>
<body>
<header>
<%@include file="header1.jsp" %>
</header>

<section>
<h1>회사개요</h1>
<br>
<table border="1" align="center" height=300" width="1000">
<tr>
<th width="120">회사명</th><td width="380">케이지홀딩스(주)</td><th width="120">주업종</th><td width="380">영화상영관</td>
</tr>
<tr>
<th>대표</th><td>스티븐 킴</td><th>설립일</th><td>2000년 6월 13일</td>
</tr>
<tr>
<th height ="80" >사업자등록번호</th><td>123-456-7890</td><th>통신판매업 <br>등록번호</th><td>제 4124호</td>
</tr>
<tr>
<th>주소</th><td>서울특별시 종로구 돈화문로 26 4층 403호</td><th>홈페이지</th><td>www.kgholdings.com</td>
</tr>
</table>
<br><br>


<h2>Vision</h2><br>
<hr><br>

컬러라이프를 이끄는 기업
한국을 나아가 전 세계의 문화 및 트렌드를 선도하는 기업으로 도약하겠습니다.
<br><br>
KG시네마는 참신한 아이디어와 차별화가 가능한 다각적인 시도를 통해
MZ세대가 좋아할 만한 상품과 고객 경험을 제공할 수 있는<br> 
서비스를 지속적으로 제공하겠습니다.
<br><br>
 국내를 넘어 글로벌을 지향하며 우리만의 이야기를 담은
IP를 바탕으로 영화, 드라마, 공연의 다양한 콘텐츠를 만들어 나갈 것 입니다.
</section>

<footer>
<%@include file="../footer.jsp" %>
</footer>

</body>
</html>