	<%@ page language="java" contentType="text/html; charset=UTF-8"
	    pageEncoding="UTF-8"%>
	<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">

<link rel="stylesheet" href="../css/header_style.css">
	<script src="js/jquery-3.7.0.min.js"></script>
	<script src="js/seat_script.js"></script> 
<style>
	/* 기본적으로 숨김 */
	ul ul { 
		display: none;
	}

	ul li:hover > ul {
		display: inherit;
	}

	/* 스타일 제거 */
	ul {
		list-style-type: none;
		margin: 0;
		padding: 0;
	}
	/* 위치 */
	ul li {
		position: relative;
	}
	/* 링크 스타일 */
	ul li a {
		display: block;
		text-decoration: none;
		color: #000;
	}
	/* 항목 스타일 */
	ul ul li {
		width: 110px;
		float: none;
		display: list-item;
		position: relative;
	}
	/* 서브메뉴 스타일 */
	ul ul ul li {
		position: relative;
		top: -100px;
		left:500px;
	}
	/* 아이콘 추가 */
	li > a:after {
		content: ' ▼';
	}

	li > a:only-child:after {
		content: '';
	}
	/* 헤더 스타일 */
	header {
    display: flex;
    justify-content: center;
    align-items: center;
   
}
/* 홀딩스 로고 스타일 */
header .cinema {
    font-size: 24px;
    padding-right: 40px;
}
</style>

<% String url = request.getServletPath();

String contextPath = request.getContextPath();
String redirectUrl = "http://localhost:8080" + contextPath ;

String redirectUrl1 = "http://localhost:8080" + contextPath + "/FootService" ;


%> 


	</head>
	<body>
	
	<header>																						
		<a href="<%= redirectUrl %>/main.do" class="cinema"><span>KG </span> HOLDINGS</a>
	<div>
	<ul>
		<li><a href="<%= redirectUrl1 %>/intro.jsp">회사소개</a>
			<ul>
				
	 			<li><a href="<%= redirectUrl1 %>/gaeyo.jsp">회사개요</a></li>
				<li><a href="<%= redirectUrl1 %>/insamal.jsp">인사말</a></li>
				<li><a href="<%= redirectUrl1 %>/osineungil.jsp">찾아오시는길</a></li>
			</ul>
		</li>
	</ul>
	
	
	</div>
	</header>
	</body>
	</html>