package service.movie;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.my.main.Inter;

import DAO.MovieDAO;

public class MovieDelete implements Inter{
	@Override
	public void inter(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
	
		MovieDAO modao = new MovieDAO();
		int mo_code = Integer.parseInt(request.getParameter("mo_code"));
		modao.delete_movie(mo_code);
	}
}
