<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="css/header_style.css">
<script src="js/jquery-3.7.0.min.js"></script>
<% /* String url = request.getServletPath(); */
String contextPath = request.getContextPath();
String redirectUrl = "http://localhost:8080" + contextPath + "/Cinema/" ;
String contextPath1 = request.getContextPath();
String redirectbook = contextPath + "/selbook.do";
String redirectUrl3 = "http://localhost:8080" + contextPath ;
String redirectsang = contextPath + "/sang.do";
String mypage= contextPath + "/userboard/getMembertoMypage.do";
String redirectborad= contextPath + "/userboard/getUserBoard.do";
String redirectlogout = contextPath +"/logout.do";
String redirectadmin= contextPath + "/admin/admin.jsp";
String redirectjoin= contextPath + "/joinForm.jsp";
String redirectlogin= contextPath + "/login.do";
%> 
<!-- <script src="js/cinema.js"></script> -->
<script >
document.addEventListener('DOMContentLoaded', function() {
    var loginBtn = document.querySelector('#login-btn .btn');
    var myPageBtn = document.querySelector('#mypage-button');
    var logoutBtn = document.querySelector('#logout-btn');
    var loginForm = document.querySelector('.login-form');
	var adminPageBtn=document.querySelector('#adminPageBtn');
    if (loginBtn) {
        loginBtn.addEventListener('click', function() {
            loginForm.classList.toggle('active');
        });
    }

    if (myPageBtn) {
        myPageBtn.addEventListener('click', function(event) {
            event.preventDefault(); // 기본 동작 방지
            window.location.href = '<%=mypage%>';
        });
    }
    if (logoutBtn) {
        myPageBtn.addEventListener('click', function(event) {
            event.preventDefault(); // 기본 동작 방지
            loginForm.classList.remove('active');  
        });
    }
    if (adminPageBtn) {
        myPageBtn.addEventListener('click', function(event) {
            event.preventDefault(); // 기본 동작 방지
            loginForm.classList.remove('active');  
        });
    }

    var closeLogin = document.querySelector('#close-login-form');
    if (closeLogin) {
        closeLogin.addEventListener('click', function() {
            loginForm.classList.remove('active');
        });
    }
});

</script> 
<%
if (request.getAttribute("error") != null) {
    String errorMessage = "아이디 또는 비밀번호가 일치하지 않습니다.";
    %>
    <script>
        alert("<%=errorMessage%>");
    </script>
    <%} String id = (String) session.getAttribute("id");%>
<title>KG CINEMA</title>
</head>
<body>
<header>
	<a href="<%=redirectUrl3 %>/main.do" class="cinema"><span>KG</span> CINEMA</a>
	<!-- <input type="checkbox" id = "menu-bar">
	<label for="menu-bar">Menu</label>	 -->
	<nav class ="navbar">
		<ul> 
			<li><a href="#">영화</a>
				<ul>
					<li><a href="<%= redirectsang %>">현재상영작</a></li>
				</ul>
			</li>			 
			<li><a href="#">예매</a>
				<ul>
					<li><a href="<%= redirectbook %>">예매하기</a></li>
					<li><a href="#">상영시간표</a></li>
				</ul>	
			</li>			
			<li><a href="#">상영관</a>
				<ul>
					<li><a href="#">서울</a>
						<ul>
								<li><a href="<%= redirectUrl %>Gangnam.jsp">강남</a></li>
								<li><a href="<%= redirectUrl %>Yeongdeungpo.jsp">영등포</a></li>
								<li><a href="<%= redirectUrl %>Geondae.jsp">건대</a></li>
								<li><a href="<%= redirectUrl %>Hanam.jsp">하남</a></li>
						</ul>
					</li>
				</ul>
			</li>
			<li><a href="<%=redirectborad %>">게시판</a>		
			</li>
			
		</ul>
		
	</nav>
	<div id = "login-btn">
	<%
		// 세션에 ID 값이 존재하는 경우 (로그인 상태)
		
		if("admin".equals(id)){
		%>
		<table class="button-container">
		<tr>
		
			<td>
			<form action="<%=redirectadmin %>" method="POST">
    		<button class="btn" id="adminPageBtn" type="submit">관리자 페이지</button>
  			</form>
  			</td>
		<td>
		<form action="<%=redirectlogout %>" method="POST">
			<button class="btn" id="logout-btn" type="submit" >Logout</button>
		</form>
		</td>
			
	</tr>
	</table>
			
		<%} else
		if (id != null) {
		%>
		<table class="button-container">
		<tr>
		
			<td>
			<form action="<%=mypage %>" method="POST">
    		<button class="btn" id="mypage-button" type="submit">마이페이지</button>
  			</form>
  			</td>
		<td>
		<form action="<%=redirectlogout %>" method="POST">
			<button class="btn" id="logout-btn" type="submit" >Logout</button>
		</form>
		</td>
			
	</tr>
	</table>
		
		
		<% 
		} else { // 세션에 ID 값이 존재하지 않는 경우 (비로그인 상태)
		%>
		<button class="btn" id="login-button">Login</button>
		<% 
		}
		%>
		
	</div>
	</header>
	<div class="login-form" id="login-form">
	
			<span class="#" id ="close-login-form">x</span>	
		<form action="<%=redirectlogin %>" method="post">
			<h3>login page</h3>
			<input type="text" name="id" placeholder="id" class="box">
			<input type="password" name="pw" placeholder="password" class="box">
			<p>비밀번호찾기 <a href="#">click here</a></p>
			<input type="submit" value="login now" class="btn"id="login-now">
			<p>회원이 아니라면 -><a href="<%=redirectjoin%>"id="join-form">join</a></p>			
		</form>
	</div>
	
 
</body>
</html>