package service.book;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.my.main.Inter;

import DAO.BookDAO;
import DAO.SeatDAO;

public class Cancel implements Inter {
	@Override
	public void inter(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		int t_id = Integer.parseInt(request.getParameter("t_id"));
		int book_id = Integer.parseInt(request.getParameter("book_id"));
		
		HttpSession session = request.getSession();
		String m_id=(String)session.getAttribute("id");
		BookDAO bdao =new  BookDAO();
		bdao.bookCancel(book_id, t_id);
		
		SeatDAO sdao = new SeatDAO();
		sdao.cancelBookSeat(t_id,m_id);
	}
	
}
