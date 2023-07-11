package service.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.my.main.Inter;

import DAO.MemberDAO;
import VO.MemberVO;

public class Login implements Inter {
	@Override
	public void inter(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		MemberDAO mdao = new MemberDAO();
		MemberVO mvo = mdao.getInfo(id);
		HttpSession session = request.getSession();
		String errorMessage = "에러";
		if (id.equals("admin") && pw.equals("admin")) {
			// 어드민 계정일 경우 admin.jsp로 이동
			session.setAttribute("admin", id);
			session.setAttribute("id", id);
			return;
		} else if (mvo == null) {
			errorMessage = "에러";
			request.setAttribute("error", errorMessage);
		} else if (!mvo.getM_pw().equals(pw)) {
			// DB에 비밀번호와 입력한 비밀번호가 다를 경우
			errorMessage = "비밀번호가 일치하지 않습니다.";
			request.setAttribute("error", errorMessage);
		} else {
			// 어드민 계정이 아닌 경우
			session.setAttribute("id", id);
			request.setAttribute("smvo", mvo);
		}
	}

}