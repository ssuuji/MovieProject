<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/header_style.css">
<link rel="stylesheet" href="../css/mov.css">
<link rel="stylesheet" href="../css/footer.css">

<script>

function wiat_pop() {
	  //크기
	  var popupWidth = 400;
	  var popupHeight = 300;
	  // 현재창의 크기 가져옴
	  var screenLeft = window.screenLeft || window.screenX || 0;
	  var screenTop = window.screenTop || window.screenY || 0;
	  var screenWidth = window.innerWidth || document.documentElement.clientWidth || screen.width;
	  var screenHeight = window.innerHeight || document.documentElement.clientHeight || screen.height;
	  //화면중앙에 뜨도록 화면 /2
	  var popupLeft = screenLeft + (screenWidth - popupWidth) / 2;
	  var popupTop = screenTop + (screenHeight - popupHeight) / 2;
	  
	  window.open("../service/wiat_pop.html", "popwin1", "width=450, height=300, top=" + popupTop + ", left=" + popupLeft);
	
	
	
	}
 
//if(winopen==null) 지역이면 인식 못함
</script>
<style>
h2{
font-size: 100px;
}

.a{
padding-bottom: 400px;
}
</style>


</head>
<body onload="wiat_pop();">
<header>
<%@ include file="../header.jsp" %>
</header>
<section>
<br><br>
<h2 align="center">하남 오픈준비중 </h2>

</section>
<div class="a">&nbsp; </div>
<footer>
	<%@ include file="../footer.jsp" %>
</footer>

</body>
</html>