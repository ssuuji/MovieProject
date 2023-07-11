<%@page import="java.util.ArrayList"%>
<%@page import="VO.MovieVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.7.0.min.js"></script>
<script src="js/seat_script.js"></script> 
<link rel="stylesheet" href="css/main.css"> 
<link rel="stylesheet" href="css/header_style.css"> 
<link rel="stylesheet" href="css/footer.css"> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<style>
.image-container {
    position: relative;
    display: inline-block;
  }

  .rank {
    position: absolute;
    top: 50px;
    left: 50px;
   font-style:italic;
   font-weight:bold;
    color:  #fff;
    padding: 5px;
    font-size: 35px;
    z-index: 1; /* 순위 텍스트가 이미지 위에 표시되도록 함 */
    text-shadow: 2px 0 #000, 0 -2px #000, -2px 0 #000, 0 -2px #000;
  }

  .image-container img {
    display: block;
  width: 400px;  /* 이미지의 원하는 가로 크기로 수정해주세요 */
    height: 500px;
    padding: 30px;
    padding-top: 40px;
    }
    
.sang1 {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
}

.imgbody{
padding: 9%;
}

.sangh1{
padding-left: 7%
}
  
</style>


</head>
<body>

<%


request.setCharacterEncoding("UTF-8");
response.setCharacterEncoding("UTF-8");


%>
 <header><%@ include file="header.jsp" %></header>

<section>




<div class=imgbody> 
	<h1 class =sangh1>현재 상영작</h1>
	<div class="sang1" >
		<c:forEach var="i1" items="${molist2}">
			<div class="image-container" align="center">
			<%--  <a href="details.jsp?name=${i.mo_name}">
  			
  			      <img alt="API에 등록된 그림이 없습니다." src="${i.mo_post}">
				</a>	 --%>
			  
			  
			  <a href="details.jsp?rank=${i1.mo_rank}&name=${i1.mo_name}&age=${i1.mo_age}&audiAcc=${i1.mo_audiAcc}&run=${i1.mo_run}&post=${i1.mo_post}&info=${i1.mo_info}&actname=${i1.mo_actname}&dirname=${i1.mo_dirname}&open=${i1.mo_open}&type=${i1.mo_type}">
    <img alt="API에 등록된 그림이 없습니다." src="${i1.mo_post}">
			</a>
			  
			   
			   <span class="rank">${i1.mo_rank}</span>
			    <span class="name"> ${i1.mo_name}</span><br>
			   
			   <span class="Acc"> 누적관객수 : ${i1.mo_audiAcc}명</span><br>
			

			   <%-- <img src="${i.mo_rank == 10 ? 'img/rank.jpg' : i.mo_post}" alt="영화 포스터"> 
  			  api에 그림이 안나올때 수동으로 올리는 방법
  			  --%>
			   
			</div>
		</c:forEach>
	</div>
</div>
</section>


 <footer><%@ include file="footer.jsp" %></footer>
</body>
</html>