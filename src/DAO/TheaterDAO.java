package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Conn.Connect;
import VO.TheaterVO;

//영화관 DAO
public class TheaterDAO {
	private Connection con;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	public TheaterDAO() throws ClassNotFoundException, SQLException{
		con=new Connect().getConnection(); 
	}
	
	/*
	 	영화관 추가
	*/
	public boolean theInsert(int th_id, String th_name, String th_addr, String th_tel) throws SQLException{
		
		String sql = "insert into theater values(?,?,?,?)";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, th_id);
			pstmt.setString(2, th_name);
			pstmt.setString(3, th_addr);
			pstmt.setString(4, th_tel);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
		
	/*
 		영화관 전체 조회
	*/	
	public ArrayList<TheaterVO> theSearch() throws SQLException{
		ArrayList<TheaterVO> thealist= new ArrayList<TheaterVO>();
		
		String sql= "select * from theater";
		
		pstmt=con.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()) {
			int th_id=Integer.parseInt(rs.getString(1));
			String th_name=rs.getString(2);
			String th_addr=rs.getString(3);
			String th_tel=rs.getString(4);

			TheaterVO thevo=new TheaterVO(th_id, th_name, th_addr, th_tel); 
			thealist.add(thevo);
		}rs.close();
		return thealist;
	}
	
	/*
		영화관 조회 ( 하나만 )
	*/
	public TheaterVO getInfo(int th_id) throws SQLException {
		TheaterVO tvo = null;
		
		String sql = "select * from theater where th_id = ?";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, th_id);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			int th_id1 = rs.getInt(1);
			String th_name = rs.getString(2);
			String th_addr = rs.getString(3);
			String th_tel = rs.getString(4);
			tvo = new TheaterVO(th_id1,th_name,th_addr,th_tel);
		}else {
			tvo = null;
		}
		return tvo;
	}
	public int getTh_id(String th_name) throws SQLException {
		int th_id1=0;
		String sql = "select th_id from theater where th_name=?";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, th_name);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			 th_id1 = rs.getInt(1);
		}else {
			return th_id1;
		}
		return th_id1;
	}
	
	/*
	 	영화관 수정
	*/
	public boolean theUpdate( int th_id, String th_name, String th_addr, String th_tel, int th_id2) throws SQLException {
		
		String sql 
		="update theater set th_id=?, th_name=?, th_addr=?,th_tel=? where th_id=?";
		
		try {
			pstmt = con.prepareStatement(sql);
			
			//변경 될 데이터
			pstmt.setInt(1, th_id);
			pstmt.setString(2, th_name);
			pstmt.setString(3, th_addr);
			pstmt.setString(4, th_tel);
			//원래 들어있던 데이터
			pstmt.setInt(5, th_id2);
			
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	/*
 		영화관 삭제
 		: id를 입력해서 삭제
	*/
	public boolean theDelete(int th_id) throws SQLException {
		String sql = "DELETE theater WHERE th_id = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, th_id);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}		return true;
		
	}

}
