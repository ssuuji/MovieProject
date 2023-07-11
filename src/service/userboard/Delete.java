package service.userboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.my.main.Inter;

import DAO.UserboardDAO;

public class Delete implements Inter {

	@Override
	public void inter(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		UserboardDAO sdao = null;
		
		int bunho = Integer.parseInt(request.getParameter("bunho"));
		
		try {
			sdao = new UserboardDAO();
			sdao.delete(bunho);
		} catch (Exception e) {
		}
		
	}

}
