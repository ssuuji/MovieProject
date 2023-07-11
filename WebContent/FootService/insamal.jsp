<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/header_style.css">
<link rel="stylesheet" href="../css/mov.css">
<link rel="stylesheet" href="../css/footer.css">

<style>
section{
padding-top: 150px;
padding-left: 20%;

}
footer{
padding-top: 50px;
}
hr{
width: 100px;
border-color: red;
border-width: 2;
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
<body>
<header>
<%@include file="header1.jsp" %>
</header>

<section>
<h1>인사말</h1><br>
<img src="../img/theater.jpg" width="1000" height="300"  >
<br><br>
<br>
<table border="0" align="center" width="1000">
<tr>
<td>
<pre class="pre1" >
<h3>양질의 문화 콘텐츠를 통해 고객들에게 특별한 감동과 풍요로운 가치를 전해드리는 컬처메이커스 기업</h3>
<hr>
KG시네마는 2000년 6월 시작하여 지난 20여년간 대한민국 대표 종합 엔터테인먼트 기업으로 성장해 왔습니다. 최상의 영화 관람환경을 제공하며 명실공히  운영하고 있는 KG시네마와 영화 투자·배급, 공연, 드라마 사업의 콘텐츠를 담당하는 KG엔터테인먼트로 구성되며, 양질의 문화 콘텐츠를 통해 고객들에게 감동을 선사하고 있습니다.

KG시네마는 최고의 시설을 기반으로 진일보한 영화관람 환경을 제공하는 복합문화공간입니다. 국내 PLF(Premium Large Format)상영관의 표본인 롯데시네마 월드타워 수퍼플렉스를 리뉴얼 오픈하며 영화의 본질에 몰입하는 시네마틱 공간, 새롭고 다양한 콘텐츠를 경험하는 컬처스테이지, 최신 트렌드를 즐기며 소통하는 복합 문화 공간으로 탈바꿈하고 있습니다. 또한 다년간의 노하우를 바탕으로 베트남에 멀티플렉스를 오픈하여 적극적인 해외 진출을 진행 중입니다.

KG엔터테인먼트는 영화 <신과함께>, <한산> 등 다양한 장르와 규모의 국내 작품들을 투자·배급하고 있습니다. 또한 할리우드 대형 배급사 ‘파라마운트 픽처스’의 영화를 비롯하여 유수의 해외 작품들을 수입해 양질의 콘텐츠를 제공하고 있습니다. 나아가 뮤지컬, 드라마에도 적극적으로 투자해 새로운 콘텐츠 영역을 개척하고 있습니다.

뿐만 아니라 KG시네마는 지속가능경영(ESG)를 위하여 지구 환경 보호를 위한 저탄소 환경 친화적 경영, 신인 영화인을 발굴하는 ‘KG크리에이티브 공모전’과 미래의 영화 꿈나무 육성을 위한 ‘영화제작교실’등 이웃과 함께 나눔 문화를 만들어가는 활동을 추진하고 있습니다.

KG시네마는 지속성장 가능한 동력 발굴과 신시장 개척을 통해 대한민국 콘텐츠 산업을 선도하는 기업으로 거듭나고 있으며 문화산업 발전에 기여하고 있습니다. KG시네마의 발걸음에 힘찬 박수와 애정 어린 시선을 부탁드리며, 앞으로도 더 좋은 문화를 통해 모두에게 더 크고 다양한 즐거움을 선사하기 위해 지속적으로 노력할 것입니다.

KGHOLDINGS(주)
</pre>
</td>
</tr>
</table>

</section>

<footer>
<%@include file="../footer.jsp" %>
</footer>
</body>
</html>