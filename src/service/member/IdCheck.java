package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.my.main.Inter;

import DAO.MemberDAO;

public class IdCheck implements Inter {
	@Override
	public void inter(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String id = request.getParameter("m_id");
		MemberDAO mdao = new MemberDAO();
		
		String name = request.getParameter("m_name");
		String tel = request.getParameter("m_tel");
		String email = request.getParameter("m_email");
		request.setAttribute("m_id", id);
		request.setAttribute("m_name", name);
		request.setAttribute("m_tel", tel);
		request.setAttribute("m_email", email);
		if (id.length()<3) {
			request.setAttribute("id", "    ");
			request.setAttribute("erlen", "길이부족");
		}else if(!mdao.idCheck(id)){
			request.setAttribute("id", id);
		}else {
			request.setAttribute("id", "    ");
			request.setAttribute("error1", "중복오류");
		}
	}
}
