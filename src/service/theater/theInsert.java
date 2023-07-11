package service.theater;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.my.main.Inter;

import DAO.TheaterDAO;

//영화관 추가
public class theInsert implements Inter{

		@Override
		public void inter(HttpServletRequest request, HttpServletResponse response)throws Exception {

			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			
			int th_id = Integer.parseInt(request.getParameter("th_id"));
			String th_name = request.getParameter("th_name");
			String th_addr = request.getParameter("th_addr");
			String th_tel = request.getParameter("th_tel"); 
			
			TheaterDAO thedao = new TheaterDAO();
			thedao.theInsert(th_id, th_name, th_addr, th_tel);
	}
}

