package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Conn.Connect;
import VO.BookServiceVO;
import VO.BookVO;

public class BookDAO {
	private Connection con;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	public BookDAO() throws ClassNotFoundException, SQLException {
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

	public ArrayList<BookVO> getAllInfo() throws SQLException {
		ArrayList<BookVO> bArray = new ArrayList<BookVO>();
		String sql = "SELECT * FROM book ORDER BY book_id";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			int book_id = rs.getInt("book_id");
			int mo_code = rs.getInt("mo_code");
			String m_id = rs.getString("m_id");
			int th_id = rs.getInt("th_id");
			int t_id = rs.getInt("t_id");
			int book_cnt = rs.getInt("book_cnt");
			int price = rs.getInt("price");
			String state = rs.getString("state");

			BookVO bvo = new BookVO(book_id, mo_code, m_id, th_id, t_id, book_cnt, price, state);
			bArray.add(bvo);
		}
		return bArray;
	}

	public boolean update_nametel(int book_id1, int mo_code1, String m_id1, String seat_id1, int th_id1,
			String t_stime1, int book_cnt1, int price1) throws SQLException {

		String sql = "UPDATE book SET book_id =?, mo_code=?, m_id=?, seat_id=?, seat_id=?, th_id=?, t_stime=?, book_cnt=?, price=? WHERE book_id=? ";

		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, book_id1);
		pstmt.setInt(2, mo_code1);
		pstmt.setString(3, m_id1);
		pstmt.setString(4, seat_id1);
		pstmt.setInt(5, th_id1);
		pstmt.setString(6, t_stime1);
		pstmt.setInt(7, book_cnt1);
		pstmt.setInt(8, price1);
		pstmt.executeUpdate();
		return true;
	}

	public boolean update_all(int book_id, int mo_code, String m_id, String seat_id, int th_id, String t_stime,
			int book_cnt, int price, int book_id2) throws SQLException {

		String sql = "UPDATE book SET  mo_code=?, m_id=?,  seat_id=?, th_id=?, t_stime=?, book_cnt=?, price=? WHERE book_id=?  ";
		pstmt = con.prepareStatement(sql);

		pstmt.setInt(1, mo_code);
		pstmt.setString(2, m_id);
		pstmt.setString(3, seat_id);
		pstmt.setInt(4, th_id);
		pstmt.setString(5, t_stime);
		pstmt.setInt(6, book_cnt);
		pstmt.setInt(7, price);
		pstmt.setInt(8, book_id);
		pstmt.executeUpdate();
		return true;
	}

	public BookVO getInfo(int book_id2) throws SQLException {
		BookVO bvo = null;
		String sql = "SELECT * FROM book where book_id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, book_id2);
		rs = pstmt.executeQuery();
		if (rs.next()) {
			int book_id = rs.getInt("book_id");
			int mo_code = rs.getInt("mo_code");
			String m_id = rs.getString("m_id");
			int th_id = rs.getInt("th_id");
			int t_id = rs.getInt("t_id");
			int book_cnt = rs.getInt("book_cnt");
			int price = rs.getInt("price");
			String state = rs.getString("state");

			bvo = new BookVO(book_id, mo_code, m_id, th_id, t_id, book_cnt, price, state);
		} else {
			bvo = null;
		}
		return bvo;
	}
	public boolean bookUpdate(int book_id) throws SQLException { //어드민 예매 취소
		
	    String sql = "update book set  state='N' where book_id=?";
	    
	    try {
	        pstmt = con.prepareStatement(sql);
	        
	        pstmt.setInt(1, book_id);
	        
	        pstmt.executeUpdate();
	        
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return false;
	    }
	    return true;
	}
	  public boolean insert_nametel( int book_id,int mo_code, String m_id,int th_id,
			   int t_id, int book_cnt, int price,String revdate) throws SQLException {
		      String sql = "insert into book values(?,?,?,?,?,?,?,?,'Y')";
		           pstmt = con.prepareStatement(sql);
		           try {
		           pstmt.setInt(1, book_id);
		         pstmt.setInt(2, mo_code);
		         pstmt.setString(3, m_id );
		         pstmt.setInt(4, th_id);
		         pstmt.setInt(5, t_id);
		         pstmt.setString(6,revdate);
		         pstmt.setInt(7, book_cnt);
		         pstmt.setInt(8, price);
		         pstmt.executeUpdate();}
		           catch(Exception e) {
		              e.printStackTrace();
		           }
		      return true;
		   }

	public boolean delete_nametel(int book_id) throws SQLException {
		String sql = "delete from book where book_id=?";

		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, book_id);
		pstmt.executeUpdate();
		return true;
	}

	public ArrayList<BookServiceVO> getInfoY(String m_id) throws SQLException {
		ArrayList<BookServiceVO> bArray = new ArrayList<BookServiceVO>();
		String sql = "SELECT b.book_id, b.book_date,b.t_id, s.t_stime,s.t_date, s.t_etime, s.scr_id, b.book_cnt, b.price, m.mo_name, m.mo_post, t.th_name, b.state, "
				+ "				LISTAGG(se.rseat, ', ') WITHIN GROUP (ORDER BY se.rseat) AS seats "
				+ "				FROM book b " + "				JOIN stime s ON b.t_id = s.t_id "
				+ "				JOIN movie m ON b.mo_code = m.mo_code "
				+ "				JOIN seat se ON b.t_id = se.t_id "
				+ "				JOIN theater t ON b.th_id = t.th_id "
				+ "				WHERE b.m_id = ? AND b.state = 'Y' "
				+ "				GROUP BY b.book_id, b.t_id,b.book_date,s.t_date, s.t_stime, s.t_etime, s.scr_id, b.book_cnt, b.price, m.mo_name, m.mo_post, t.th_name, b.state";

		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, m_id);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			int book_id = rs.getInt("book_id");
			String book_date = rs.getString("book_date");
			String stime = rs.getString("t_stime");
			String etime = rs.getString("t_etime");
			int scr_id = rs.getInt("scr_id");
			int book_cnt = rs.getInt("book_cnt");
			int price = rs.getInt("price");
			String moname = rs.getString("mo_name");
			String post = rs.getString("mo_post");
			String th_name = rs.getString("th_name");
			String state = rs.getString("state");
			String seats = rs.getString("seats");
			String t_date = rs.getString("t_date");
			int t_id = rs.getInt("t_id");
			BookServiceVO bvo = new BookServiceVO(book_id, stime, etime, scr_id, book_cnt, price, moname, post, seats,
					th_name, book_date, state, t_date, t_id);
			bArray.add(bvo);

		}
		return bArray;
	}

	public ArrayList<BookServiceVO> getInfoN(String m_id) throws SQLException {
		ArrayList<BookServiceVO> bArray = new ArrayList<BookServiceVO>();
		String sql = "SELECT b.book_id, b.book_date,b.t_id, s.t_stime,s.t_date, s.t_etime, s.scr_id, b.book_cnt, b.price, m.mo_name, m.mo_post, t.th_name, b.state "
				+ "FROM book b " + "JOIN stime s ON b.t_id = s.t_id " + "JOIN movie m ON b.mo_code = m.mo_code "
				+ "JOIN theater t ON b.th_id = t.th_id " + "WHERE b.m_id = ? AND b.state = 'N'";

		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, m_id);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			int book_id = rs.getInt("book_id");
			String book_date = rs.getString("book_date");
			String stime = rs.getString("t_stime");
			String etime = rs.getString("t_etime");
			int scr_id = rs.getInt("scr_id");
			int book_cnt = rs.getInt("book_cnt");
			int price = rs.getInt("price");
			String moname = rs.getString("mo_name");
			String post = rs.getString("mo_post");
			String th_name = rs.getString("th_name");
			String state = rs.getString("state");
			String t_date = rs.getString("t_date");
			int t_id = rs.getInt("t_id");
			BookServiceVO bvo = new BookServiceVO(book_id, stime, etime, scr_id, book_cnt, price, moname, post, th_name,
					book_date, state, t_date, t_id);
			bArray.add(bvo);

		}
		return bArray;
	}

	public boolean bookCancel(int book_id, int t_id) throws SQLException {
		String sql = "update book set state='N' where book_id=? and t_id=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, book_id);
			pstmt.setInt(2, t_id);
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}

}
