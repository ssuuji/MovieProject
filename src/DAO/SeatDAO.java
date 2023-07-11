package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Conn.Connect;

public class SeatDAO {
	
	private Connection con;
	private  PreparedStatement pstmt = null;
	private  ResultSet rs = null;

	public SeatDAO() throws ClassNotFoundException, SQLException {
	      con = new Connect().getConnection();
	}
	
	      public boolean insert_seat( int t_id, String rseat, String m_id) throws SQLException {
	    	  String sql = "insert into seat values (seat_seq.nextval,?,?,?)";
	    	  try {
	    	  pstmt = con.prepareStatement(sql);
	    	  pstmt.setInt(1, t_id);
	    	  pstmt.setString(2, rseat);
	    	  pstmt.setString(3, m_id);
	    	  pstmt.executeUpdate();
	    	  }catch(SQLException e) {
	    		  e.printStackTrace();
	    		  return false;
	    	  }
	    	  return true;
	   }
	      
	      public String[] getRseat(int getT_id) throws SQLException {
	    	    List<String> rseatlist = new ArrayList<>(); // ArrayList로 변경

	    	    String sql = "SELECT rseat FROM seat WHERE t_id=?";
	    	    pstmt = con.prepareStatement(sql);
	    	    pstmt.setInt(1, getT_id);
	    	    rs = pstmt.executeQuery();

	    	    while (rs.next()) {
	    	        String rseat = rs.getString("rseat");
	    	        rseatlist.add(rseat); // ArrayList에 추가
	    	    }

	    	    rs.close();
	    	    return rseatlist.toArray(new String[0]); // 배열로 변환하여 반환
	    	}
	      
	  	public boolean cancelBookSeat(int t_id,String m_id) throws SQLException {
			String sql = "delete from seat where t_id=? and m_id=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, t_id);
			pstmt.setString(2, m_id);
			pstmt.executeUpdate();
			return true;
		}
	      
	
	
}
