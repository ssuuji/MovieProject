package DAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.sql.Timestamp;

import Conn.Connect;
import VO.RevVO;
import VO.MemberVO;
import VO.MovieVO;

public class RevDAO {
	private Connection con;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public RevDAO() throws ClassNotFoundException, SQLException{
		con = new Connect().getConnection(); 
}

	
	public ArrayList<RevVO> RgetAllinfo() throws SQLException  {
		ArrayList<RevVO> rarray = new ArrayList<RevVO>();
		String sql = "select r.*, m.mo_name from review r, movie m where r.mo_code=m.mo_code";
//		String sql = "select * from review order by rev_id desc";
		
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while(rs.next()) {
			int rev_id = rs.getInt("rev_id");
			int mo_code = rs.getInt("mo_code");
			String mo_name = rs.getString("mo_name");
			Date write_date = rs.getDate("write_date");
			String rev_contents = rs.getString("rev_contents");
			String m_id = rs.getString("m_id");
			
			RevVO rvo = new RevVO(rev_id, mo_code, mo_name,write_date, rev_contents, m_id);
			
			rarray.add(rvo);
			
		}
		return rarray;
	}


	public RevVO search(int rev_id2)throws SQLException  {

		RevVO rv1=null;
		String sql = "select r.*,m.mo_name from review r,movie m where rev_id =? and r.mo_code=m.mo_code";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, rev_id2);
		rs = pstmt.executeQuery();
		if(rs.next()) {
			int rev_id = rs.getInt(1);
			int mo_code = rs.getInt(2);
			String mo_name = rs.getString("mo_name");
			Date write_date = rs.getDate(3);
			String rev_contents = rs.getString(4);
			String m_id = rs.getString(5);
			
			
			rv1 = new RevVO(rev_id,mo_code,mo_name,write_date,rev_contents,m_id);
		}else {
			rv1 = null;
		}
		return rv1;	
	}
	

	
	

//�߰�
	public ArrayList<RevVO> getReviewMovieCode(int movieCode) throws SQLException {
	    ArrayList<RevVO> revList = new ArrayList<>();
	    String sql = "select r.*, m.mo_name from review r, movie m where r.mo_code=m.mo_code and r.mo_code=?";
	    pstmt = con.prepareStatement(sql);
	    pstmt.setInt(1, movieCode);
	    rs = pstmt.executeQuery();
	    while (rs.next()) {
	        int rev_id = rs.getInt("rev_id");
	        int mo_code = rs.getInt("mo_code");
	        String mo_name = rs.getString("mo_name");
	        Date write_date = rs.getDate("write_date");
	        String rev_contents = rs.getString("rev_contents");
	        String m_id = rs.getString("m_id");
	        
	        RevVO revVO = new RevVO(rev_id, mo_code,mo_name, write_date, rev_contents, m_id);
	        revList.add(revVO);
	    }
	    return revList;
	}


	public boolean delete(int rev_id) throws SQLException{
		
		String sql = "DELETE FROM review WHERE rev_id = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, rev_id);
		pstmt.executeUpdate();
		return true;
	}




public boolean insert(int mo_code ,String m_id, String rev_contents) throws SQLException {
		
		String sql = "INSERT INTO review VALUES(rev_seq.NEXTVAL,?,sysdate,?,?)";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, mo_code);
		pstmt.setString(2, rev_contents);
		pstmt.setString(3, m_id);
		pstmt.executeUpdate();
		return true;
}
				
public boolean update( String rev_contents1,int rev_id1, int mo_code1, String m_id1) throws SQLException {

    String sql = "UPDATE review SET rev_contents=? WHERE rev_id=? AND mo_code=? AND m_id=?";
    
    pstmt = con.prepareStatement(sql);
    pstmt.setString(1, rev_contents1);
  
    pstmt.setInt(2, rev_id1);
    pstmt.setInt(3, mo_code1);
    pstmt.setString(4, m_id1);
    pstmt.executeUpdate();
    return true;
}
}