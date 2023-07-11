<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회사소개</title>
<link rel="stylesheet" href="../css/header_style.css">
<link rel="stylesheet" href="../mov.css">
<link rel="stylesheet" href="../css/footer.css">

<style>
section{
padding-top: 150px;

}
footer{
padding-top: 50px;
}

 .imgcom{
text-align: center;
position: relative;
}

.imgtext{ 
  position: absolute;
  top:50%;
  left: 50%;
  transform: translate(-50%, -50%);
  color: rgba(255, 255, 255);
  padding: 10px;

}

.imgtext h1 {
  text-align: center;
  margin: 0;
}
</style>
</head>
<body>
<header>
<%@include file="header1.jsp" %>
</header>

<section>
<div class="imgcom">
<img alt="건물그림" src="../img/company.jpg" height="400px" width="1000px">
</div>

 <div class="imgtext">
 <h1>컬쳐라이프를 이끄는 기업<br>
 	Leading Culture-makers,<br>
 		KG HOLDINGS
 </h1>
</div>
  <br><br><br>

<pre align="center"><h2>
컬처라이프를 이끄는 기업
Business Area
마음 속에 언제나 감동으로 남는 기업으로서 항상 여러분에게 특별한 감동을 전해드리겠습니다.

KG 시네마 국내 최고의  체인국내최고의영화제작투자및배급사로서거듭나겠습니다
Creating Shared Values
영화의 행복과 감동을 함께 나눕니다.

어린이/청소년 성장지원, YOUNG Communication, 문화나눔, 임직원 봉사활동 등
KG 시네마의 다양한 소식을 전해드립니다.</h2>
</pre>

</section>



<footer>
<%@include file="../footer.jsp" %>
</footer>
</body>
</html>