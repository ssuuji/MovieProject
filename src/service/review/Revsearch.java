package service.review;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.my.main.Inter;

import DAO.RevDAO;
import VO.RevVO;

public class Revsearch implements Inter {

	@Override
	public void inter(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		RevDAO rdao1= null;
		RevVO rvo1 = null;
		int rev_id =Integer.parseInt(request.getParameter("rev_id"));
		
		try {
			rdao1 = new RevDAO();
			rvo1 = rdao1.search(rev_id);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("rvo",rvo1);
	} 
}
