<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%
String contextPath12 = request.getContextPath();
String img=contextPath12+"/img/wavebox.png";
String img2=contextPath12+"/img/pk2.png";
String img3=contextPath12+"/img/warning.png";
String canceldo=contextPath12+"/userboard/Cancel.do";
%>
<meta charset="UTF-8">
<title>예매 목록</title>
<style>
.state {
    color: red;
}

.details {
    display: none;
}
.wave {
border: 30px solid;

margin-left : 200px;
margin-right : 200px;

padding: 5px;

-webkit-border-image: url("<%=img%>") round;
border-image: url("<%=img%>") round;
border-image-slice: 37%;

overflow: hidden;
}

.img {
  float: left;
  margin-right: 10px;
}
.pay {
  margin: 0 10px;
  float:right;
}
.cancel {
  color: red;
}
.warning{
padding-left:40%;
flex-direction:column;
}

</style>
</head>
<body>
<h1> 예매 목록</h1>
<hr>
<c:if test="${empty barray}">
<div class="warning">
	<img src="<%=img3%>" width="100px" height="100px">
    <h1>예매 내역이 없습니다.</h1>
</div>
</c:if>
<c:forEach var="i" items="${barray}">
    <div class="show-details" onclick="toggleDetails(${i.book_id})">
        ${i.datetime} &nbsp;&nbsp;&nbsp;
        예매번호: ${i.book_id} &nbsp;&nbsp;
        ${i.mo_name}&nbsp; 
        ${i.price}원
        <div class="state">[ 결제 완료 ]</div>
        <br>
        <div class="details details-${i.book_id}">
           <div class="wave">
		
			<div class="img">
			<img src="${i.post}" width="150" height="200">
			</div>
			
			<div class="bookinfo">
			상영일시	&nbsp&nbsp&nbsp ${i.t_date} | ${i.t_stime} ~ ${i.t_etime}<br>
			상영관　	&nbsp&nbsp&nbsp ${i.th_name} ${i.scr_id} 관<br>
			관람인원	&nbsp&nbsp&nbsp ${i.book_cnt} 명<br>
			좌석　　	&nbsp&nbsp&nbsp ${i.seats}<br>
			<hr>
			결제 일시 &nbsp&nbsp&nbsp ${i.datetime}
			<hr>
			</div>
			<div class="pay">
				총 결제금액 <h2> ${i.price} 원</h2>
			</div>
			
			<!-- 금액 -->
			<div style="clear:both">
			<hr><form method="post" action="<%=canceldo%>">
  <input type="hidden" value="${i.t_id}" name="t_id">
  <input type="hidden" value="${i.book_id}" name="book_id">
  <input type="submit" value="취소/환불" onclick="return confirm('정말로 취소하시겠습니까?');">
</form>

			</div>
		</div>
        </div>
    </div>
</c:forEach>
<br><br><br><br><br><br><br><br><br><br>
<div>
<img src="<%=img2%>"> 유의사항
<hr>
<p class="cancel">환불 안내<br>
온라인 예매 내역 취소는 상영 시작 20분 전까지 온라인에서 가능합니다.<br>
상영시작 20분전 이후 부터는 영화관 현장에서만 취소 가능합니다.<br></p>
<h3>신용카드</h3>
결제 후 3일 이내 취소 시 승인 취소 가능합니다.<br>
3일 이후 예매 취소 시 영업일 기준 3일 ~ 7일 이내 카드사에서 환불됩니다.<br>
<h3>체크카드</h3>
결제 후 3일 이내 취소 시 당일 카드사에서 환불 처리됩니다.<br>
3일 이후 예매 취소 시 카드사에 따라 3일 ~ 10일 카드사에서 환불됩니다.<br>
</div>
<script>
// 초기 상태 설정
document.addEventListener("DOMContentLoaded", function() {
    var detailsElements = document.querySelectorAll(".details");
    detailsElements.forEach(function(detailsElement) {
        detailsElement.style.display = "none";
    });
});

function toggleDetails(bookId) {
    var detailsElement = document.querySelector(".details-" + bookId);
    if (detailsElement.style.display === "none") {
        detailsElement.style.display = "block";
    } else {
        detailsElement.style.display = "none";
    }
}
</script>

</body>
</html>
