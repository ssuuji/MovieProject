package VO;

public class UserServiceVO {
    private int scr_id;
    private String t_stime;
    private String t_date;
    private String mo_name;
    private int t_id;
    private int mo_code;
    
	public int getMo_code() {
		return mo_code;
	}
	public void setMo_code(int mo_code) {
		this.mo_code = mo_code;
	}
	public int getT_id() {
		return t_id;
	}
	public void setT_id(int t_id) {
		this.t_id = t_id;
	}
	public UserServiceVO(int scr_id, String t_stime, String t_date, String mo_name, int t_id) {
		super();
		this.scr_id = scr_id;
		this.t_stime = t_stime;
		this.t_date = t_date;
		this.mo_name = mo_name;
		this.t_id=t_id;
	}
	public UserServiceVO(int scr_id, String t_stime, String t_date,int mo_code) {
		super();
		this.scr_id = scr_id;
		this.t_stime = t_stime;
		this.t_date = t_date;
		this.mo_code = mo_code;
	}
	public int getScr_id() {
		return scr_id;
	}
	public void setScr_id(int scr_id) {
		this.scr_id = scr_id;
	}
	public String getT_stime() {
		return t_stime;
	}
	public void setT_stime(String t_stime) {
		this.t_stime = t_stime;
	}
	public String getT_date() {
		return t_date;
	}
	public void setT_date(String t_date) {
		this.t_date = t_date;
	}
	public String getMo_name() {
		return mo_name;
	}
	public void setMo_name(String mo_name) {
		this.mo_name = mo_name;
	}
	public UserServiceVO() {}
    
	

	
	
    

}