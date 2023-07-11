package service.screen;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.my.main.Inter;

import DAO.ScreenDAO;



public class ScreenDelete implements Inter {

	@Override
	public void inter(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		int scr_id	= Integer.parseInt(request.getParameter("scr_id"));
		
		ScreenDAO sdao = new ScreenDAO();
		
		sdao.delete_nametel(scr_id);
	}

}
