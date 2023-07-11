package service.movie;

import java.util.ArrayList;
import java.util.List;

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
import VO.MovieVO;

public class XMLParser44 implements Inter {
   @Override
   public void inter(HttpServletRequest request, HttpServletResponse response) throws Exception {
      request.setCharacterEncoding("UTF-8");
      response.setCharacterEncoding("UTF-8");

      Document doc;
      String kobisapi = "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.xml?key=";
      LocalDate yesterday = LocalDate.now().minusDays(1);
      DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMMdd");
      String formattedDate = yesterday.format(formatter);

      String kobiskey = "24f6e89e11e8762f14429254ad9edeac";
      String koburl = kobisapi + kobiskey + "&targetDt=" + formattedDate;

      // 전날 박스오피스 순위 10까지 추출
      MovieVO mvo = new MovieVO();
      MovieDAO modao = new MovieDAO();
      List<MovieVO> molist = modao.getAllInfo(); // 모든 영화 정보를 가져옴
      List<MovieVO> molist2 = new ArrayList<>(); // 영화 정보를 저장할 리스트

      try {
         doc = Jsoup.connect(koburl).get();
         Elements movieElements = doc.select("dailyBoxOffice");

         for (Element movieElement : movieElements) {
            int code = Integer.parseInt(movieElement.select("movieCd").first().text());
            String rank = movieElement.select("rank").first().text();
            String audiAcc = movieElement.select("audiAcc").first().text();

            for (MovieVO movie : molist) {
               if (movie.getMo_code() == code) {
                  mvo = new MovieVO(rank, audiAcc, movie.getMo_code(), movie.getMo_name(), movie.getMo_info(),
                        movie.getMo_post(), movie.getMo_run(), movie.getMo_type(), movie.getMo_open(), movie.getMo_age(),
                        movie.getMo_dirname(), movie.getMo_actname());
                  molist2.add(mvo);
                  break; // 일치하는 영화를 찾았으므로 루프 종료
               }
            }

            if (molist2.size() >= 10) {
               break; // 10개의 영화 정보를 모두 찾았으므로 루프 종료
            }
         }

         request.setAttribute("molist2", molist2); // 모든 영화 정보를 저장

      } catch (NullPointerException e1) {
         System.out.println("영화정보없음");
      } catch (Exception e) {
         System.out.println("에러");
      }
   }
}