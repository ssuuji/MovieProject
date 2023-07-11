package service.movie;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.my.main.Inter;

import DAO.MovieDAO;
import VO.MovieVO;

public class MoviegetAllInfo implements Inter{
	@Override
	public void inter(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		MovieDAO modao = new MovieDAO();
		ArrayList<MovieVO> molist = modao.getAllInfo();
		for (MovieVO movie : molist) {
		    String mo_info = movie.getMo_info();
		    String mo_post = movie.getMo_post();
		    String mo_actname = movie.getMo_actname();
		    if (mo_info.length() > 10) {
		    	mo_info = mo_info.substring(5, 15) + "...";
		        movie.setMo_info(mo_info);
		    }
		    if(mo_post.length()>10) {
		    	mo_post = mo_post.substring(0,10)+"...";
		    	movie.setMo_post(mo_post);
		    }
		    if(mo_actname.length()>10) {
		    	mo_actname = mo_actname.substring(0,10)+"...";
		    	movie.setMo_actname(mo_actname);
		    }
		}
		request.setAttribute("molist", molist);
		
	}
}
