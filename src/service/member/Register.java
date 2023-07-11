package service.member;

import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.my.main.Inter;

import DAO.MemberDAO;

public class Register implements Inter {

	// 비밀번호 유효성 검사: 영문, 숫자, 특수문자를 모두 포함하는지 확인
	private boolean isValidPassword(String password) {
		String regex = "^(?=.*[0-9])(?=.*[a-zA-Z])(?=.*[@#$%^&+=]).*$";
		return Pattern.matches(regex, password);
	}

	@Override
	public void inter(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		String id = request.getParameter("m_id");
		String pw = request.getParameter("m_pw");
		String pw2 = request.getParameter("m_pw2");
		String name = request.getParameter("m_name");
		String tel = request.getParameter("m_tel");
		String email = request.getParameter("m_email");
		request.setAttribute("id", id);
		request.setAttribute("m_id", id);
		request.setAttribute("m_name", name);
		request.setAttribute("m_tel", tel);
		request.setAttribute("m_email", email);
		// 비밀번호 검증 조건: 영문, 숫자, 특수문자를 모두 포함
		if (!isValidPassword(pw) || pw.length() < 9) {
			request.setAttribute("erpw", "비밀번호 오류");
		} else if (!pw.equals(pw2)) {
			request.setAttribute("erpw2", "비밀번호 확인");
		} else if(request.getParameter("m_id")==null) {
			request.setAttribute("erid", "아이디 확인먼저");
		}
			else {
			// DB에 정보 저장
			MemberDAO mdao = new MemberDAO();
			boolean da = mdao.memberinsert(id, pw, name, tel, email);
			if (da) {
				request.setAttribute("regok", "가입성공");
			} else {
				request.setAttribute("regfall", "가입실패");
			}
		}
	}
}
