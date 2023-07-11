<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8">
<title>지도</title>

<link rel="stylesheet" href="../css/header_style.css">
<link rel="stylesheet" href="../mov.css">
<link rel="stylesheet" href="../css/footer.css">
    
    
<style>
        section {
            margin: 0;
            padding-top : 150px;
            padding-left: 20%; 
            
        }

	table{
	background-color: white;
	border: 0.3px;
	}
	
	hr{
	width: 1000px;
	border-width: 2px;
	}
	th{
	background-color: #F7F2F7;
	
	}
	td{
	background-color: #FF2FFFE;
	}
	
@media screen and (max-width: 1400px) {
  section {
    padding-left: calc(10% + ((100vw - 1200px) / 2));
  }
}

@media screen and (max-width: 1000px) {
  section {
    padding-left: 5%;
    
  }
}
    </style>
    
    
</head>



<script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=acbd5cd1de590a7f3dd3aa911f0fe026"></script>
															<!-- acbd5cd1de590a7f3dd3aa911f0fe026 -->
<script>
window.onload = function() {
	var joongang1 = new kakao.maps.LatLng(37.571071827138134, 126.9923592027139);
			//해당 위도 경도를 지도의 중심에 위치하기 위한 것
			
	var mapDesign1 = {
					zoom: 15,
					center: joongang1,
					mapTypeId: kakao.maps.MapTypeId.ROADMAP,//HYBRID
					level: 4
					
			};		
	var map= new kakao.maps.Map(document.getElementById("jido1"), mapDesign1);
	

	var markerPosition  = new kakao.maps.LatLng(37.571071827138134, 126.9923592027139); 

	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});

	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
	
    var infowindow = new kakao.maps.InfoWindow({
        content: '<div style="padding:5px;"> KGHOLDINGS(주)</div>'
    });
    
    kakao.maps.event.addListener(marker, 'click', function() {
        infowindow.open(map, marker);
    });
    
    // 버튼 클릭 이벤트 처리
    var moveButton = document.getElementById('moveButton');
    moveButton.addEventListener('click', function() {
        // 마커가 있는 위치로 지도 이동
        map.setCenter(markerPosition);
    });
    
}

</script>


</head>
<header>
<%@include file="header1.jsp" %>
</header>


<section>
<body>
	<h1>찾아 오시는길</h1><br>
	<div id="jido1" style="width: 1000px; height: 400px;"></div>
	<br>	<br>
	<hr>
	<table border="0" align="center" width="1000"height="400" >
	<tr>
	<th width="150">주소</th><td> 서울특별시 종로구 돈화문로 26 4층</td>
	</tr>
	
	<tr>
	<th width="150">지하철</th>
	<td>
	- 종로3가역 1호선 10번출구
	- 종로3가역 3호선 9번출구
	- 종로3가역 5호선 3번출구
	</td>
	</tr>
	
	<tr>
	<th width="150">버스</th>
	<td> 
	- 지선버스 : 7212, 8101 <br>
	- 간선버스 : 101, 103, 143, 150, 160, 201, 260, 262, 270, 271, 273, 370, 601, 720, 721<br>
	- 광역버스 : 7101, 9301<br>
	- 공항버스 : 6002
	
	</td>
	</tr>
	
	</table><hr>
	
</body>



</section>


<footer>
<%@include file="../footer.jsp" %>
</footer>

</html>