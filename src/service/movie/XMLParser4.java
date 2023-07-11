package service.movie;

import java.io.IOException;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
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

import com.my.main.Inter;

import DAO.MovieDAO;
import DAO.StimeDAO;
import VO.MovieVO;

public class XMLParser4 implements Inter {
   @Override
   public void inter(HttpServletRequest request, HttpServletResponse response) throws Exception {
      request.setCharacterEncoding("UTF-8");
      response.setCharacterEncoding("UTF-8");

      Document doc;
      String baseUrl = "http://api.koreafilm.or.kr/openapi-data2/wisenut/search_api/search_xml2.jsp?";
      String kobisapi = "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.xml?key=";
      LocalDate yesterday = LocalDate.now().minusDays(1);
      DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
      String formattedDate = yesterday.format(formatter);

      String kobiskey = "24f6e89e11e8762f14429254ad9edeac";
      String koburl = kobisapi + kobiskey + "&targetDt=" + formattedDate;
      String myKey = "I57PW5I358JE59IJ1O1L";

      List<MovieVO> molist = new ArrayList<>(); // 영화 정보를 저장할 리스트
      List<Integer> movieCodes = new ArrayList<>(); // 영화코드만 따로 저장할 리스트
      StimeDAO sdao = new StimeDAO();
      MovieDAO modao = new MovieDAO();
      try {
         doc = Jsoup.connect(koburl).get();
         Elements movieElements = doc.select("dailyBoxOffice");
         for (Element movieElement : movieElements) {
            String audiAcc = movieElement.select("audiAcc").first().text();
            String rank = movieElement.select("rank").first().text();
            String code = movieElement.select("movieCd").first().text();
            String d = movieElement.select("openDt").first().text();
            String open = d.replace("-", "");
            String title = movieElement.select("movieNm").first().text();

            String urlString = baseUrl + "collection=kmdb_new2&detail=Y&title=" + URLEncoder.encode(title, "UTF-8")
                  + "&releaseDts=" + open + "&ServiceKey=" + myKey;

            doc = Jsoup.connect(urlString).get();
            Element mo_infoTxtE = doc.select("plot").first();
            Element mo_postTxtE = doc.select("posters").first();
            Element mo_runTxtE = doc.select("runtime").first();
            Element mo_typeTxtE = doc.select("genre").first();
            Element mo_ageTxtE = doc.select("ratingGrade").first();
            Element mo_dirnameTxtE = doc.select("directorNm").first();
            Elements mo_atrname = doc.select("actorNm");

            int mo_code = Integer.parseInt(code);
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
            movie.setMo_name(title);
            movie.setMo_info(mo_info);
            movie.setMo_post(mo_post);
            movie.setMo_run(mo_run);
            movie.setMo_type(mo_type);
            movie.setMo_open(open);
            movie.setMo_age(mo_age);
            movie.setMo_dirname(mo_dirname);
            movie.setMo_actname(actorsString);
            movie.setMo_rank(rank);
            movie.setMo_audiAcc(audiAcc);

            molist.add(movie);
            movieCodes.add(mo_code);
            modao.insert_movie(mo_code, title, mo_info, mo_post, mo_run, mo_type, open, mo_age, mo_dirname,
            		actorsString);
         }

         Random random = new Random();
         for (int i = 1; i <= 180; i++) {
            int movieCode = movieCodes.get(random.nextInt(10));
            sdao.UpdateToMocode(movieCode, i);
         }


         request.setAttribute("molist1", molist);
      } catch (NullPointerException e1) {
         System.out.println("영화정보없음");
      } catch (IOException e) {
         System.out.println("네트워크 오류");
      } catch (NumberFormatException e) {
         System.out.println("잘못된 숫자 형식");
      }
   }
}
