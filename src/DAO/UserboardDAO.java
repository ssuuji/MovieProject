package DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Conn.Connect;
import VO.AdminboardVO;
import VO.UserboardVO;

public class UserboardDAO {
	
	private Connection con;
	PreparedStatement pstmt = null;
	ResultSet rs=null;
	
	public UserboardDAO() throws ClassNotFoundException, SQLException{
		con= new Connect().getConnection();
	}
	
public ArrayList<UserboardVO> getAllInfo() throws SQLException {
		
		ArrayList<UserboardVO> sarray = new ArrayList<UserboardVO>();
		
		String sql = "select * from bbs order by BbsID desc";
		
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			int bbsID = rs.getInt(1);
			String bbsTitle = rs.getString(2);
			String userID = rs.getString(3);
			String bbsDate = rs.getString(4);
			String bbsContent = rs.getString(5);
			int bbsAvailable =rs.getInt(6);
			
			UserboardVO sv1 = new UserboardVO(bbsID,bbsTitle,userID,bbsDate,bbsContent,bbsAvailable);
			
			sarray.add(sv1);
		}
		return sarray;
	}
public ArrayList<UserboardVO> getMy(String m_id) throws SQLException {
	ArrayList<UserboardVO> sarray = new ArrayList<UserboardVO>();
	String sql = "select * from bbs where userID=? order by BbsID desc ";
	
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1,m_id);
	rs = pstmt.executeQuery();
	while(rs.next()) {
		int bbsID = rs.getInt(1);
		String bbsTitle = rs.getString(2);
		String userID = rs.getString(3);
		String bbsDate = rs.getString(4);
		String bbsContent = rs.getString(5);
		int bbsAvailable =rs.getInt(6);
		
		UserboardVO sv1 = new UserboardVO(bbsID,bbsTitle,userID,bbsDate,bbsContent,bbsAvailable);
		
		sarray.add(sv1);
	}
	return sarray;
}
public int getNext() {
	String SQL = "SELECT bbsID FROM BBS ORDER BY bbsID DESC";
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
public boolean insert(String bbsTitle, String userID, String bbsContent) throws SQLException{
	String SQL = "INSERT INTO BBS VALUES (?, ?, ?, ?, ?, ?)";

		PreparedStatement pstmt = con.prepareStatement(SQL);
		pstmt.setInt(1, getNext());
		pstmt.setString(2, bbsTitle);
		pstmt.setString(3, userID);
		pstmt.setDate(4, new java.sql.Date(System.currentTimeMillis()));
		pstmt.setString(5, bbsContent);
		pstmt.setInt(6, 1);
		
		pstmt.executeUpdate();
		
		return true;
}

public UserboardVO searchOne(int bunho2) throws SQLException {
	
	UserboardVO sv1 = null;
	
	String sql = "select * from bbs where bbsID = ?";
	
	pstmt = con.prepareStatement(sql);
	pstmt.setInt(1, bunho2);
	rs = pstmt.executeQuery();
	
	if(rs.next()) {
		int bbsID = rs.getInt(1);
		String bbsTitle = rs.getString(2);
		String userID = rs.getString(3);
		String bbsDate = rs.getString(4);
		String bbsContent = rs.getString(5);
		int bbsAvailable =rs.getInt(6);
		
		sv1 = new UserboardVO(bbsID,bbsTitle,userID,bbsDate,bbsContent,bbsAvailable);
		
	} else {
		sv1 = null;
	}
	
	return sv1;	
}
public boolean update(String bbsTitle1, String userID1, String bbsContent1, int bbsID1) throws SQLException {
	
	String sql = "update bbs set bbsTitle=?, userID=?, bbsContent=? where bbsID=?";
	
	pstmt = con.prepareStatement(sql);
	pstmt.setString(1, bbsTitle1);
	pstmt.setString(2, userID1);
	pstmt.setString(3, bbsContent1);
	pstmt.setInt(4, bbsID1);
	pstmt.executeUpdate();
	return true;
}

public boolean delete(int bunho1) throws SQLException {
	
	String sql = "delete from bbs where bbsID=?";
	
	pstmt = con.prepareStatement(sql);
	pstmt.setInt(1, bunho1);
	pstmt.executeUpdate();
	
	return true;
}





}
