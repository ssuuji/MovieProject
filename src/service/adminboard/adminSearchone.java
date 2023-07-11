package service.adminboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.my.main.Inter;

import DAO.AdminboardDAO;
import VO.AdminboardVO;

public class adminSearchone implements Inter {

	@Override
	public void inter(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		AdminboardDAO sdao1 = null;
		AdminboardVO sv1 = null;
		
		int bunho = Integer.parseInt(request.getParameter("bunho"));
		
			sdao1 = new AdminboardDAO();
			sv1 = sdao1.searchOne(bunho);
		
		request.setAttribute("ssv1", sv1);
	}
}


