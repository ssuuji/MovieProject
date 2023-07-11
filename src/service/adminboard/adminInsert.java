package service.adminboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.my.main.Inter;

import DAO.AdminboardDAO;



public class adminInsert implements Inter {

	@Override
	public void inter(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String abbsTitle = request.getParameter("abbsTitle");
		String adminID = request.getParameter("adminID");
		String abbsContent = request.getParameter("abbsContent");
		
		AdminboardDAO sdao1 = null;
		try {
			sdao1 = new AdminboardDAO();
			sdao1.insert(abbsTitle, adminID, abbsContent);
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		
	}

}
