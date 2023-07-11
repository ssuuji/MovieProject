package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Conn.Connect;
import VO.AdminboardVO;

public class AdminboardDAO {
	private Connection con;
	PreparedStatement pstmt = null;
	ResultSet rs=null;
	
	public AdminboardDAO() throws ClassNotFoundException, SQLException{
		con= new Connect().getConnection();
	}
	
public ArrayList<AdminboardVO> getAllInfo() throws SQLException {
		
		ArrayList<AdminboardVO> sarray = new ArrayList<AdminboardVO>();
		
		String sql = "select * from abbs order by abbsID desc";
		
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			int abbsID = rs.getInt(1);
			String abbsTitle = rs.getString(2);
			String adminID = rs.getString(3);
			String abbsDate = rs.getString(4);
			String abbsContent = rs.getString(5);
			int abbsAvailable =rs.getInt(6);
			
			AdminboardVO sv1 = new AdminboardVO(abbsID,abbsTitle,adminID,abbsDate,abbsContent,abbsAvailable);
			
			sarray.add(sv1);
		}
		return sarray;
	}

public AdminboardVO searchOne(int bunho2) throws SQLException {
	
	AdminboardVO sv1 = null;
	
	String sql = "select * from abbs where abbsID = ?";
	
	pstmt = con.prepareStatement(sql);
	pstmt.setInt(1, bunho2);
	rs = pstmt.executeQuery();
	
	if(rs.next()) {
		int abbsID = rs.getInt(1);
		String abbsTitle = rs.getString(2);
		String adminID = rs.getString(3);
		String abbsDate = rs.getString(4);
		String abbsContent = rs.getString(5);
		int abbsAvailable =rs.getInt(6);
		
		sv1 = new AdminboardVO(abbsID,abbsTitle,adminID,abbsDate,abbsContent,abbsAvailable);
		
	} else {
		sv1 = null;
	}
	
	return sv1;	
}
public boolean insert(String abbsTitle, String adminID, String abbsContent) throws SQLException{
	String SQL = "INSERT INTO aBBS VALUES (?, ?, ?, ?, ?, ?)";

		PreparedStatement pstmt = con.prepareStatement(SQL);
		pstmt.setInt(1, getNext());
		pstmt.setString(2, abbsTitle);
		pstmt.setString(3, adminID);
		pstmt.setDate(4, new java.sql.Date(System.currentTimeMillis()));
		pstmt.setString(5, abbsContent);
		pstmt.setInt(6, 1);
		
		pstmt.executeUpdate();
		
		return true;
}
public int getNext() {
	String SQL = "SELECT abbsID FROM aBBS ORDER BY abbsID DESC";
	try {
		PreparedStatement pstmt = con.prepareStatement(SQL);
		rs = pstmt.executeQuery();
		if (rs.next()) {
			return rs.getInt(1) + 1;
		}
		return 1;
	}catch(Exception e) {
		e.printStackTrace();
	}
	return -1; //DB 오류 
}

public boolean update(String abbsTitle, String adminID, String abbsContent, int abbsID1) throws SQLException {
	
	String sql = "update abbs set abbsTitle=?, adminID=?, abbsContent=? where abbsID=?";
	
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, abbsTitle);
	pstmt.setString(2, adminID);
	pstmt.setString(3, abbsContent);
	pstmt.setInt(4, abbsID1);
	pstmt.executeUpdate();
	return true;
}

public boolean admindelete(int abbsID) throws SQLException {
	   
	   String sql = "delete from abbs where abbsID=?";
	   
	   pstmt = con.prepareStatement(sql);
	   pstmt.setInt(1, abbsID);
	   pstmt.executeUpdate();
	   
	   return true;
	}



}
