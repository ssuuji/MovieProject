package VO;

//영화관 VO
public class TheaterVO {
	int th_id;			// 영화관 아이디 (100, 200, 300)  임의로!
	String th_name;		// 영화관 이름	(강남점, 신사점, 종로점)
	String th_addr;		// 영화관 주소
	String th_tel;		// 영화관 전화번호
	
	public TheaterVO() {}
	
	public TheaterVO(int th_id, String th_name, String th_addr, String th_tel) {
		super();
		
		this.th_id = th_id;
		this.th_name = th_name;
		this.th_addr = th_addr;
		this.th_tel = th_tel;	
	}

	
	public int getTh_id() {
		return th_id;
	}

	public void setTh_id(int th_id) {
		this.th_id = th_id;
	}

	public String getTh_name() {
		return th_name;
	}

	public void setTh_name(String th_name) {
		this.th_name = th_name;
	}

	public String getTh_addr() {
		return th_addr;
	}

	public void setTh_addr(String th_addr) {
		this.th_addr = th_addr;
	}

	public String getTh_tel() {
		return th_tel;
	}

	public void setTh_tel(String th_tel) {
		this.th_tel = th_tel;
	}
	
	
}
