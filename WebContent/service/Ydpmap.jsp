<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<!DOCTYPE html>
<html>
<head>

<!-- 클릭한 위치의 위도: 37.538428044608736
클릭한 위치의 경도: 127.07068332079628 -->
    <meta charset="utf-8">
    <title>지도</title>
    
</head>
<body>
<script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=acbd5cd1de590a7f3dd3aa911f0fe026"></script>
															<!-- acbd5cd1de590a7f3dd3aa911f0fe026 -->
<script>
window.onload = function() {
	var joongang1 = new kakao.maps.LatLng(37.517134147750376, 126.90539022951194);
			//해당 위도 경도를 지도의 중심에 위치하기 위한 것
			
	var mapDesign1 = {
					zoom: 15,
					center: joongang1,
					mapTypeId: kakao.maps.MapTypeId.ROADMAP,//HYBRID
					level: 4
					
			};		
	var map= new kakao.maps.Map(document.getElementById("jido1"), mapDesign1);
	

	var markerPosition  = new kakao.maps.LatLng(37.517134147750376, 126.90539022951194); 

	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});

	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
	
    var infowindow = new kakao.maps.InfoWindow({
        content: '<div style="padding:10px;">주소: 서울 영등포구 영중로 15 </div>'
    });
    
    kakao.maps.event.addListener(marker, 'click', function() {
        infowindow.open(map, marker);
    });
}

</script>


</head>
<body leftmargin="0" topmargin="0" ><!-- 팝업창 공백 제거 -->
	<div id="jido1" style="width: 484px; height: 572px;"> 
</body>
</html>