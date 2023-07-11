<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<style>
#Bye-button {
  background-color: #ce000e;
  color: #e2e2e2;
  border: none;
  cursor: pointer;
  padding: 10px 20px;
}

#home-button {
  background-color: #7a7772;
  color: #e2e2e2;
  border: none;
  cursor: pointer;
  padding: 10px 20px;
}
</style>
</head>
<%
String contextPath12 = request.getContextPath();
String deleteUser="http://localhost:8080"+contextPath12+"/userboard/memberDelete.do";
%>
<body>
<div class="container">
  <h2>회원 탈퇴</h2>
  <br>
  <h1>회원탈퇴 전 유의사항을 확인해주세요.<br></h1>
  <br>
  <br>
  유의 사항
  <hr>
  <br>
  -. KG CINEMA 아이디를 탈퇴하시면 서비스 부정 이용 방지를 위하여 제휴사 회원정책에 따라 일정기간 동안 회원 재 가입이 불가합니다.<br>
  -. KG CINEMA 제휴사에서 진행중인 주문 또는 이용중인 서비스가 있을 경우 탈퇴가 불가합니다.<br>
  -. 탈퇴 즉시 개인정보가 삭제되면, 어떤 방법으로도 복원할 수 없습니다. (전자상거래 서비스 등의 거래내역은 전자상거래 등에서의 소비자 보호에 관한 법률에 의거하여 보호됩니다.)<br>
  -. KG CINEMA 아이디를 탈퇴하시면 결제취소가 불가능합니다<br>
  <br>
  <hr>
  <form action="<%=deleteUser %>" method="post">
    <input type="radio" required> 위 유의사항을 모두 확인하였고 회원탈퇴에 동의합니다.<hr>
    <div class="button-group">
      <input type="button" id="home-button" value="취소">
      <input type="submit" id="Bye-button" value="탈퇴">
    </div>
  </form>
</div>
</body>
</html>
