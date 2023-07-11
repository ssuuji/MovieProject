package service.adminboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.my.main.Inter;

import DAO.AdminboardDAO;
import DAO.MemberDAO;
import DAO.UserboardDAO;
import VO.AdminboardVO;

public class adminDelete implements Inter {

	@Override
	public void inter(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		session.invalidate();
		
		
		
		AdminboardDAO adao = null;
				
		
		int abbsID = Integer.parseInt(request.getParameter("abbsID"));
		
		try {
			adao = new AdminboardDAO();
			adao.admindelete(abbsID);
		} catch (Exception e) {
		}
		
		
		
		
	}
}
