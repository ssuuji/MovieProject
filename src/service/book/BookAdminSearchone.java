package service.book;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.my.main.Inter;

import DAO.BookDAO;
import VO.BookVO;


public class BookAdminSearchone implements Inter{

	@Override
	public void inter(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		BookDAO bdao = new BookDAO();
		
		int book_id =Integer.parseInt(request.getParameter("book_id"));
		BookVO bv = bdao.getInfo(book_id); 
		
		request.setAttribute("bv", bv);
	}

}
