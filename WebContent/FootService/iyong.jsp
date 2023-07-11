<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용약관</title>
<link rel="stylesheet" href="../css/header_style.css">
<link rel="stylesheet" href="../css/mov.css">
<link rel="stylesheet" href="../css/footer.css">
<script>
window.addEventListener('DOMContentLoaded', function() {
	Fuser(); // 페이지가 로드될 때 Fuser() 함수를 실행하여 내용을 표시
});			

    function Fuser() {
      var movieshow = document.getElementById("movieshow");

      
   // Ajax 요청 생성
	  var xhr = new XMLHttpRequest();
	  xhr.onreadystatechange = function() {
	    if (xhr.readyState === 4 && xhr.status === 200) {
	      // 요청이 성공하면 가져온 데이터를 movieshow 요소에 할당
	      movieshow.innerHTML = xhr.responseText;
	    }
	  };
	  
	  // GET 방식으로 'service/price.jsp' 파일 요청
	  xhr.open("GET", "iyongKg.jsp", true);
	  xhr.send();		
    }


 function Fclub() {
	  var movieshow = document.getElementById("movieshow");
	  
	  // Ajax 요청 생성
	  var xhr = new XMLHttpRequest();
	  xhr.onreadystatechange = function() {
	    if (xhr.readyState === 4 && xhr.status === 200) {
	      // 요청이 성공하면 가져온 데이터를 movieshow 요소에 할당
	      movieshow.innerHTML = xhr.responseText;
	    }
	  };
	  
	  // GET 방식으로 'service/price.jsp' 파일 요청
	  xhr.open("GET", "iyongKgclub.jsp", true);
	  xhr.send();
	}



</script>
<style>
section{
padding-top: 150px;
}
footer{
padding-top: 56px;
}

</style>


</head>
<body>
<header>
<%@include file="header1.jsp" %>
</header>

<section>


<table border="0" width="900" id = gangtab>

<tr>
<th width="450"><button class="mbtn2" onclick="Fuser()">KG 시네마</button></th>
<th><button class="mbtn2" onclick="Fclub()">KG 클럽</button></th>
</tr>
<tr>
<td rowspan="2" colspan="2">
  
	  <div id="movieshow"></div>

</td>
</tr>
</table>
</section>

<footer>
<%@include file="../footer.jsp" %>

</footer>
</body>
</html>