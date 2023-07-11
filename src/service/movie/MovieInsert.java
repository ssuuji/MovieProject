package service.movie;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.my.main.Inter;

import DAO.MovieDAO;

public class MovieInsert implements Inter{
	@Override
	public void inter(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		int mo_code = Integer.parseInt(request.getParameter("mo_code"));
		String mo_name = request.getParameter("mo_name");
		String mo_info = request.getParameter("mo_info");
		String mo_post = request.getParameter("mo_post");
		String mo_run = request.getParameter("mo_run");
		String mo_type = request.getParameter("mo_type");
		String mo_open = request.getParameter("mo_open");
		String mo_age = request.getParameter("mo_age");
		String mo_dirname = request.getParameter("mo_dirname");
		String mo_actname = request.getParameter("mo_actname");
		
			MovieDAO modao=new MovieDAO();
			modao.insert_movie(mo_code, mo_name, mo_info, mo_post, mo_run, mo_type, mo_open, mo_age, mo_dirname, mo_actname);
			   
	}
}
