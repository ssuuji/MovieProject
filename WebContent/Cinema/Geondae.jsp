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
<script src="../js/jquery-3.7.0.min.js"></script>
<script src="../js/seat_script.js"></script> 

<script>
//띄워주는 이벤트이름
window.addEventListener('DOMContentLoaded', function() {
    Mtime(); // 페이지가 로드될 때 Mtime() 함수를 실행하여 내용을 표시
});			

    function Mtime() {
      var movieshow = document.getElementById("movieshow");
/*       movieshow.innerHTML = "상영 시간표(불러올준비중...)"; // 상영 시간표 데이터를 가져와서 설정 */
      
   // Ajax 요청 생성
	  var xhr = new XMLHttpRequest();
	  xhr.onreadystatechange = function() {
	    if (xhr.readyState === 4 && xhr.status === 200) {
	      // 요청이 성공하면 가져온 데이터를 movieshow 요소에 할당
	      movieshow.innerHTML = xhr.responseText;
	    }
	  };
	  
	  // GET 방식으로 'service/price.jsp' 파일 요청
	  xhr.open("GET", "../service/time.jsp", true);
	  xhr.send();
    }

    

 function MPrice() {
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
	  xhr.open("GET", "../service/price.jsp", true);
	  xhr.send();
	}
 
 
	  	//지도보기 팝업 열기
	  	function MapPopup() {
	        window.open('../service/Gdmap.jsp', '영화관오시는길', 'width=430,height=500 ');
	    }  
	    // 주차안내 팝업 열기
	    function PkPopup() {
	        window.open('../service/GdParking.jsp', '주차안내', 'width=600,height=700');
	    }
	    // 대중교통 안내
	    function BMWPopup() {
	    	window.open('../service/GdBMW.jsp','대중교통안내','width=800,height=650');							
		} 
    
    
</script>

</head>
<body>
<header>
<%@ include file="../header.jsp" %>
</header>
<section>
 
<table border="0" id = gangtab width="500" height="300">
<tr>
<td id="gr1" >건대</td>
<!-- 상영관 개수 좌석 주소는 db에서 불러오기 -->
<tr id= "gd1">
<td>ㆍ총 상영관 수 3개관</td><td>ㆍ총 좌석수 150석</td>
</tr>
<tr>
<td colspan="2">ㆍ서울 광진구 능동로 92 </td>
</tr>
<tr >
<td colspan="2">

    <button class="mbtn1" onclick="BMWPopup()"> <img src="../img/bnt_1.png"> 대중교통안내</button>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <button class="mbtn1" onclick="PkPopup()"> <img src="../img/bnt_3.png"> 주차안내</button>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <button class="mbtn1" onclick="MapPopup()"> <img src="../img/bnt_2.png"> 지도보기</button>
    <br>

</td>
</tr>
</table>	
<br><br><br><br>

<table border="0" width="500" id = gangtab>
<tr>
<th><button class="mbtn2" onclick="Mtime()">상영 시간표 보기</button></th>
<th><button class="mbtn2" onclick="MPrice()">요금 안내 보기</button></th>
</tr>
<tr>
<td rowspan="2" colspan="2">
  
  <div id="movieshow"></div>

</td>
</tr>
</table>
</section>

<footer>
	<%@ include file="../footer.jsp" %>
</footer>
</body>
</html>