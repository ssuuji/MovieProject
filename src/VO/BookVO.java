package VO;

public class BookVO {
	private int book_id;
	private int mo_code;
	private String m_id;
	private int th_id;
	private int t_id;
	private int book_cnt;
	private int price;
	private String state;
	public BookVO() {}
	public BookVO(int book_id, int mo_code, String m_id, int th_id, int t_id, int book_cnt, int price, String state) {
		super();
		this.book_id = book_id;
		this.mo_code = mo_code;
		this.m_id = m_id;
		this.th_id = th_id;
		this.t_id = t_id;
		this.book_cnt = book_cnt;
		this.price = price;
		this.state = state;
	}
	public int getBook_id() {
		return book_id;
	}
	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}
	public int getMo_code() {
		return mo_code;
	}
	public void setMo_code(int mo_code) {
		this.mo_code = mo_code;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public int getTh_id() {
		return th_id;
	}
	public void setTh_id(int th_id) {
		this.th_id = th_id;
	}
	public int getT_id() {
		return t_id;
	}
	public void setT_id(int t_id) {
		this.t_id = t_id;
	}
	public int getBook_cnt() {
		return book_cnt;
	}
	public void setBook_cnt(int book_cnt) {
		this.book_cnt = book_cnt;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	} 
	
	

}
