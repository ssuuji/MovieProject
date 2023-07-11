package service.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.my.main.Inter;

import DAO.MemberDAO;
import DAO.StimeDAO;
import VO.MemberVO;
import VO.UserServiceVO;

public class Pay implements Inter{
	@Override
	public void inter(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");
		int t_id= Integer.parseInt( request.getParameter("t_id")); 
		int bookcnt= Integer.parseInt(request.getParameter("bookcnt"));
		String[] seats = request.getParameterValues("seats");
		// 상영 날짜
		// 상영관
		// 관람 인원
		MemberDAO mdao = new MemberDAO();
		StimeDAO sdao = new StimeDAO();
		UserServiceVO uvo =sdao.getDate_scr(t_id);
		String date = uvo.getT_date();
		int scr_id = uvo.getScr_id();
		String theater = request.getParameter("theater");
		String post = request.getParameter("post");
		MemberVO mvo=mdao.getInfo(id);
		int price = Integer.parseInt(request.getParameter("price"));
		String strSeat =request.getParameter("strSeat");
		request.setAttribute("mvo", mvo);
		request.setAttribute("price", price);
		request.setAttribute("strSeat", strSeat);
		request.setAttribute("seats", seats);
		request.setAttribute("theater", theater);
		request.setAttribute("date", date);
		request.setAttribute("scr_id", scr_id);
		request.setAttribute("t_id", t_id);
		request.setAttribute("bookcnt", bookcnt);
		request.setAttribute("post", post);
		
	
	}
}
