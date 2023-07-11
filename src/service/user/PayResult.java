package service.user;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.my.main.Inter;

import DAO.BookDAO;
import DAO.SeatDAO;
import DAO.StimeDAO;
import DAO.TheaterDAO;
import VO.UserServiceVO;

public class PayResult implements Inter {
	@Override
	public void inter(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String m_name = request.getParameter("m_name");
		String m_id = request.getParameter("m_id");
		int book_id = Integer.parseInt(request.getParameter("book_id"));
		String theater = request.getParameter("theater");
		int bookcnt = Integer.parseInt(request.getParameter("bookcnt"));
		String seat = request.getParameter("seat");
		String post = request.getParameter("url");
		int price = Integer.parseInt(request.getParameter("price"));
		int t_id = Integer.parseInt(request.getParameter("t_id"));
		LocalDateTime now = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
		String revdate = now.format(formatter);
		StimeDAO stdao = new StimeDAO();
		SeatDAO sdao = new SeatDAO();
		TheaterDAO thdao = new TheaterDAO();
		BookDAO bdao = new BookDAO();
		UserServiceVO uvo = stdao.getDate_scr(t_id);
		String date = uvo.getT_date();
		int mocode = uvo.getMo_code();
		System.out.println(date);
		System.out.println(mocode);
		System.out.println(mocode);
		System.out.println(mocode);
		int th_id = thdao.getTh_id(theater);
		String thea_scr = theater + " " + uvo.getScr_id();
		String[] seats = seat.split(",");
		for (String rseat : seats) {
			sdao.insert_seat(t_id, rseat, m_id);
		}
		bdao.insert_nametel(book_id, mocode, m_id, th_id, t_id, bookcnt, price, revdate);
		stdao.seatUpdate(bookcnt, t_id);
		request.setAttribute("m_name", m_name);
		request.setAttribute("book_id", book_id);
		request.setAttribute("date", date);
		request.setAttribute("thea_scr", thea_scr);
		request.setAttribute("seat", seat);
		request.setAttribute("bookcnt", bookcnt);
		request.setAttribute("price", price);
		request.setAttribute("post", post);

	}
}
