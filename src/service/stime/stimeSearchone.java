package service.stime;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.my.main.Inter;

import DAO.StimeDAO;
import VO.StimeVO;

//특정 영화관 조회?
public class stimeSearchone implements Inter{
	
	@Override
	public void inter(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		StimeDAO stdao = new StimeDAO();		
		int t_id=Integer.parseInt(request.getParameter("t_id"));
		StimeVO sv = stdao.getInfo(t_id); 
		
		request.setAttribute("sv", sv);
	}
}