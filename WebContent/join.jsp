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
<script src="js/seat_script.js"></script> 
<body>


<script>
  document.addEventListener("DOMContentLoaded", function() {
    document.getElementById("back-btn").addEventListener("click", function() {
      history.back();
    });
  });
</script>

<div class="join-form "id="active">
		<a href="index.jsp">x</a>
		<form action="memberJoin.do" method="post">
			<h3>join</h3>
			<input type="text" name="name" placeholder="name" class="box"required>
			<input type="text" placeholder="id" class="box" id="id"
					maxlength="13" name="m_id" check_result="fail" required>
			<input type="button" class="btn"value="check" id="idck"onclick="id_check()">
			<div></div>
			<input type="password" name="m_pw" placeholder="password" class="box"required>
			<input type="password" name="m_pw2" placeholder="re-password" class="box"required>
			<input type="text" name="tel" placeholder="tel:01012345678" class="box"required>
			<input type="text" name="email" placeholder="email:aaa@com" class="box"required>
			<input type="submit" value="join" class="btn">
			<input type="button" value="back" class="btn" id="back-btn">			
		</form>
	</div>

</body>
</html>