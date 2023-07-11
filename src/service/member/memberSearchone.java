package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.my.main.Inter;

import DAO.MemberDAO;
import VO.MemberVO;

//특정 영화관 조회?
public class memberSearchone implements Inter{
	
	@Override
	public void inter(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		MemberDAO mbdao = new MemberDAO();		
		String m_id = request.getParameter("m_id");
		MemberVO mv = mbdao.getInfo(m_id); 
		
		request.setAttribute("id2", m_id);
		request.setAttribute("mv", mv);
	}
}