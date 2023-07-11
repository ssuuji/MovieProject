<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="css/header_style.css">

<script src="js/jquery-3.7.0.min.js"></script>
<script src="js/cinema.js"></script>
<body>
	
	<script>
		function ider(divid, erm) {
			document.getElementById(divid).innerHTML = erm;
		}
	</script>
	<%
		if (request.getAttribute("erlen") != null) {
	%>
	<script>
		window.onload = function() {
			ider("idc", "아이디는 4자리 이상이어야 합니다.");
		}
	</script>
	<%
		} if (request.getAttribute("error1") != null) {
	%>
	<script>
		window.onload = function() {
			ider("idc", "사용할 수 없는 아이디입니다.");
		}
	</script>
	<%
		} if(request.getAttribute("error1") == null && request.getAttribute("erlen")== null) {
	%>
	<script>
		window.onload = function() {
			ider("idc", "사용 가능한 아이디입니다.");
		}
	</script>
	<%
		}
	if (request.getAttribute("id") == null) {
	request.setAttribute("id", "");
	%>
	<script>
		window.onload = function() {
			ider("idc", "");
		}
	</script>
	<%
		}
	if (request.getAttribute("erpw") != null) {
	%>
	<script>
		window.onload = function() {
			ider("dpw", "비밀번호는 영문,숫자,특수문자를 모두 포함한 8자리 이상이어야 합니다.");
		}
	</script>
	<%
		} if (request.getAttribute("erpw2") != null) {
	%>
	<script>
		window.onload = function() {
			ider("dpw2", "위의 비밀번호와 일치하지 않습니다.");
		}
	</script>
	<%
		}
	if (request.getAttribute("erid") != null) {
	%>
	<script>
		window.onload = function() {
			ider("idc", "아이디 중복검사를 먼저 해주세요!");
		}
	</script>
	<%
		}
	if (request.getAttribute("m_name") == null) {
	request.setAttribute("m_name", "");
	}
	 if (request.getAttribute("m_tel") == null) {
	request.setAttribute("m_tel", "");
	}
	 if (request.getAttribute("m_email") == null) {
	request.setAttribute("m_email", "");
	}
	String m_id = (String) request.getAttribute("id");
	String m_name = (String) request.getAttribute("m_name");
	String m_tel = (String) request.getAttribute("m_tel");
	String m_email = (String) request.getAttribute("m_email");
	%>



	<script>
		document.addEventListener("DOMContentLoaded", function() {
			document.getElementById("back-btn").addEventListener("click",
					function() {
						history.back();
					});
		});
	</script>

	<header><%@ include file="header.jsp"%></header>
	<div class="join-form " id="active" id="memberjoin">
		<a href="main.do">x</a>
		<form action="idcheck.do" method="post">
			<h3>join</h3>
			<input type="text" placeholder="id" class="box" id="id"
				maxlength="13" name="m_id" required value=<%=m_id%>> <input
				type="submit" class="btn" value="check" id="idck">
			<div id="idc"></div>
		</form>
		<form action="register.do" method="post">
			<input type="hidden" value=<%=m_id%> name="m_id"> <input
				type="password" name="m_pw" placeholder="password" maxlength="15"
				class="box" required value=> <br>
			<div id="dpw"></div>
		 <input type="password" name="m_pw2" placeholder="re-password"
				class="box" required> <br>
			<div id="dpw2"></div> 
			<input type="text" name="m_name" placeholder="name" class="box"
				required value=<%=m_name%>>
				 <input type="text" name="m_tel"
				maxlength="11" placeholder="tel:01012345678" class="box" required
				value=<%=m_tel%>> <input type="text" name="m_email"
				placeholder="email:aaa@com" class="box" required value=<%=m_email%>>
			<input type="submit" value="join" class="btn" id="buttonreg">
			<input type="button" value="back" class="btn" id="back-btn">
		</form>
	</div>
	<% if (request.getAttribute("registered") != null) { %>
<script>
   window.onload = function() { 
     ider("idc","");
     alert("회원가입이 완료되었습니다!");
   }
</script>
<% } %>

</body>
</html>