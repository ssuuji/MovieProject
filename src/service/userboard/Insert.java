package service.userboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.my.main.Inter;

import DAO.UserboardDAO;

public class Insert implements Inter{

	@Override
	public void inter(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String bbsTitle = request.getParameter("bbsTitle");
		String userID = request.getParameter("userID");
		String bbsContent = request.getParameter("bbsContent");
		UserboardDAO sdao1 = null;
		try {
			sdao1 = new UserboardDAO();
			sdao1.insert(bbsTitle, userID, bbsContent);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}
	
	

}
