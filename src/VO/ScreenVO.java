package VO;

public class ScreenVO {
	private int scr_id;
	private int th_id;
	private int scr_tot;
	public int getScr_id() {
		return scr_id;
	}
	public void setScr_id(int scr_id) {
		this.scr_id = scr_id;
	}
	public int getTh_id() {
		return th_id;
	}
	public void setTh_id(int th_id) {
		this.th_id = th_id;
	}
	public int getScr_tot() {
		return scr_tot;
	}
	public void setScr_tot(int scr_tot) {
		this.scr_tot = scr_tot;
	}
	public ScreenVO(int scr_id, int th_id, int scr_tot) {
		super();
		this.scr_id = scr_id;
		this.th_id = th_id;
		this.scr_tot = scr_tot;
	}
	public ScreenVO() {}
	
	
}
