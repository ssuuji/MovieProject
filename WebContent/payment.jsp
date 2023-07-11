<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 페이지</title>
 <style>
/* 사이드바 */

.sidebar {
  width: 200px;
  background-color: #f2f2f2;
  padding: 20px;
  flex-direction: column;
  display: flex;
  flex-direction: column;
  align-items: stretch;
}

.sidebar ul {
  list-style: none;
  padding: 0;
  margin: 0;
  flex-grow: 1;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}

.sidebar li {
  margin-bottom: 10px;
  flex-grow: 1;
  display: flex;
  justify-content: center;
  align-items: center;
}

.sidebar li:last-child {
  margin-bottom: 0;
}

.sidebar li a {
  display: block;
  width: 100%;
  padding: 10px;
  background-color: #f0f0f0;
  color: #333;
  text-decoration: none;
}

.sidebar li.active {
  background-color: #4caf50;
  color: #fff;
}

.side-hr {
  width: 100%; 
  height: 1px;
  background-color: #ccc;
  border: none;
  margin: 10px 0;
}

.container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 20px;
  display: flex; 
  border: 1px solid;
}


.text-container {
  display: flex; 
  justify-content: center; /* 가로 가운데 정렬 */
  align-items: center; /* 세로 가운데 정렬 */
  width: 100%; 
}

.text {
  max-width: 100%; 
  color: #ffffff; 
}

section {
  flex-grow: 1;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: initial;
}

body {
   margin-top: 150px;
}

header {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
}

input[value="결제하기"]{
 background-color: #4caf50;
  color: #fff;
  border: none;
  cursor: pointer;
  padding: 10px 20px;
}

.postimg{
padding-left: 11%;
padding-right: 5%;
height: 400px;
width: 300px;
}
.classj{
font-size: 20px;
font-weight: bold;
}
#submit1{
font-size: 16px;
}

 </style>
</head>
<body>
<h1 align="center">결제 정보</h1>
<%
  request.setCharacterEncoding("UTF-8"); // 요청 파라미터의 인코딩 설정
  response.setCharacterEncoding("UTF-8");
  String movie =  String.valueOf(request.getAttribute("movie"));
  String date = String.valueOf(request.getAttribute("date"));
  String showtime = String.valueOf(request.getAttribute("showtime"));
  String price=String.valueOf(request.getAttribute("price"));
  String theater = String.valueOf(request.getAttribute("theater"));
  String post = String.valueOf(request.getAttribute("post"));
  int t_id = Integer.parseInt(String.valueOf(request.getAttribute("t_id")));
  String[] seats = (String[])request.getAttribute("seats");
  String strSeat = "";
  int bookcnt = Integer.parseInt(String.valueOf(request.getAttribute("bookcnt")));
  for (String seat : seats) {
      strSeat += seat + ",";
  }

  // 마지막에 추가된 쉼표를 제거하기 위해 문자열 길이에서 1을 빼줍니다.
  if (strSeat.length() > 0) {
      strSeat = strSeat.substring(0, strSeat.length() - 1);
  }
  
%>
<div class="container">
   <!-- 사이드바 -->
   <div class="sidebar">
        <ul>
       <li class="status-item">상영시간</li><hr class="side-hr">
         <li class="status-item">인원/좌석</li><hr class="side-hr">
      <li class="status-item active">결제</li><hr class="side-hr">
       <li class="status-item">예매완료</li>
      </ul>
   </div>
   <img class="postimg" src="<%=post%>">
   <section>
<div class="classj">
 영화 : <%= movie %><br>
날짜 : <%= date %><br>
극장 : <%= theater %><br>
상영 시간 :<%= showtime %><br>
선택한 좌석 : <% for (String seat : seats) { %> <%= seat %> <% } %><br>
가격 : <%=price+"원" %><br> <br>
</div>

<!-- 결제 
-->
<form method="POST" action="pay.do">
  <input type="hidden" name="movie" value="<%= movie %>">
  <input type="hidden" name="date" value="<%= date %>">
  <input type="hidden" name="showtime" value="<%= showtime %>">
  <input type="hidden" name="price" value="<%=price %>">
  <input type="hidden" name="theater" value="<%=theater %>">
  <input type="hidden" name="post" value="<%=post %>">
  <input type="hidden" name="bookcnt" value="<%=bookcnt %>">
  <input type="hidden" name="t_id" value="<%=t_id %>">
  <input type="hidden" name="seats" value="<%= seats %>">
  <input type="hidden" name="strSeat" value="<%= strSeat %>">
  <input type="submit" value="결제하기" id ="submit1">
  
</form>


   </section>
</div>
</body>
</html>