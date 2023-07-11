package service.book;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.my.main.Inter;

import DAO.BookDAO;
import VO.BookServiceVO;
import VO.BookVO;


public class BookSearchone implements Inter {

	@Override
	public void inter(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		BookDAO bdao = new BookDAO();
		
		int book_id = Integer.parseInt(request.getParameter("book_id"));
		HttpSession session=request.getSession();
		String m_id = (String) session.getAttribute("id");
		ArrayList<BookServiceVO> bvo = bdao.getInfoY(m_id);
		
		request.setAttribute("book_id2", book_id);
		request.setAttribute("bvo2",bvo);
	}

}
