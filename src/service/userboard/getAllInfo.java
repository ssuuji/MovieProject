package service.userboard;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.my.main.Inter;

import DAO.AdminboardDAO;
import DAO.UserboardDAO;
import VO.AdminboardVO;
import VO.UserboardVO;

public class getAllInfo implements Inter{

	@Override
	public void inter(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		UserboardDAO udao1 = null;
		AdminboardDAO udao2 = null;
		
		ArrayList<UserboardVO> ulist1 = null;
		ArrayList<AdminboardVO> ulist2 = null;
		
			udao1 = new UserboardDAO();
			ulist1 = udao1.getAllInfo();
			
			udao2 = new AdminboardDAO();
			ulist2 = udao2.getAllInfo();
		
		request.setAttribute("ulist1", ulist1);
		request.setAttribute("ulist2", ulist2);
	}	
}
