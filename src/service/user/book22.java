package service.user;

import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.my.main.Inter;

import DAO.MovieDAO;
import DAO.StimeDAO;
import DAO.TheaterDAO;
import VO.MovieVO;
import VO.StimeVO;
import VO.TheaterVO;
import VO.UserServiceVO;

public class book22 implements Inter {
	@Override
	public void inter(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		TheaterDAO thedao = new TheaterDAO();
		MovieDAO modao = new MovieDAO();
		StimeDAO stdao = new StimeDAO();

		ArrayList<TheaterVO> thealist1 = thedao.theSearch();
		ArrayList<MovieVO> molist1 = modao.getAllInfo();
		ArrayList<StimeVO> stlist1 = stdao.stimeSearch();
		ArrayList<UserServiceVO> ulist = new ArrayList<>();
		ArrayList<String> userth = new ArrayList<>();
		ArrayList<String> moname = new ArrayList<>();
		ArrayList<String> userst = new ArrayList<>();
		ArrayList<String> tmplist = new ArrayList<>();

		for (TheaterVO a : thealist1) {
			String getname = a.getTh_name();
			userth.add(getname);// 극장이름

		}
		for (MovieVO a : molist1) {
			String getname = a.getMo_name();
			moname.add(getname);// 영화이름 
		}

		for (StimeVO a : stlist1) {
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			String getdate = dateFormat.format(a.getScr_date());
			userst.add(getdate);
			if (!tmplist.contains(getdate)) {
				tmplist.add(getdate);
			}
		}

		for (String moname1 : moname) {
			for (String date : tmplist) {
				ArrayList<UserServiceVO> dateMovieList = stdao.getInfotodate(date, moname1);
				ulist.addAll(dateMovieList);
			}
		}
		
		

		request.setAttribute("moname", moname);//영화이름
		request.setAttribute("userth", userth);//극장이름
		request.setAttribute("tmplist", tmplist);//상영날짜
		request.setAttribute("ulist", ulist);//상영정보
	}
}
