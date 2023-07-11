package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import Conn.Connect;
import VO.StimeVO;
import VO.UserServiceVO;

//영화관 DAO
public class StimeDAO {
	private Connection con;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	public StimeDAO() throws ClassNotFoundException, SQLException{
		con=new Connect().getConnection(); 
	}
	
	public boolean stimeInsert
	(String scr_date,String scr_stime, String scr_etime,int scr_id, int mo_code) throws SQLException{
		
		String sql = "insert into stime values(t_seq.nextval,?,?,?,?,0,?)";
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, scr_stime);
			pstmt.setString(2, scr_etime);
			pstmt.setString(3, scr_date);
			pstmt.setInt(4, scr_id);
			pstmt.setInt(5, mo_code);

			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
		
	/*
 		시간 전체 조회
	*/	
	public ArrayList<StimeVO> stimeSearch() throws SQLException{
		ArrayList<StimeVO> stimelist= new ArrayList<StimeVO>();
		
		String sql= "select * from stime";
		
		pstmt=con.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()) {
			int t_id =rs.getInt(1);
			String scr_stime=rs.getString(2);
			String scr_etime=rs.getString(3);
			Date scr_date=rs.getDate(4);
			int scr_id = rs.getInt(5);
			int seat_plot=rs.getInt(6);
			int mo_code = rs.getInt(7);
			StimeVO stimevo=new StimeVO(t_id, scr_stime, scr_etime, scr_date, scr_id, seat_plot, mo_code); 
			stimelist.add(stimevo);
		}rs.close();
		return stimelist;
	}
	
	public ArrayList<String> mo_nameDate(String getMo_name) throws SQLException{
		ArrayList<String> sdatelist= new ArrayList<String>();
		
		String sql= "select distinct t_date from stime s "
				+ "join movie m on m.mo_code=s.mo_code "
				+ "where m.mo_name=?";
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1,getMo_name);
		rs=pstmt.executeQuery();
		while(rs.next()) {
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			String scr_date = dateFormat.format(rs.getDate(1));
			sdatelist.add(scr_date);
		}rs.close();
		return sdatelist;
	}
	
	//삭제
	public boolean stimeDelete(int t_id) throws SQLException {
		String sql = "DELETE stime WHERE t_id = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, t_id);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	public boolean stimeUpdate(int t_id1,String scr_date, String scr_stime, String scr_etime, int scr_id, int mo_code) throws SQLException {
		
		String sql 
		="update stime set t_date=?, t_stime=?, t_etime=?,scr_id=?,mo_code=? where t_id=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			
			//변경 될 데이터
			pstmt.setString(1, scr_date);
			pstmt.setString(2, scr_stime);
			pstmt.setString(3, scr_etime);
			pstmt.setInt(4,scr_id);
			pstmt.setInt(5,mo_code);
			//원래 들어있던 데이터
			pstmt.setInt(6,t_id1);
			
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	public boolean seatUpdate(int seat_plot,int t_id) throws SQLException {
		
		String sql 
		="update stime set seat_plot=seat_plot+? where t_id=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, seat_plot);
			pstmt.setInt(2, t_id);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	public StimeVO getInfo(int t_id1) throws SQLException {
		StimeVO svo = null;
		String sql = "select * from stime where t_id = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, t_id1);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			int t_id =rs.getInt(1);
			String scr_stime1=rs.getString(2);
			String scr_etime=rs.getString(3);
			Date scr_date=rs.getDate(4);
			int scr_id = rs.getInt(5);
			int seat_plot=rs.getInt(6);
			int mo_code = rs.getInt(7);
			svo=new StimeVO(t_id, scr_stime1, scr_etime, scr_date, scr_id, seat_plot, mo_code); 
		}else {
			svo = null;
		}
		return svo;
	}

	public ArrayList<UserServiceVO> getInfotodate(String getT_date, String getMo_name) throws SQLException {
	    ArrayList<UserServiceVO> ulist = new ArrayList<>();
	    String sql = "SELECT st.scr_id, st.t_stime, st.t_date, mo.mo_name,t_id "
	    		+ "FROM stime st "
	    		+ "JOIN movie mo ON st.mo_code = mo.mo_code "
	    		+ "WHERE to_char(st.t_date, 'YYYY-MM-DD') = ? "
	    		+ "  AND mo.mo_name = ?"
	    		+ " order by scr_id, t_stime";
	    pstmt = con.prepareStatement(sql);
	    pstmt.setString(1, getT_date);
	    pstmt.setString(2, getMo_name);
	    rs = pstmt.executeQuery();
	    try {
	        if (rs != null) {
	            while (rs.next()) {
	                int scr_id = rs.getInt(1);
	                String t_stime = rs.getString(2);
	                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	                String t_date = dateFormat.format(rs.getDate(3));
	                String mo_name = rs.getString(4);
	                int t_id = rs.getInt(5);
	                UserServiceVO uvo = new UserServiceVO(scr_id, t_stime, t_date,mo_name,t_id);
	                ulist.add(uvo);
	            }
	        }
	    } finally {
	        if (rs != null) {
	            rs.close();
	        }
	        pstmt.close();
	    }
	    return ulist;
	}
	
	public UserServiceVO getDate_scr(int gett_id) throws SQLException {
		UserServiceVO uvo= null;
		String sql = "select * from stime where t_id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, gett_id);
		rs = pstmt.executeQuery();
		try {
			if (rs != null) {
				while (rs.next()) {
					String t_stime = rs.getString(2);
					SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
					String t_date = dateFormat.format(rs.getDate(4));
					int scr_id = rs.getInt(5);
					int mo_code = rs.getInt(7);
					 uvo = new UserServiceVO(scr_id, t_stime, t_date,mo_code);
				}
			}return uvo;
		} finally {
			if (rs != null) {
				rs.close();
			}
			pstmt.close();
		}
	}

	
	public ArrayList<String> searchdate(String mo_name) {
		ArrayList<String> modatelist = new ArrayList<>();
		String sql="select t_date from stime s"
				+ " join movie m on s.mo_code=m.mo_code"
				+ " where m.mo_name=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mo_name);
			pstmt.executeQuery();
			while(rs.next()) {
				String modate = rs.getString(1);
				modatelist.add(modate);
			}

		} catch (SQLException e) {
			e.printStackTrace();
			return modatelist;
		}
		return modatelist;
	}
	
	public boolean UpdateToMocode(int getMo_code, int getT_id) {
		String sql 
		="update stime set mo_code=? where t_id=? and mo_code is not null";
		
		try {
			pstmt = con.prepareStatement(sql);
			
			//변경 될 데이터
			pstmt.setInt(1, getMo_code);
			pstmt.setInt(2, getT_id);
			
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	
	public int getT_id(String mo_name, String date, String stime, int scr_id) throws SQLException {
	      int t_id = 0;
	      String sql = "SELECT s.t_id " + "FROM movie m " + "JOIN stime s ON m.mo_code = s.mo_code "
	            + "WHERE m.mo_name = ? " + "and to_char(s.t_date, 'YYYY-MM-DD') = ? "
	            + "  AND s.t_stime = ? " + "  AND s.scr_id = ?";
	      pstmt = con.prepareStatement(sql);
	      pstmt.setString(1, mo_name);
	      pstmt.setString(2, date);
	      pstmt.setString(3, stime);
	      pstmt.setInt(4, scr_id);
	      rs = pstmt.executeQuery();
	      try {
	         if (rs.next()) {
	            t_id = rs.getInt(1);
	         }
	      } catch (Exception e) {
	         e.printStackTrace();return t_id;
	      }return t_id;
	   }

}
