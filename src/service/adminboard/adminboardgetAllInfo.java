package service.adminboard;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.my.main.Inter;

import DAO.AdminboardDAO;
import DAO.UserboardDAO;
import VO.AdminboardVO;
import VO.UserboardVO;


public class adminboardgetAllInfo implements Inter{

	@Override
	public void inter(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		AdminboardDAO udao2 = null;
		
		ArrayList<AdminboardVO> ulist2 = null;
		
		try {

			udao2 = new AdminboardDAO();
			ulist2 = udao2.getAllInfo();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		request.setAttribute("ulist2", ulist2);
	}
		
}
