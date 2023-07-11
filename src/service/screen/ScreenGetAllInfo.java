package service.screen;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.my.main.Inter;

import DAO.ScreenDAO;
import VO.ScreenVO;

public class ScreenGetAllInfo implements Inter{

	@Override
	public void inter(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		ScreenDAO sdao = new ScreenDAO();
		
		ArrayList<ScreenVO> slist = sdao.getAllInfo();
		
		request.setAttribute("slist", slist);
	}
	
	

}
