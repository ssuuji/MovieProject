package service.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.my.main.Inter;

import DAO.RevDAO;

public class RevUpdate implements Inter{

	@Override
	public void inter(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		RevDAO rdao1 = null;
		
		int rev_id = Integer.parseInt(request.getParameter("rev_id"));
		int mo_code = Integer.parseInt(request.getParameter("mo_code"));
		String m_id = request.getParameter("m_id");
		String rev_contents = request.getParameter("rev_contents");
		
		
		try {
			rdao1 = new RevDAO();
			rdao1.update(rev_contents,rev_id,mo_code,m_id);
			
		}catch (Exception e) {
			e.printStackTrace();

		} 
	
		
		
	}

}
