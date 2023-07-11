package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Conn.Connect;
import VO.MemberVO;

//회원 DAO
public class MemberDAO {
	private Connection con;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	public MemberDAO() throws ClassNotFoundException, SQLException{
		con=new Connect().getConnection(); 
	}
	
	
	/*
 		회원 전체 조회
	*/	
	public ArrayList<MemberVO> memberSearch() throws SQLException{
		ArrayList<MemberVO> memberlist= new ArrayList<MemberVO>();
		
		String sql= "select * from member";
		
		pstmt=con.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()) {

			
			String m_id=rs.getString(1);
			String m_pw=rs.getString(2);
			String m_name=rs.getString(3);
			String m_tel=rs.getString(4);
			String m_email=rs.getString(5);
			
			
			MemberVO membervo=new MemberVO(m_id, m_pw, m_name,m_tel,m_email); 
			memberlist.add(membervo);
		}
		return memberlist;
	}
	

	public MemberVO getInfo(String m_id) throws SQLException {
		MemberVO svo = null;
		String sql = "select * from member where m_id = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, m_id);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			String m_id1=rs.getString(1);
			String m_pw=rs.getString(2);
			String m_name=rs.getString(3);
			String m_tel=rs.getString(4);
			String m_email=rs.getString(5);
			svo = new MemberVO( m_id1, m_pw, m_name,m_tel,m_email);
		}else {
			svo = null;
		}
		return svo;
	}
	
	public boolean memberUpdate(String m_id, String m_pw, String m_name, String m_tel, String m_email, String m_id2) throws SQLException {
		
		/*
		 * String sql ="update member2 set m_id=?, m_pw=?, m_name=?, m_tel=?,m_email=?
		 * where m_id=?;
		 */
		String sql 
		="update member set m_id=?, m_pw=?, m_name=?, m_tel=?,m_email=? where m_id=?";
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, m_id);
			pstmt.setString(2, m_pw);
			pstmt.setString(3, m_name);
			pstmt.setString(4, m_tel);
			pstmt.setString(5, m_email);
			
			pstmt.setString(6, m_id2);
			
			pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	public boolean memberUpdate(String m_id, String m_pw, String m_name, String m_tel, String m_email) throws SQLException {
		String sql 
		="update member set m_pw=?, m_tel=?,m_email=? where m_id=?";
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(4, m_id);
			pstmt.setString(1, m_pw);
			pstmt.setString(4, m_tel);
			pstmt.setString(5, m_email);
			
			
			pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	public boolean memberinsert(String m_id, String m_pw , String m_name, String m_tel, String m_email) throws SQLException {
	      String sql = "insert into member values(?,?,?,?,?)";

	      
	      pstmt = con.prepareStatement(sql); 
	      pstmt.setString(1, m_id);
	      pstmt.setString(2, m_pw);
	      pstmt.setString(3, m_name);
	      pstmt.setString(4, m_tel);
	      pstmt.setString(5, m_email);
	      
	      pstmt.executeUpdate();
	      return true;
	   }
	// 회원가입시 아이디 검증
	public boolean idCheck(String m_id) throws SQLException{
		String sql = "select * from member where m_id = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, m_id);                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
		rs = pstmt.executeQuery();
		
		if(!rs.next()) {
			return false;
		}
		return true;
	}
	



public boolean memberdelete(String m_id1) throws SQLException {
      
      String sql = "delete from member where m_id=? ";
      try {
      pstmt = con.prepareStatement(sql);
      pstmt.setString(1, m_id1);
      pstmt.executeUpdate();
      }catch(SQLException e ) {
    	  e.printStackTrace();
      }
      return true;
   }

}
