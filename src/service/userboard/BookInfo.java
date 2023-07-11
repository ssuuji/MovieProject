package service.userboard;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.my.main.Inter;

import DAO.BookDAO;
import VO.BookServiceVO;

public class BookInfo implements Inter{
	@Override
	public void inter(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		BookDAO bdao = new BookDAO();
		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("id");
		ArrayList<BookServiceVO> bary = bdao.getInfoY(m_id); 
		if(request.getAttribute("ss")!=null) {
			request.setAttribute("s", "ss");
		}
		request.setAttribute("barray", bary);
	}
}
