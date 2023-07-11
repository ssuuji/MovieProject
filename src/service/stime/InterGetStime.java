package service.stime;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.my.main.Inter;

import DAO.StimeDAO;
import VO.StimeVO;

//영화관 전체 조회
public class InterGetStime implements Inter{

	@Override
	public void inter(HttpServletRequest request, HttpServletResponse response)throws Exception {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		StimeDAO thedao = new StimeDAO();
		ArrayList<StimeVO> stimelist1 = thedao.stimeSearch();
		request.setAttribute("stimelist1", stimelist1);
	}
}
