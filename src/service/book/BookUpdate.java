package service.book;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.my.main.Inter;

import DAO.BookDAO;
import DAO.MemberDAO;

public class BookUpdate implements Inter {

	@Override
	public void inter(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		int book_id = Integer.parseInt(request.getParameter("book_id"));
		BookDAO bdao = new BookDAO();
		
		bdao.bookUpdate(book_id);
		

	}

}
