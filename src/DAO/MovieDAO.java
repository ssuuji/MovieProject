package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Conn.Connect;
import VO.MemberVO;
import VO.MovieVO;

public class MovieDAO {
	private Connection con;

	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public MovieDAO() throws ClassNotFoundException, SQLException {
		con = new Connect().getConnection();
	}
	

	// 영화 등록
	public boolean insert_movie(int mo_code, String mo_name, String mo_info, String mo_post, String mo_run,
			String mo_type, String mo_open, String mo_age, String mo_dirname, String mo_actname) throws SQLException {
		String sql = "insert into Movie values (?,?,?,?,?,?,?,?,?,?)";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, mo_code);
			pstmt.setString(2, mo_name);
			pstmt.setString(3, mo_info);
			pstmt.setString(4, mo_post);
			pstmt.setString(5, mo_run);
			pstmt.setString(6, mo_type);
			pstmt.setString(7, mo_open);
			pstmt.setString(8, mo_age);
			pstmt.setString(9, mo_dirname);
			pstmt.setString(10, mo_actname);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			return false;
		}
		return true;
	}

	// 영화 삭제
	public boolean delete_movie(int mo_code) throws SQLException {
		String sql = "delete from movie where mo_code=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, mo_code);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

	// 등록된 모든 영화 조회
	public ArrayList<MovieVO> getAllInfo() throws SQLException {
		ArrayList<MovieVO> moalist = new ArrayList<MovieVO>();
		String sql = "select * from movie";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			int mo_code = rs.getInt(1);
			String mo_name = rs.getString(2);
			String mo_info = rs.getString(3);
			String mo_post = rs.getString(4);
			String mo_run = rs.getString(5);
			String mo_type = rs.getString(6);
			String mo_open = rs.getString(7);
			String mo_age = rs.getString(8);
			String mo_dirname = rs.getString(9);
			String mo_actname= rs.getString(10);
			MovieVO mvo = new MovieVO(mo_code, mo_name, mo_info, mo_post, mo_run, mo_type, mo_open, mo_age, mo_dirname, mo_actname);
			moalist.add(mvo);
		}rs.close();
		return moalist;
	}
	
	// 영화 코드를 이용하여 영화정보 불러오기
	public MovieVO getMoInfoOne(int getmo_code) throws SQLException {
		MovieVO mvo=null;
		String sql="select * from movie"
				+ " where mo_code=?";
		pstmt=con.prepareStatement(sql);
		pstmt.setInt(1, getmo_code);
		rs=pstmt.executeQuery();
		if(rs.next()) {
			int mo_code = rs.getInt(1);
			String mo_name = rs.getString(2);
			String mo_info = rs.getString(3);
			String mo_post = rs.getString(4);
			String mo_run = rs.getString(5);
			String mo_type = rs.getString(6);
			String mo_open = rs.getString(7);
			String mo_age = rs.getString(8);
			String mo_dirname = rs.getString(9);
			String mo_actname= rs.getString(10);
			mvo=new MovieVO(mo_code, mo_name, mo_info, mo_post, mo_run, mo_type, mo_open, mo_age, mo_dirname, mo_actname);
		}else {
			mvo=null;
		}
		return mvo;
		
		
	}
	
	// 영화 정보 수정 (모든 항목)
	public boolean update_movie(int mo_code, String mo_name, String mo_info, String mo_post, String mo_run,
			String mo_type, String mo_open, String mo_age, String mo_dirname, String mo_actname) throws SQLException {
		
		String sql= "update movie set mo_name=?,mo_info=?, mo_post=?, mo_run=?, mo_type=?, mo_open=?, mo_age=?,"
				+ "mo_dirname=?,mo_actname=? where mo_code=?";
			       
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mo_name);
			pstmt.setString(2, mo_info);
			pstmt.setString(3, mo_post);
			pstmt.setString(4, mo_run);
			pstmt.setString(5, mo_type);
			pstmt.setString(6, mo_open);
			pstmt.setString(7, mo_age);
			pstmt.setString(8, mo_dirname);
			pstmt.setString(9, mo_actname);
			pstmt.setInt(10, mo_code);
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
	
	// 영화이름으로 포스터 검색
	public String getPost(String getMo_name) throws SQLException {
		String sql= "select mo_post from movie where mo_name=?";
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1, getMo_name);
		rs=pstmt.executeQuery();
		String url=null;
		if(rs.next()) {
			url=rs.getString(1);
			return url;
		}return url;
	}

}
