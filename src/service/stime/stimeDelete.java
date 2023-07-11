package service.stime;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.my.main.Inter;

import DAO.StimeDAO;

//삭제
public class stimeDelete implements Inter{

	@Override
	public void inter(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
			
			
		int t_id=Integer.parseInt(request.getParameter("t_id"));
		
		StimeDAO stdao = new StimeDAO();
		stdao.stimeDelete(t_id);
			
	}
}
