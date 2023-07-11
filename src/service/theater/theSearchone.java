package service.theater;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.my.main.Inter;

import DAO.TheaterDAO;
import VO.TheaterVO;

//특정 영화관 조회?
public class theSearchone implements Inter{
	
	@Override
	public void inter(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		TheaterDAO thedao = new TheaterDAO();		
		int th_id = Integer.parseInt(request.getParameter("th_id"));
		TheaterVO tv = thedao.getInfo(th_id); 
		
		request.setAttribute("th_id2", th_id);//해당 영화관 아이디 넘기기 
		request.setAttribute("stv", tv);//해당 영화관 전체정보를 넘기기
	}
}
