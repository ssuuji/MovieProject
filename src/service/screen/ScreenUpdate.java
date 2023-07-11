package service.screen;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.my.main.Inter;

import DAO.ScreenDAO;

public class ScreenUpdate implements Inter{

	@Override
	public void inter(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		int scr_id = Integer.parseInt(request.getParameter("scr_id"));
		int th_id = Integer.parseInt(request.getParameter("th_id"));
		int scr_tot = Integer.parseInt(request.getParameter("scr_tot"));
		
		int scr_id2 = Integer.parseInt(request.getParameter("scr_id2")); 
		
		
		ScreenDAO sdao = new ScreenDAO();
		sdao.update_all(scr_id, th_id, scr_tot, scr_id2);
		
	}

}
