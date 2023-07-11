package service.review;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.my.main.Inter;

import DAO.RevDAO;
import VO.RevVO;

public class RevgetMovie implements Inter {

	@Override
	public void inter(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		/*
		  RevDAO rdao1= null; 
		  RevVO rvo1= null;
		  
		  int mo_code = Integer.parseInt(request.getParameter("mo_code"));
		  
		  try { 
		  rdao1 = new RevDAO(); 
		  rvo1 = rdao1.search(mo_code);
		  
		  }catch(Exception e){ 
		  e.printStackTrace(); 
		  } 
		  request.setAttribute("rvo1",rvo1); 
		  }
		  
		 */
		
		
		/*
		 * RevDAO rdao = new RevDAO(); int mo_code
		 * =Integer.parseInt(request.getAttribute("mo_code").toString()); // ��ȭ �ڵ� ��������
		 * ArrayList<RevVO> rlist1 = rdao.getReviewsByMovieCode(mo_code);
		 * request.setAttribute("rlist1 ", rlist1 );
		 */

		RevDAO rdao = new RevDAO();
		int mo_code = Integer.parseInt(request.getParameter("mo_code"));
		ArrayList<RevVO> rlist1 = rdao.getReviewMovieCode(mo_code);
		request.setAttribute("rlist1", rlist1);

	}

}
