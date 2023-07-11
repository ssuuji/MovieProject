<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화상세정보</title>
<style>

section h1{
padding-left: 8%;
padding-top: 8%;
}
section table span {
  padding: 20px;
}

section table .rank {
  padding: 20px;
}

section table .name {
  font-style: inherit;
  font-weight: bold;
  font-size: 25px;
}
section table .acc1 {
padding-left : 1px;
  font-style: inherit;
  font-weight: bold;
  font-size: 20px;
}

section table tr td .img1{
width: 300px;
height: 400px;
}

section table span ul li ul {
  display: none;
}

/* 추가된 스타일 */
section table span ul li ul.visible {
  display: block;
  margin: 10px 0;
  padding: 0;
}

section table span ul li ul.visible li {
  list-style: none;
  margin: 10px 0;
}

section table span .toggle-button {
  cursor: pointer;
  color: blue;
  text-decoration: underline;
}

section table .btn21{
padding-left: 40%;
}

section table .btn22{

  background: rgba(0, 133, 40, 1);
 
  border: none;
   padding: 10px 40px; 
   font-size: 22px;
   color: white;
   font-weight: bold;
   font-style: inherit;
   border-radius: 20px;
   border:none;
  cursor: pointer; 
}
section table .btn22:hover{
  background: rgba(0, 200, 10,1);
cursor: pointer; 
}


.age {
    font-weight: bold;
    font-size: 18px;
    color: white; /* 흰색으로 설정 */
    padding: 5px 10px; /* 상자 크기를 조정 */
    display: inline-block; /* 인라인 블록 요소로 설정하여 텍스트 영역만 차지하도록 함 */
    border-radius: 5px; /* 상자의 모서리를 둥글게 설정 */
  }

  .age-green {
    background-color: green;  /* 전체이용가 */
  }

 .age-gold {
    background-color: gold; /* 12세이용가 */
  }
  
  .age-orange {
    background-color: #CE8200;  /* 15세이용가 */
  }

  .age-red {
    background-color: red;  /* 청소년 관람불가 */
  }
  
 
</style>




<script>
function toggleInfo() {
  var info1 = document.getElementById("info");
  info1.classList.toggle("visible");
  
  var toggleButton = document.getElementById("toggle-button");
  if (info1.classList.contains("visible")) {
    toggleButton.textContent = "접기 ▲";
  } else {
    toggleButton.textContent = "펼치기 ▼";
  }
}

// 페이지 로드 시 자동으로 줄거리 숨기기
window.addEventListener("DOMContentLoaded", function() {
  var info1 = document.getElementById("info");
  info1.classList.remove("visible");
});
</script>

<script src="js/jquery-3.7.0.min.js"></script>
<script src="js/seat_script.js"></script> 
<link rel="stylesheet" href="css/main.css"> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>
   
    <header><%@ include file="header.jsp" %></header>
<%


request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");

String age = request.getParameter("age");   /* age 변수선언 */

%>
  <section>
    
  <h1> </h1>
  <table border="0" width="1200" height='400' align="center">
  
    <tr>
    <td rowspan="6" width="250">
        <span class="img"> <img class= img1 src="${param.post}"></span> <!-- 포스터 -->
    </td>
    </tr>
       <tr><td>      <!-- age가 옆에거랑 같으면? age-gold 다  -->                                                                <!-- 아무것도없음 초록 -->
<span class="age <%= age.equals("12세관람가") ? "age-gold" : age.equals("15세관람가") ? "age-orange" : (age.equals("18세관람가(청소년관람불가)") ? "age-red" : "age-green") %>">
  관람등급 : <%= age %>
</span>

       <span class="name">${param.name}</span><br>  
       </td></tr>
       <tr><td>
       <span class="rank">박스오피스 : ${param.rank}위</span>
       <span class="Acc">누적관객수 : <span class="acc1">${param.audiAcc}명</span></span><br>
       </td></tr>
        <tr><td>
      <span class="type">장르 : ${param.type}</span>
     <span class="open"> 개봉일 : ${param.open}</span>
       <span class="run">런타임 : ${param.run}분</span><br> 
       </td></tr>
      <tr><td>
      <span class="dirname">감독 : ${param.dirname}</span>
      <span class="btn21"> <button class="btn22" onclick="bookT()" >예매하기</button></span>
       </td></tr>
       <tr><td>
     <span class="actname">출연 : ${param.actname} </span>
       </td></tr>


   </table>
   
   <table border="0" width="1000" height="200" align="center">
      <tr><td colspan="2">
<span class="info">
          <ul>
            <li>줄거리
              <ul id="info"> <!-- 초기에는 숨겨놓음 -->
                <li id="info">${param.info}</li>
              </ul> 
              <span class="toggle-button" id="toggle-button" onclick="toggleInfo()">펼치기 ▼</span> <!-- 펼치기/접기 버튼 -->
            </li>
          </ul> 
        </span>
 
       </td></tr>
   
   </table>
   </section>
   
   <script>
function bookT() {
  window.location.href = "selbook1.do?name=${param.name}";
}
var str = "${param.info}";
var slicedStr = str.slice(4);
var outputElement = document.getElementById("info");
outputElement.innerHTML = slicedStr;
</script>
   
     <footer><%@ include file="footer.jsp" %>
  </footer>
</body>
</html>