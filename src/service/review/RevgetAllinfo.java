package service.review;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.my.main.Inter;

import DAO.RevDAO;
import VO.RevVO;

public class RevgetAllinfo implements Inter {

	@Override
	public void inter(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		RevDAO rdao1 = null;
		ArrayList<RevVO> rlist1 = null;

		rdao1 = new RevDAO();
		rlist1 = rdao1.RgetAllinfo();

		request.setAttribute("rlist1", rlist1);
	}
}
