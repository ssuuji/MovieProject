<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script>
  document.addEventListener('DOMContentLoaded', function() {
    var ss = '<%= request.getAttribute("ss") %>';
    if (ss !== "null") {
      alert('수정되었습니다!');
    }
  });
</script>
<style>
table{margin: auto;}
h1{text-align: center;}
section{margin-top: 150px;}
</style>
<% 
String contextPath12 = request.getContextPath();
String redirectmso= contextPath12 + "/userboard/memberSearchone.do";
String redirectmain= "http://localhost:8080" + contextPath12 + "/index.jsp";
String redirecthead = "http://localhost:8080" + contextPath12 + "/css/header_style.css";

String redirectfoot = "http://localhost:8080" + contextPath12 + "/css/footer.css";
String redirectjquery = "http://localhost:8080" + contextPath12 + "/js/jquery-3.7.0.min.js";
String redirectjseat = "http://localhost:8080" + contextPath12 + "/js/seat_script.js";

String infodo = "http://localhost:8080" + contextPath12 + "/userboard/BookInfo.do";
String infoCalceldo = "http://localhost:8080"+contextPath12+"/userboard/BookInfoCancel.do";
String infoMy = "http://localhost:8080"+contextPath12+"/userboard/MemberInfoMy.do";
String deleteUser = "http://localhost:8080"+contextPath12+"/userboard/deleteUser.jsp";
String myBoard = "http://localhost:8080"+contextPath12+"/userboard/Myboard.do";
%> 

<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<%=redirecthead%>">
<script src="<%=redirectjquery%>"></script>
<script src="<%=redirectjseat%>"></script> 
<link rel="stylesheet" href="mypage.css"> 
<link rel="stylesheet" href="<%=redirectmain%>"> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="stylesheet" href="<%=redirectfoot%>"> 

</head>
<body>
<header>
<%@ include file="/header.jsp" %>
</header>
<style>
	h1{padding-top:200px;}
</style>
<h1>${mvo.m_name}님 반갑습니다!</h1>
<div id="container">
    <div id="sidebar">
      <h5>KG CINEMA MY PAGE</h5>
      <h3>마이페이지</h3>
      <hr>
      <ul>
        
        <li class="submenu">
          <a href="#" onclick="toggleSubMenu('submenu1')">결제 내역</a>
          <ul id="submenu1">
            <li><a href="#" onclick="loadPage('<%=infodo%>')">예매내역</a></li>
            <li><a href="#" onclick="loadPage('<%=infoCalceldo%>')">취소 / 환불</a></li>
          </ul>
        </li>
       
       
		<li class="submenu">
          <a href="#" onclick="toggleSubMenu('submenu2')">MY 활동</a>
          <ul id="submenu2">
            <li><a href="#" onclick="loadPage('<%=myBoard%>')">작성한 게시글</a></li>
            <li><a href="#" onclick="alert('현재 서비스 준비중입니다.')">작성한 리뷰</a></li>
          </ul>
        </li>
        
        <li class="submenu">
          <a href="#" onclick="toggleSubMenu('submenu3')">MY 정보 관리</a>
          <ul id="submenu3">
            <li><a href="#" onclick="loadPage('<%=infoMy %>')">회원 정보</a></li>
            <li><a href="#" onclick="loadPage('<%=deleteUser%>')">회원 탈퇴</a></li>
          </ul>
        </li>
        
      
      </ul>
    </div>
     <div id="content">
      <iframe id="pageFrame" src=""></iframe>
    </div>
</div>

 <script>
    function loadPage(url) {
      document.getElementById("pageFrame").src = url;
    }
    
    function toggleSubMenu(submenuId) {
      var submenu = document.getElementById(submenuId);
      if (submenu.style.display === 'block') {
        submenu.style.display = 'none';
      } else {
        submenu.style.display = 'block';
      }
    }
    
    function goToMain() {
        window.location.href = "<%=redirectmain%>";
      }
    window.onload = function() {
        loadPage('<%=infodo%>');
        toggleSubMenu('submenu1');
    }
  </script>
  <br><br><br><br>
  <footer>
  <%@ include file="/footer.jsp" %>
  </footer>
</body>
</html>