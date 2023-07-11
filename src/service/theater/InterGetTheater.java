package service.theater;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.my.main.Inter;

import DAO.TheaterDAO;
import VO.TheaterVO;

//영화관 전체 조회
public class InterGetTheater implements Inter{

	@Override
	public void inter(HttpServletRequest request, HttpServletResponse response)throws Exception {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		TheaterDAO thedao = new TheaterDAO();
		ArrayList<TheaterVO> thealist1 = thedao.theSearch();
		request.setAttribute("thealist1", thealist1);
	}
}
