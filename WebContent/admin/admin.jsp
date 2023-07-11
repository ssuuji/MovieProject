<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<% /* String url = request.getServletPath(); */
// 어드민계정으로 접근하지 않았을 경우
String contextPath123 = request.getContextPath();
String redirectmain= "http://localhost:8080" + contextPath123 + "/index.jsp";
HttpSession session1 = request.getSession();
if (session1.getAttribute("admin") == null || !session1.getAttribute("admin").equals("admin")) {
    String alertMessage = "잘못된 접근입니다.";
    String redirectURL = redirectmain; // 홈페이지로 이동할 URL
    String script = "<script>alert('" + alertMessage + "'); window.location.href='" + redirectURL + "';</script>";
    response.getWriter().println(script);
    return;
}
String redirectcss = "http://localhost:8080" + contextPath123 + "/admin/admin.css";
String redirectout = "http://localhost:8080" + contextPath123 + "/logout.do";
String redirectmgl= "http://localhost:8080" + contextPath123 + "/admin/adminMovie/MovieGetAll.do";
String redirectbor= "http://localhost:8080" + contextPath123 + "/userboard/getAdminBoard.do";
String redirectadminbor= "http://localhost:8080" + contextPath123 + "/admin/adminBoard/getAdminOnlyBoard.do";
String redirectadminbook= "http://localhost:8080" + contextPath123 + "/admin/adminBook/getAllBook.do";
String redirectadminMovieSearch= "http://localhost:8080" + contextPath123 + "/admin/adminMovie/MovieSearch.do";
String redirectadmingetTh= "http://localhost:8080" + contextPath123 + "/admin/getTheater.do";
String redirectadminThGetAll= "http://localhost:8080" + contextPath123 + "/admin/adminTheater/TheaterGetAll.do";
String redirectadminThInsert= "http://localhost:8080" + contextPath123 + "/admin/adminTheater/theInsertForm.jsp";
String redirectadminScgetAll= "http://localhost:8080" + contextPath123 + "/admin/adminScreen/ScreenGetAll.do";
String redirectadminScInsert= "http://localhost:8080" + contextPath123 + "/admin/adminScreen/ScreenInsertForm.jsp";
String redirectadminSt= "http://localhost:8080" + contextPath123 + "/admin/adminStime/getStime.do";
String redirectadminStInsert= "http://localhost:8080" + contextPath123 + "/admin/adminStime/stimeInsertForm.jsp";
String redirectadmingetMem= "http://localhost:8080" + contextPath123 + "/admin/adminMember/getMember.do";
%> 
<link rel="stylesheet" href="<%=redirectcss%>">
  <meta charset="UTF-8">
  <title>관리자 페이지</title>
  <link rel="stylesheet" type="text/css" href="/admin/admin.css">
</head>
<body onload="loadPage('<%=redirectmgl%>')"> 

  <div id="header">
    <div class="logo">KG CINEMA</div>
    <h1>관리자 페이지</h1>
    <div class="right-buttons">
      <button class="logout-button" onclick="logout()">로그아웃</button>
      <button class="main-button" onclick="goToMain()">메인으로</button>
    </div>
  </div>
  
  <div id="container">
    <div id="sidebar">
      <h3>관리자 메뉴</h3>
      <hr>
      <ul>
        
        <li class="submenu">
          <a href="#" onclick="toggleSubMenu('submenu1')">영화 관리</a>
          <ul id="submenu1">
            <li><a href="#" onclick="loadPage('<%=redirectmgl%>')">영화 전체 목록</a></li>
            <li><a href="#" onclick="loadPage('<%=redirectadminMovieSearch%>')">데일리 오피스 박스</a></li>
            <li><a href="#" onclick="alert('준비중입니다.')">영화 리뷰</a></li>

          </ul>
        </li>
       
       
		<li class="submenu">
          <a href="#" onclick="toggleSubMenu('submenu2')">영화관 관리</a>
          <ul id="submenu2">
            <li><a href="#" onclick="loadPage('<%=redirectadminThGetAll%>')">영화관 조회</a></li>
            <li><a href="#" onclick="loadPage('<%=redirectadminThInsert%>')">영화관 추가</a></li>
          </ul>
        </li>
        
        <li class="submenu">
          <a href="#" onclick="toggleSubMenu('submenu3')">상영관</a>
          <ul id="submenu3">
            <li><a href="#" onclick="loadPage('<%=redirectadminScgetAll%>')">상영관 조회</a></li>
            <li><a href="#" onclick="loadPage('<%=redirectadminScInsert%>')">상영관 추가</a></li>
            <li><a href="#" onclick="loadPage('<%=redirectadminSt%>')">상영시간 조회</a></li>
            <li><a href="#" onclick="loadPage('<%=redirectadminStInsert%>')">상영시간 추가</a></li>
          </ul>
        </li>
        
        <li class="submenu">

          <ul id="submenu4">
            <li><a href="#" onclick="loadPage('<%=redirectadmingetMem%>')">회원 조회</a></li>

          </ul>
        </li>
        
        <li class="submenu">
        	<ul id="submenu5">
           		 <li><a href="#" onclick="loadPage('<%=redirectbor%>')">자유게시판</a></li>
           		 </ul>
          	<ul id="submenu5">
           		 <li><a href="#" onclick="loadPage('<%=redirectadminbor%>')">공지 사항</a></li>
          </ul>
        </li>
        
        
         <li class="submenu">
          <ul id="submenu6">
          <li><a href="#" onclick="loadPage('<%=redirectadminbook%>')">예매 내역</a></li>
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
    
    function logout() {
      sessionStorage.removeItem('id');
      alert("로그아웃 되었습니다.");
      window.location.href = "<%=redirectout%>";
    }
    
    function goToMain() {
        window.location.href = "<%=redirectmain%>";
      }
  </script>
</body>
</html>
