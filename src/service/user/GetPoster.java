package service.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;

import com.my.main.Inter;

import DAO.MovieDAO;
import DAO.SeatDAO;
import DAO.StimeDAO;

public class GetPoster implements Inter {
	@Override
	public void inter(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		MovieDAO modao = new MovieDAO();
		StimeDAO stdao = new StimeDAO();
		SeatDAO sdao = new SeatDAO();
		String mo_name=request.getParameter("movie");
		String date=request.getParameter("date");
		String showtime=request.getParameter("showtime");
		String theater=request.getParameter("cinema");
		String url=modao.getPost(mo_name);
		
		String getTime=showtime.substring(showtime.indexOf("-")+2);
		int getScr_id= Integer.parseInt(showtime.substring(0,1));

		int t_id =stdao.getT_id(mo_name, date, getTime, getScr_id);
		
		String[] rseatlist = sdao.getRseat(t_id);  
		StringBuilder sb = new StringBuilder();
		sb.append("[");
		for (int i = 0; i < rseatlist.length; i++) {
		    sb.append("\"").append(rseatlist[i]).append("\"");
		    if (i < rseatlist.length - 1) {
		        sb.append(",");
		    }
		}
		sb.append("]");

		String rseatlistJson = sb.toString();

		request.setAttribute("rseatlistJson", rseatlistJson);
		request.setAttribute("rseatlist", rseatlist);
		request.setAttribute("mo_name", mo_name);
		request.setAttribute("date", date);
		request.setAttribute("showtime", showtime);
		request.setAttribute("url", url);
		request.setAttribute("theater", theater);
		request.setAttribute("t_id", t_id);
		
	}
	
}
