package VO;

import java.util.Date;


public class StimeVO { 
	private int t_id;
	private String scr_stime;
	private String scr_etime;
	private Date scr_date;
	private int scr_id;
	private int seat_plot;
	private int mo_code;
	public int getT_id() {
		return t_id;
	}
	public void setT_id(int t_id) {
		this.t_id = t_id;
	}
	public String getScr_stime() {
		return scr_stime;
	}
	public void setScr_stime(String scr_stime) {
		this.scr_stime = scr_stime;
	}
	public String getScr_etime() {
		return scr_etime;
	}
	public void setScr_etime(String scr_etime) {
		this.scr_etime = scr_etime;
	}
	public Date getScr_date() {
		return scr_date;
	}
	public void setScr_date(Date scr_date) {
		this.scr_date = scr_date;
	}
	public int getScr_id() {
		return scr_id;
	}
	public void setScr_id(int scr_id) {
		this.scr_id = scr_id;
	}
	public int getSeat_plot() {
		return seat_plot;
	}
	public void setSeat_plot(int seat_plot) {
		this.seat_plot = seat_plot;
	}
	public int getMo_code() {
		return mo_code;
	}
	public void setMo_code(int mo_code) {
		this.mo_code = mo_code;
	}
	public StimeVO(int t_id, String scr_stime, String scr_etime, Date scr_date, int scr_id, int seat_plot,
			int mo_code) {
		super();
		this.t_id = t_id;
		this.scr_stime = scr_stime;
		this.scr_etime = scr_etime;
		this.scr_date = scr_date;
		this.scr_id = scr_id;
		this.seat_plot = seat_plot;
		this.mo_code = mo_code;
	}
	public StimeVO() {}
	
	
}