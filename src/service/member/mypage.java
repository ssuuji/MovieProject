package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.my.main.Inter;

import DAO.MemberDAO;
import VO.MemberVO;

public class mypage implements Inter {

	@Override
	public void inter(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		MemberDAO mbdao = new MemberDAO();
		HttpSession session=request.getSession();
		String m_id = (String) session.getAttribute("id");
		MemberVO mvo = mbdao.getInfo(m_id);
		request.setAttribute("mvo", mvo);
	}
}
