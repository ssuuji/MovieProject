package service.userboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.my.main.Inter;

import DAO.UserboardDAO;

public class Update implements Inter {

	@Override
	public void inter(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		UserboardDAO sdao1 = null;
		
		String bbsTitle = request.getParameter("bbsTitle");
		String userID = request.getParameter("userID");
		String bbsContent = request.getParameter("bbsContent");
		
		int bbsID = Integer.parseInt(request.getParameter("bbsID"));
		
		try {
			sdao1 = new UserboardDAO();
			sdao1.update(bbsTitle, userID, bbsContent, bbsID);
		}catch (Exception e) {
			// TODO: handle exception
		}
		
	}

}
