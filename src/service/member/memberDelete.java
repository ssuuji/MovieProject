package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.my.main.Inter;

import DAO.MemberDAO;



public class memberDelete implements Inter {

	@Override
	public void inter(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		
		
		MemberDAO mdao = null;
		
		
		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("id");
		
			mdao = new MemberDAO();
			mdao.memberdelete(m_id);
			session.invalidate();
			
	}

}
