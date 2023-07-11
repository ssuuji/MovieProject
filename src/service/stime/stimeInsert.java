package service.stime;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.my.main.Inter;

import DAO.StimeDAO;

//영화관 추가
public class stimeInsert implements Inter{

		@Override
		public void inter(HttpServletRequest request, HttpServletResponse response)throws Exception {

			request.setCharacterEncoding("UTF-8");
			response.setCharacterEncoding("UTF-8");
			
			
			String scr_stime = request.getParameter("stime");
			String scr_etime = request.getParameter("etime"); 
			String scr_date = request.getParameter("date");
			int scr_id =Integer.parseInt(request.getParameter("scr_id"));
			int mo_code=Integer.parseInt(request.getParameter("mo_code"));
			StimeDAO stdao = new StimeDAO();
			stdao.stimeInsert( scr_date,scr_stime,scr_etime,scr_id,mo_code);
	}
}