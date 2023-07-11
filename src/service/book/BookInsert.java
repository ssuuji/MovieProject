package service.book;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.my.main.Inter;

import DAO.BookDAO;



public class BookInsert implements Inter {

	@Override
	public void inter(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		int mo_code = Integer.parseInt(request.getParameter("mo_code"));
		String m_id = request.getParameter("m_id");
		String seat_id = request.getParameter("seat_id");
		int th_id = Integer.parseInt(request.getParameter("th_id"));
		String t_stime = request.getParameter("t_stime");
		int book_cnt = Integer.parseInt(request.getParameter("book_cnt"));
		int price = Integer.parseInt(request.getParameter("price"));
		
		BookDAO bdao = new BookDAO();
		
		/*
		 * bdao.insert_nametel( mo_code, m_id, seat_id, th_id, t_stime, book_cnt, price);
		 */
	}

}
