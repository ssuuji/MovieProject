package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.my.main.Inter;

import DAO.MemberDAO;
import VO.MemberVO;

public class memberUpdate2 implements Inter {

	@Override
	public void inter(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		String m_id = request.getParameter("id");
		String m_pw = request.getParameter("pw");
		String m_name = request.getParameter("name");
		String m_tel = request.getParameter("tel");
		String m_email = request.getParameter("email");
		MemberDAO dbdao = new MemberDAO();
		MemberVO mvo=null; 
		if (!request.getParameter("pw1").equals("") && !request.getParameter("pw2").equals("")) {
			if (request.getParameter("pw1").equals(request.getParameter("pw2"))) {
				dbdao.memberUpdate(m_id, request.getParameter("pw1"), m_name, m_tel, m_email, m_id);
				mvo = new MemberVO(m_id, request.getParameter("pw1"), m_name, m_tel, m_email);
				request.setAttribute("ss", "ss");
			}else {
				request.setAttribute("er","er");
			}
		}else {
			dbdao.memberUpdate(m_id, m_pw, m_name, m_tel, m_email, m_id);
			mvo = new MemberVO(m_id, m_pw, m_name, m_tel, m_email);	
			request.setAttribute("ss", "ss");
		}
		request.setAttribute("mvo", mvo);
	}

}
