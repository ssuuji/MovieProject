package service.userboard;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.my.main.Inter;

import DAO.UserboardDAO;
import VO.UserboardVO;

public class Searchone implements Inter {

	@Override
	public void inter(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		UserboardDAO sdao1 = null;
		UserboardVO sv1 = null;
		
		int bunho = Integer.parseInt(request.getParameter("bunho"));
		
		try {
			sdao1 = new UserboardDAO();
			sv1 = sdao1.searchOne(bunho);
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		request.setAttribute("ssv", sv1);
	}
}




