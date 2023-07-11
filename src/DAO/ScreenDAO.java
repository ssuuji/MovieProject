package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Conn.Connect;
import VO.ScreenVO;

public class ScreenDAO {
	private Connection con;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	public ScreenDAO() throws ClassNotFoundException, SQLException {
		con = new Connect().getConnection();
	}

	public void pstmtClose() throws SQLException {
		if (pstmt != null) {
			pstmt.close();
		}
	}

	public void getAllInfoClose() throws SQLException {
		if (rs != null) {
			rs.close();
		}
		if (pstmt != null) {
			pstmt.close();
		}
		if (con != null) {
			con.close();
		}
	}

	public ArrayList<ScreenVO> getAllInfo() throws SQLException {
		ArrayList<ScreenVO> sArray = new ArrayList<ScreenVO>();
		String sql = "SELECT * FROM screen ORDER BY scr_id";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			int scr_id = rs.getInt("scr_id");
			int th_id = rs.getInt("th_id");
			int scr_tot = rs.getInt("scr_tot");

			ScreenVO svo = new ScreenVO(scr_id, th_id, scr_tot);
			sArray.add(svo);
		}
		return sArray;
	}

	public boolean update_nametel(int scr_id1, int th_id1, int scr_tot1, int scr_id2) throws SQLException {

		String sql = "UPDATE screen SET src_id=?, th_id=?,scr_tot=? WHERE scr_id=? ";

		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, scr_id1);
		pstmt.setInt(2, th_id1);
		pstmt.setInt(3, scr_tot1);
		pstmt.setInt(4, scr_id2);
		pstmt.executeUpdate();
		return true;
	}

	
	  public boolean update_all (int scr_id ,int th_id, int scr_tot, int scr_id2 ) throws SQLException {
	 
	  String sql =
	  "UPDATE screen SET scr_id=?, th_id=?,scr_tot=? where scr_id=? ";
	  
	  
	  
	  pstmt = con.prepareStatement(sql); 
	  pstmt.setInt(1, scr_id); 
	  pstmt.setInt(2, th_id); 
	  pstmt.setInt(3, scr_tot); 
	  pstmt.setInt(4, scr_id2); 
	  pstmt.executeUpdate();
	 return true; }
	 

	public ScreenVO getInfo(int scr_id2) throws SQLException {
		ScreenVO svo = null;
		String sql = "SELECT * FROM screen where scr_id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, scr_id2);
		rs = pstmt.executeQuery();
		if (rs.next()) {
			int scr_id = rs.getInt("scr_id");
			int th_id = rs.getInt("th_id");
			int scr_tot = rs.getInt("scr_tot");
			svo = new ScreenVO(scr_id, th_id, scr_tot);
		} else {
			svo = null;
		}
		return svo;
	}

	public boolean insert_nametel(int scr_id, int th_id, int scr_tot) throws SQLException {
		String sql = "insert into screen values(?,?,?)";

		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, scr_id);
		pstmt.setInt(2, th_id);
		pstmt.setInt(3, scr_tot);
		pstmt.executeUpdate();
		return true;
	}

	public boolean delete_nametel(int scr_id) throws SQLException {
		String sql = "delete screen WHERE scr_id=?";

		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, scr_id);
		pstmt.executeUpdate();
		return true;
	}

}
