<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<%
	String contextPath12 ="http://localhost:8080"+ request.getContextPath();
	String updatedo=contextPath12+"/userboard/MyUpdate.do"; %>
<head>
<meta charset="UTF-8">
<title>회원 정보 변경</title>



<style>
.df{
	display:flex;
}
.hr1{
	height: 2px;
	background-color:gray;
}

hr{
	background-color:#F0F0F0;
}

input[type=radio] {
       accent-color:red;
}

input[type=checkbox], input[type=radio] {
    accent-color:red;
}

/* 버튼 */

    .cancel-btn {
        background-color: #000000;
        color: #ffffff;
        border: none;
        padding: 10px 20px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        cursor: pointer;
    }

    .next-btn {
        background-color: #ff0000;
        color: #ffffff;
        border: none;
        padding: 10px 20px;
        text-align: center;
        text-decoration: none;
        display: inline-block;
        font-size: 16px;
        cursor: pointer;
    }
</style>




</head>
<body>
<h1>
회원정보변경<br><br>
회원정보를<br>
정확하게 입력해주세요.
</h1>


<form action="<%=updatedo%>" method=post>
<br><br>

	<!-- 회원정보 -->
	<div class="df">
		회원정보입력&nbsp;&nbsp;&nbsp;
		<div style="color:red;">*는 필수입력항목입니다.</div>
	</div>
	
	<hr class="hr1"><br>
	
	<!-- 이름 -->
	<div class="df">
	<div style="color:red;">*&nbsp;</div>
	이름&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<input type=text readonly name="name" value="${mv.m_name}"><br>
	</div><br><hr><br>
	
	<!-- 아이디 -->
	<div class="df">
	<div style="color:red;">*&nbsp;</div>
	아이디&nbsp;&nbsp;&nbsp;
	<input type=text readonly name="id" value="${mv.m_id}"><br>
	</div><br><hr><br>

	<!--  비밀번호 -->
	<div class="df">
		&nbsp;&nbsp;&nbsp;비밀번호<img src="">&nbsp; ******* &nbsp;&nbsp;&nbsp;
		<input type=hidden name="pw" value="${mv.m_pw}"><br>
		<!-- 비밀번호 변경버튼 -->
		<input type="button" id="myButton" value="변경하기" onclick="toggleDiv()"><br>	
	</div>
		<div id="myDiv" style="display: none;">
		<br>
			&nbsp;&nbsp;&nbsp;
  			<input type="password" name="pw1" placeholder="비밀번호를 입력해주세요."><br>
  				<div style="color:red;">
  				&nbsp;&nbsp;&nbsp;&nbsp;8~15자리의 영문/숫자/특수문자를 함께 입력해주세요.<br><br>
  				</div>
  			&nbsp;&nbsp;&nbsp;
  			<input type="password" name="pw2" placeholder="입력하신 비밀번호를 다시한번 입력해주세요."><br>
		</div><br><hr><br>

	<!-- 휴대폰 번호 -->	
	<div class="df">
	<div style="color:red;">*&nbsp;</div>
	휴대폰 번호&nbsp;&nbsp;&nbsp;
	<input type=text name="tel" value="${mv.m_tel}"><br>
	</div><br><hr><br>	
		
	<!-- 이메일 주소 -->	
	<div class="df">
	<div style="color:red;">*&nbsp;</div>
	이메일 주소&nbsp;&nbsp;&nbsp;
	<input type=text name="email" value="${mv.m_email}"><br>
	</div><br><hr><br>	



<br><br><br>


	<!--  유효기간  -->
	<div class="df">
	<div style="color:red;">*&nbsp;</div>
	개인정보 유효기간
	</div>
	<hr class="hr1">
		<input type="radio" name="expiration" value="1year" id="1year">
 		<label for="1year">1년</label><br><br>
  		<input type="radio" name="expiration" value="termination" id="termination">
 	 	<label for="termination">탈퇴시 파기</label><br>
 	 <hr>
  	- 개인정보 유효기간 경과 이후 개인정보를 분리 저장/관리 또는 파기합니다.<br>



<br><br><br>


	마케팅 정보 수신동의&nbsp;&nbsp;&nbsp;
	<!-- 전체 동의 -->
	<input type="checkbox" id="allCheckbox" onchange="toggleAll()">
  	<label for="allCheckbox">전체동의</label>
  		<hr class="hr1">
  	KG CINEMA<br><br>
  	<input type="checkbox" name="communication" value="email" id="emailCheckbox">
  	<label for="emailCheckbox">E-MAIL</label>
  	<input type="checkbox" name="communication" value="sms" id="smsCheckbox">
  	<label for="smsCheckbox">SMS</label><br>
  	
  	<br>
  	<input type="reset" value="취소" class="cancel-btn">
  	<input type="submit" value="다음" class="next-btn">
</form>





<script>

//비밀번호 버튼
function toggleDiv() {
  var div = document.getElementById("myDiv");
  var button = document.getElementById("myButton");
  
  if (div.style.display === "none") {
    div.style.display = "block";
    button.value = "취소";
  } else {
    div.style.display = "none";
    button.value = "변경하기";
  }
}

//전체동의 버튼
function toggleAll() {
  var emailCheckbox = document.getElementById("emailCheckbox");
  var smsCheckbox = document.getElementById("smsCheckbox");
  var allCheckbox = document.getElementById("allCheckbox");
  
  emailCheckbox.checked = allCheckbox.checked;
  smsCheckbox.checked = allCheckbox.checked;
}
</script>
</body>
</html>