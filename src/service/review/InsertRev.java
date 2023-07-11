package service.review;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.my.main.Inter;

import DAO.RevDAO;

public class InsertRev implements Inter{

	@Override
	public void inter(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
	

		int mo_code = Integer.parseInt(request.getParameter("mo_code"));

		String m_id = request.getParameter("m_id");
		
		String rev_contents = request.getParameter("rev_contents");
		
		
		/*
		 * String write_dateString = request.getParameter("write_date");
		 * 
		 * // ��û���� ���� ��¥ ���ڿ��� ������ �����մϴ�. SimpleDateFormat dateFormat = new
		 * SimpleDateFormat("yyyy-MM-dd");
		 * 
		 * // ��¥ ���ڿ��� �Ľ��Ͽ� Date ��ü�� ��ȯ�մϴ�. Date write_date =
		 * dateFormat.parse(write_dateString);
		 */
		
        RevDAO rdao = null;
        try {
        	rdao = new RevDAO();
        	rdao.insert(mo_code,m_id,rev_contents);
        }catch (Exception e) {
			e.printStackTrace();
		}
        
	}

}
