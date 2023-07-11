package service.screen;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.my.main.Inter;

import DAO.ScreenDAO;
import VO.ScreenVO;

public class ScreenSearchone implements Inter {

	@Override
	public void inter(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		ScreenDAO sdao = new ScreenDAO();
		
		int scr_id = Integer.parseInt(request.getParameter("scr_id"));
		
		ScreenVO svo = sdao.getInfo(scr_id);
		
		request.setAttribute("scr_id2", scr_id);
		request.setAttribute("svo2",svo);
	}

}
