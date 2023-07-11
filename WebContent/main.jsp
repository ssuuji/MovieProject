<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<style>
section h1{
padding-top: 10%;
}

 .image-container  {
    position: relative;
    display: inline-block;
  
  }

  .rank {
    position: absolute;
    top: 10px;
    left: 30px;
   font-style:italic;
   font-weight:bold;
    color:  #fff;
    padding: 5px;
    font-size: 35px;
    z-index: 1000; /* 순위 텍스트가 이미지 위에 표시되도록 함 */
    text-shadow: 2px 0 #000, 0 -2px #000, -2px 0 #000, 0 -2px #000;
  }

  .image-container img {
  object-fit: cover;
    display: block;
    width: 300px; /* 이미지의 원하는 가로 크기로 수정해주세요 */
    height: auto;
    z-index: 100;
  }
   .image-container img:hover {
     z-index: 1;
  }
</style>

<% /* String url = request.getServletPath(); */

String contextPath123 = request.getContextPath();
String redirecthead = "http://localhost:8080" + contextPath123 + "/css/header_style.css";

String redirectmain = "http://localhost:8080" + contextPath123 + "/css/main.css";

String redirectfoot = "http://localhost:8080" + contextPath123 + "/css/footer.css";

String redirectjquery = "http://localhost:8080" + contextPath123 + "/js/jquery-3.7.0.min.js";

String redirectjseat = "http://localhost:8080" + contextPath123 + "/js/seat_script.js";
%> 

<head>

<link rel="stylesheet" href="<%=redirecthead%>">
<script src="<%=redirectjquery%>"></script>
<script src="<%=redirectjseat%>"></script> 
<link rel="stylesheet" href="<%=redirectmain%>"> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<link rel="stylesheet" href="<%=redirectfoot%>"> 
</head>

   <script>
              
      $(document).ready(function() {
  var currentIndex = 0;
  var $videos = $('#videoContainer iframe');

  $('#nextBtn2').click(function() {
    // Hide the current video
    $videos.eq(currentIndex).hide();

    // Increment the current index to show the next video
    currentIndex = (currentIndex + 1) % $videos.length;

    // Show the next video
    $videos.eq(currentIndex).show();
  });

  $('#prevBtn1').click(function() {
    // Hide the current video
    $videos.eq(currentIndex).hide();

    // Decrement the current index to show the previous video
    currentIndex = (currentIndex - 1 + $videos.length) % $videos.length;

    // Show the previous video
    $videos.eq(currentIndex).show();
  });
});
      </script> 

<body>
	
    <header><%@ include file="header.jsp" %></header>
    
   	<section>
   
<div id="content1">
  <i class="fas fa-chevron-left" id="prevBtn1"></i>
  <div id="videoContainer">
    <iframe class="video-frame" width="100%" height="500px" src="https://www.youtube.com/embed/BOqFRHCrN-k?autoplay=1&mute=1" 
    title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" 
    allowfullscreen ></iframe>
    <iframe class="video-frame" width="100%" height="500px" src="https://www.youtube.com/embed/92h-aXeBnxU?autoplay=1&mute=1" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
     <iframe class="video-frame" width="100%" height="500px" src="https://www.youtube.com/embed/x3qkKWoJYbU?autoplay=1&mute=1" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
    <!-- Add more iframe elements for additional videos -->
  </div>
  <i class="fas fa-chevron-right" id="nextBtn2"></i>
</div>
  <div id="content2">
			<!-- wrapper -->
			<i class="fas fa-chevron-left" id="prevBtn"></i>
			<div class="carousel">
				<c:forEach var="i1" items="${molist2}">
  					<div class="image-container">
  					
   				 <span class="rank">${i1.mo_rank}</span>
   				 
   				   <a id="sangse" href="details.jsp?rank=${i1.mo_rank}&name=${i1.mo_name}&age=${i1.mo_age}
   				   &audiAcc=${i1.mo_audiAcc}&run=${i1.mo_run}&post=${i1.mo_post}&info=${i1.mo_info}
   				   &actname=${i1.mo_actname}&dirname=${i1.mo_dirname}&open=${i1.mo_open}&type=${i1.mo_type}
   				   ">상세정보</a><img src="${i1.mo_post}">
  					</div>
				</c:forEach>
			<i class="fas fa-chevron-right" id="nextBtn"></i>
		</div>
		</div>
   	 </section> 
	 
   	<style>
   		#sangse{
   		position:absolute;
   		z-index: 10;
   		left:37%;
   		top: 50%;
   		margin-top: 1rem; 
		border-radius: .5rem;
		color: #333;
		font-weight: bolder;
		font-size: 15px;
		cursor: pointer;
		padding: .5rem 1rem;
   		display: inline-block; 
   		}
   		#sangse:hover{
	background:var(--point);
	z-index: 1000;

}
   		</style> 
   		
    <script>
 
  var prevBtn = document.getElementById("prevBtn");
  var nextBtn = document.getElementById("nextBtn");
  var carousel = document.querySelector(".carousel");
  var imageWidth = 320;

  prevBtn.addEventListener("click", prevImage);
  nextBtn.addEventListener("click", nextImage);

  function prevImage() {
    carousel.scrollLeft -= imageWidth;
  }

  function nextImage() {
    carousel.scrollLeft += imageWidth;
  }


  </script> 
    
  <footer><%@ include file="footer.jsp" %>
  </footer>

     
</body>
</html>