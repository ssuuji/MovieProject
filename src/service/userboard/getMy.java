package service.userboard;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.my.main.Inter;

import DAO.AdminboardDAO;
import DAO.UserboardDAO;
import VO.AdminboardVO;
import VO.UserboardVO;

public class getMy implements Inter {

	@Override
	public void inter(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		UserboardDAO udao1 = null;
		AdminboardDAO udao2 = null;

		ArrayList<UserboardVO> ulist1 = null;

		HttpSession session = request.getSession();
		String id= (String)session.getAttribute("id");
		udao1 = new UserboardDAO();
		ulist1 = udao1.getMy(id);

		request.setAttribute("ulist1", ulist1);
	}
}
