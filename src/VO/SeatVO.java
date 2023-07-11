package VO;

public class SeatVO {
	 private int seat_id;
	 private int t_id;
	 private String rseat;
	 private String m_id;
	
	public SeatVO() {}
	public SeatVO(int seat_id, int t_id, String rseat, String m_id) {
		super();
		this.seat_id = seat_id;
		this.t_id = t_id;
		this.rseat = rseat;
		this.m_id = m_id;
	}
	public int getSeat_id() {return seat_id;	}
	public void setSeat_id(int seat_id) {this.seat_id = seat_id;
	}
	public int getT_id() {return t_id;}
	public void setT_id(int t_id) {this.t_id = t_id;
	}
	public String getRseat() {return rseat;	}
	public void setRseat(String rseat) {this.rseat = rseat;
	}
	public String getM_id() {return m_id;}
	public void setM_id(String m_id) {	this.m_id = m_id;
	}
	
	
}
