<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<title>예매 완료</title>
<style>
body {
 padding: 100px 0 0 0; /* 수정 */
  flex-direction: column;
  justify-content: center;
  height: 100vh;
  flex-grow: 1;
  background-color: #fff !important;
}

.container {
  max-width: 1200px;
  height:95%;
  margin: 0 auto;
  padding: 20px; 
  border: 1px solid;
  display:flex; 
  overflow:auto;
}

/* 사이드바 */
.sidebar {
  width: 200px;
  height: auto;
  background-color: #f2f2f2;
  padding: 20px;
  flex-direction: column;
  display: flex;
  flex-direction: column;
  align-items: stretch;
  
  overflow:auto;
}

.sidebar ul {
  list-style: none;
  padding: 0;
  margin: 0;
  flex-grow: 1;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  
  overflow:auto;
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

/* 결제정보 */
.payinfo {
  flex-grow: 1;
  margin-left: 20px;
}

.paytext{
	margin-left : 200px;
	margin-right : 200px;

	text-align: center;
}

.wave {
border: 30px solid;

margin-left : 200px;
margin-right : 200px;

padding: 5px;

-webkit-border-image: url("img/wavebox.png") round;
border-image: url("img/wavebox.png") round;
border-image-slice: 37%;

overflow: hidden;
}

.img {
  float: left;
  margin-right: 10px;
}

.bookinfo {
  flex: 1 1 auto;

 }
 .bookinfo hr {
  margin: 10px 0;
}

.pay {
  margin: 0 10px;
  float:right;
  
}

/* 주의사항 */
.caution{
	margin-left : 200px;
}

.caution li {
  font-size: 14px;
}

.caution .point {
  color: #D32F2F;
}

/* 버튼 */
.button{
text-align: center;
margin-bottom: 10px;
}
#book-button {
  bottom: 0;
  right: 0;
  background-color: #4caf50;
  color: #fff;
  border: none;
  cursor: pointer;
  padding: 10px 20px;
}
#book-button:hover {
  background-color: #45a049;
}

#home-button {
  bottom: 0;
  right: 0;
  background-color: #444444;
  color: #fff;
  border: none;
  cursor: pointer;
  padding: 10px 20px;
}
#home-button:hover {
  background-color: #A8A8A8;
}
</style>
<% /* String url = request.getServletPath(); */

String contextPath22 = "http://localhost:8080" +request.getContextPath();
String contextPath23 =  contextPath22 + "/main.do";
String Mypage = contextPath22+"/userboard/getMembertoMypage.do";
%> 
</head>
<body>

  <!-- header -->
  <header>
    <%@ include file="header.jsp"%>
  </header>
  
  <div class="container">
    <!-- 사이드바 -->
    <div class="sidebar">
      <ul>
        <li class="status-item">상영시간</li>
        <hr class="side-hr">
        <li class="status-item">인원/좌석</li>
        <hr class="side-hr">
        <li class="status-item">결제</li>
        <hr class="side-hr">
        <li class="status-item active">예매완료</li>
      </ul>
    </div>
    
    <!-- 결제완료 -->
    <div class="payinfo">

	<div class="paytext">
      	<h2>결제 완료</h2>
      	<br>
      	<img src="img/pay.png" width="60" height="60">
		<br>
		${m_name} 회원님, 결제가 성공적으로 완료되었습니다.
		<br><br>
	</div>
	
		<!-- 예매완료 정보 -->
		<div class="wave">
		
			<!-- 영화 포스터 -->
			<div class="img">
			<img src="${post}" width="150" height="200">
			</div>
			
			<!-- 예매 정보 -->
			<div class="bookinfo">
			예매번호	&nbsp&nbsp&nbsp ${book_id}<br>
			<hr>
			상영일시	&nbsp&nbsp&nbsp ${date}<br>
			상영관　	&nbsp&nbsp&nbsp ${thea_scr} 관<br>
			관람인원	&nbsp&nbsp&nbsp ${bookcnt} 명<br>
			좌석　　	&nbsp&nbsp&nbsp ${seat}<br>
			</div>
			
			<!-- 금액 -->
			<div style="clear:both">
			<hr>	
			<div class="pay">
				총 결제금액 <h2> ${price} 원</h2>
			</div>
			</div>
		</div>
		
		<!-- 주의사항 -->
		<div class="caution">
			<br>
			<li class="point">온라인 예매 내역 취소는 상영 시작 20분 전까지 온라인에서 가능합니다.</li>
			<li class="point">상영시작 20분전 이후 부터는 영화관 현장에서만 취소 가능합니다.</li>
			<li>예고편 상영 등 사정에 의해 본 영화 시작이 10여분 정도 차이 날 수 있습니다.</li>
			<li>개인정보 보호 정책에 따라 주민번호로 예매 티켓을 찾을 수 없습니다.<br>꼭 예매번호를 확인해주세요.</li>
			<li>예매한 티켓은 마이페이지 > 예매 내역에서 확인 할 수 있습니다.</li>
			<br>
		</div>
		
		<!-- 버튼 -->
		<div class="button">
			<button id="book-button" onclick="location.href='<%=Mypage %>'">예매 내역</button>
			&nbsp&nbsp&nbsp
			<button id="home-button" onclick="location.href='<%=contextPath23 %>'">홈으로 가기</button>
		</div>
  	</div>
  </div>

</body>
</html>
