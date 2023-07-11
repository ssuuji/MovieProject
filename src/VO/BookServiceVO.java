package VO;

public class BookServiceVO {
	private int book_id;
	private String t_stime;
	private String t_etime;
	private int scr_id;
	private int book_cnt;
	private int price;
	private String mo_name;
	private String post;
	private String seats;
	private String th_name;
	private String datetime;
	private String book_state;
	private String t_date;
	private int t_id;
	
	public int getT_id() {
		return t_id;
	}

	public void setT_id(int t_id) {
		this.t_id = t_id;
	}

	public String getT_date() {
		return t_date;
	}

	public void setT_date(String t_date) {
		this.t_date = t_date;
	}

	public String getDatetime() {
		return datetime;
	}

	public void setDatetime(String datetime) {
		this.datetime = datetime;
	}

	public String getBook_state() {
		return book_state;
	}

	public void setBook_state(String book_state) {
		this.book_state = book_state;
	}

	public int getBook_id() {
		return book_id;
	}

	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}

	public String getT_stime() {
		return t_stime;
	}

	public void setT_stime(String t_stime) {
		this.t_stime = t_stime;
	}

	public String getT_etime() {
		return t_etime;
	}

	public void setT_etime(String t_etime) {
		this.t_etime = t_etime;
	}

	public int getScr_id() {
		return scr_id;
	}

	public void setScr_id(int scr_id) {
		this.scr_id = scr_id;
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

	public String getMo_name() {
		return mo_name;
	}

	public void setMo_name(String mo_name) {
		this.mo_name = mo_name;
	}

	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}

	public String getSeats() {
		return seats;
	}

	public void setSeats(String seats) {
		this.seats = seats;
	}

	public String getTh_name() {
		return th_name;
	}

	public void setTh_name(String th_name) {
		this.th_name = th_name;
	}


	public BookServiceVO(int book_id, String t_stime, String t_etime, int scr_id, int book_cnt, int price,
			String mo_name, String post, String seats, String th_name, String datetime, String book_state,
			String t_date, int t_id) {
		super();
		this.book_id = book_id;
		this.t_stime = t_stime;
		this.t_etime = t_etime;
		this.scr_id = scr_id;
		this.book_cnt = book_cnt;
		this.price = price;
		this.mo_name = mo_name;
		this.post = post;
		this.seats = seats;
		this.th_name = th_name;
		this.datetime = datetime;
		this.book_state = book_state;
		this.t_date = t_date;
		this.t_id = t_id;
	}
	public BookServiceVO(int book_id, String t_stime, String t_etime, int scr_id, int book_cnt, int price,
			String mo_name, String post, String th_name, String datetime, String book_state,
			String t_date, int t_id) {
		super();
		this.book_id = book_id;
		this.t_stime = t_stime;
		this.t_etime = t_etime;
		this.scr_id = scr_id;
		this.book_cnt = book_cnt;
		this.price = price;
		this.mo_name = mo_name;
		this.post = post;
		this.th_name = th_name;
		this.datetime = datetime;
		this.book_state = book_state;
		this.t_date = t_date;
		this.t_id = t_id;
	}

	public BookServiceVO() {
	}
}
