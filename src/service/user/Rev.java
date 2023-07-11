package service.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import com.my.main.Inter;

import DAO.SeatDAO;

public class Rev implements Inter {
	@Override
	public void inter(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		int price = Integer.parseInt(request.getParameter("price"));
		int people = Integer.parseInt(request.getParameter("people"));
		String moname = request.getParameter("movie");
		String date = request.getParameter("date");
		String showtime = request.getParameter("showtime");
		String theater = request.getParameter("theater");
		String post = request.getParameter("post");
		int t_id = Integer.parseInt(request.getParameter("t_id"));
		String m_id = (String) request.getParameter("m_id");
		SeatDAO sdao = new SeatDAO();
		String[] seats = request.getParameterValues("seats[]");
		
		request.setAttribute("movie", moname);
		request.setAttribute("date", date);
		request.setAttribute("showtime", showtime);
		request.setAttribute("seats", seats);
		request.setAttribute("theater", theater);
		request.setAttribute("price", price);
		request.setAttribute("t_id", t_id);
		request.setAttribute("post", post);
		request.setAttribute("bookcnt", people);

	}
}
