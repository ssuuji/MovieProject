package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.my.main.Inter;

import DAO.MemberDAO;

public class memberUpdate implements Inter{

	@Override
	public void inter(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String m_id = request.getParameter("m_id");
		String m_pw = request.getParameter("m_pw");
		String m_name = request.getParameter("m_name");
		String m_tel =request.getParameter("m_tel");
		String m_email = request.getParameter("m_email");
		String m_id2 = request.getParameter("m_id2");
		
		MemberDAO dbdao = new MemberDAO();
		dbdao.memberUpdate(m_id,m_pw,m_name,m_tel,m_email,m_id2);
		
	}

}
