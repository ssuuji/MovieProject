package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.my.main.Inter;

import DAO.MemberDAO;
import VO.MemberVO;

//특정 영화관 조회?
public class memberSearchone2 implements Inter{
	
	@Override
	public void inter(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		MemberDAO mbdao = new MemberDAO();		
		String m_id = (String) session.getAttribute("id");
		MemberVO mv = mbdao.getInfo(m_id); 
		
		request.setAttribute("mv", mv);
	}
}