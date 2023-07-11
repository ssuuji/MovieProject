package service.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.my.main.Inter;

import DAO.RevDAO;

public class RevDelete implements Inter{

	@Override
	public void inter(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		RevDAO rdao = null;
		int rev_id = Integer.parseInt(request.getParameter("rev_id"));
		
		try {
		rdao = new RevDAO();	
		rdao.delete(rev_id);
		
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
