package service.theater;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.my.main.Inter;

import DAO.TheaterDAO;

//영화관 삭제
public class theDelete implements Inter{

	@Override
	public void inter(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
			
		int th_id = Integer.parseInt(request.getParameter("th_id"));	
		TheaterDAO 	thedao = new TheaterDAO();
		thedao.theDelete(th_id);
			
	}
}