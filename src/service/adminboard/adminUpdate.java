package service.adminboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.my.main.Inter;

import DAO.AdminboardDAO;

public class adminUpdate implements Inter {

	@Override
	public void inter(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		AdminboardDAO sdao1 = null;
		
		String abbsTitle = request.getParameter("abbsTitle");
		String adminID = request.getParameter("adminID");
		String abbsContent = request.getParameter("abbsContent");
		
		int abbsID = Integer.parseInt(request.getParameter("abbsID"));
		
		try {
			sdao1 = new AdminboardDAO();
			sdao1.update(abbsTitle, adminID, abbsContent, abbsID);
		}catch (Exception e) {
			// TODO: handle exception
		}
		
	}

}
