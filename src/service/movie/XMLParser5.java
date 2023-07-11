package service.movie;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.threeten.bp.LocalDate;
import org.threeten.bp.format.DateTimeFormatter;

import com.my.main.Inter;

import testvod.vodVO;

public class XMLParser5 implements Inter {
	@Override
	public void inter(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		Document doc;
		String baseUrl = "https://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_xml2.jsp?";
		String kobisapi = "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.xml?key=";
		LocalDate yesterday = LocalDate.now().minusDays(1);
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
		String formattedDate = yesterday.format(formatter);

		String kobiskey = "24f6e89e11e8762f14429254ad9edeac";
		String koburl = kobisapi + kobiskey + "&targetDt=" + formattedDate;
		String myKey = "I57PW5I358JE59IJ1O1L";

		// 전날 박스오피스 순위 10까지 추출
		List<Map<String, String>> movies = new ArrayList<>();

		List<vodVO> molist = new ArrayList<>(); // 영화 정보를 저장할 리스트
		try {
			doc = Jsoup.connect(koburl).get();
			Elements movieElements = doc.select("dailyBoxOffice");
			for (Element movieElement : movieElements) {
				// 각 영화의 필요한 정보를 추출하여 변수에 저장
				String rank = movieElement.select("rank").first().text();
				movieElement.select("audiAcc").first().text();
				String code = movieElement.select("movieCd").first().text();
				String d = movieElement.select("openDt").first().text();
				String open = d.replace("-", "");
				String title = movieElement.select("movieNm").first().text();
				String urlString = baseUrl + "collection=kmdb_new2&detail=Y&query=" + title + "&releaseDts=" + open
						+ "&ServiceKey=" + myKey;

				doc = Jsoup.connect(urlString).get();

				Element vod_url = doc.select("vodUrl").first();

				int mo_code = Integer.parseInt(code);
				String mo_name = title;
				String url = vod_url.text();
				



				vodVO vodvo = new vodVO();
				vodvo.setCode(mo_code);
				vodvo.setName(mo_name);
				vodvo.setUrl(url);
				

				molist.add(vodvo); // 영화 정보를 리스트에 추가
				
				

			}

			request.setAttribute("molist1", molist); // 모든 영화 정보를 저장

		} catch (Exception e) {
			System.out.println("연결오류");
		}
	}
}
