package service.book;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.my.main.Inter;

import DAO.BookDAO;
import VO.BookVO;


public class BookGetAllInfo implements Inter{

	@Override
	public void inter(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		BookDAO bdao = new BookDAO();
		
		ArrayList<BookVO> blist = bdao.getAllInfo();
		
		request.setAttribute("blist", blist);
	}
	
	

}
