package service.movie;


import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.threeten.bp.LocalDate;
import org.threeten.bp.format.DateTimeFormatter;

import com.my.main.Inter;

import DAO.MovieDAO;
import DAO.StimeDAO;
import VO.MovieVO; 


public class GetRank implements Inter {
	   @Override
	   public void inter(HttpServletRequest request, HttpServletResponse response) throws Exception {
	      request.setCharacterEncoding("UTF-8");
	      response.setCharacterEncoding("UTF-8");
	      
			/* request.getParameter("name"); */

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
	      MovieDAO modao = new MovieDAO();
	      StimeDAO sdao = new StimeDAO();
	      List<MovieVO> molist = new ArrayList<>(); // 영화 정보를 저장할 리스트
	      List<Integer> movieCodes = new ArrayList<>();// 영화코드만 따로 저장할 리스트
	      try {
	         doc = Jsoup.connect(koburl).get();
	         Elements movieElements = doc.select("dailyBoxOffice");
	         for (Element movieElement : movieElements) {
	            String audiAcc = movieElement.select("audiAcc").first().text();
	            String rank = movieElement.select("rank").first().text();
	            movieElement.select("audiAcc").first().text();
	            String code = movieElement.select("movieCd").first().text();
	            String d = movieElement.select("openDt").first().text();
	            String open = d.replace("-", "");
	            String title = movieElement.select("movieNm").first().text();

	            String urlString = baseUrl + "collection=kmdb_new2&detail=Y&title=" + URLEncoder.encode(title, "UTF-8") + "&releaseDts=" + open
	                    + "&ServiceKey=" + myKey;

	            doc = Jsoup.connect(urlString).get();
	            Element mo_infoTxtE = doc.select("plot").first();
	            Element mo_postTxtE = doc.select("posters").first();
	            Element mo_runTxtE = doc.select("runtime").first();
	            Element mo_typeTxtE = doc.select("genre").first();
	            Element mo_ageTxtE = doc.select("ratingGrade").first();
	            Element mo_dirnameTxtE = doc.select("directorNm").first();
	            Elements mo_atrname = doc.select("actorNm"); 


	            int mo_code = Integer.parseInt(code);
	            String mo_name = title;
	            String mo_open = open;
	            String actorsString = "";
	            String mo_info = (mo_infoTxtE != null) ? mo_infoTxtE.text() : "영화정보없음";
	            String mo_post = (mo_postTxtE != null) ? mo_postTxtE.text() : "영화정보없음";
	            String mo_run = (mo_runTxtE != null) ? mo_runTxtE.text() : "영화정보없음";
	            String mo_type = (mo_typeTxtE != null) ? mo_typeTxtE.text() : "영화정보없음";
	            String mo_age = (mo_ageTxtE != null) ? mo_ageTxtE.text() : "영화정보없음";
	            String mo_dirname = (mo_dirnameTxtE != null) ? mo_dirnameTxtE.text() : "영화정보없음";
	            
	            String[] urlArray = mo_post.split("\\|");
	            if (urlArray.length > 0)
	               mo_post = urlArray[0];

	            // 각 배우 요소에서 텍스트를 추출하여 리스트에 추가
	            for (int i = 0; i < mo_atrname.size(); i++) {
	               if (i < 10) {
	                  Element actorElement = mo_atrname.get(i);
	                  String actorName = (actorElement != null) ? actorElement.text() : "영화정보없음";
	                  // 배우 이름을 actorsString에 추가
	                  if (i > 0) {
	                     actorsString += ", "; // 쉼표로 구분하여 추가
	                  }
	                  actorsString += actorName;
	               } else {
	                  break; // 최대 인원 초과 시 반복문 종료
	               }
	            }

	            MovieVO movie = new MovieVO();
	            movie.setMo_code(mo_code);
	            movie.setMo_name(mo_name);
	            movie.setMo_info(mo_info);
	            movie.setMo_post(mo_post);
	            movie.setMo_run(mo_run);
	            movie.setMo_type(mo_type);
	            movie.setMo_open(mo_open);
	            movie.setMo_age(mo_age);
	            movie.setMo_dirname(mo_dirname);
	            movie.setMo_actname(actorsString); // 배우 리스트를 설정합니다.
	            movie.setMo_rank(rank);
	            movie.setMo_audiAcc(audiAcc);

	            molist.add(movie); // 영화 정보를 리스트에 추가

	            modao.insert_movie(mo_code, mo_name, mo_info, mo_post, mo_run, mo_type, mo_open, mo_age, mo_dirname,
	                  actorsString);
	            movieCodes.add(mo_code);

	         }
				
	         request.setAttribute("molist1", molist); // 모든 영화 정보를 저장

	      } catch (NullPointerException e1) {
	         System.out.println("영화정보없음");
	      } catch (Exception e) {
	         System.out.println("에러");
	      }
	   }
	}
