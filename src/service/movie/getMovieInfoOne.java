package service.movie;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.my.main.Inter;

import DAO.MovieDAO;
import VO.MovieVO;

public class getMovieInfoOne implements Inter {
	@Override
	public void inter(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		MovieDAO modao = new MovieDAO();
		int mo_code = Integer.parseInt(request.getParameter("mo_code"));
		
		MovieVO movo = modao.getMoInfoOne(mo_code);
		
		request.setAttribute("smovo", movo);
	}
}
