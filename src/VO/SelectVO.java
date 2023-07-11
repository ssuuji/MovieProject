package VO;

public class SelectVO {
	private String thname; // 극장이름
	private String moname; // 영화이름
	private String stname; //
	
	public String getThname() {
		return thname;
	}
	public void setThname(String thname) {
		this.thname = thname;
	}
	public String getMoname() {
		return moname;
	}
	public void setMoname(String moname) {
		this.moname = moname;
	}
	public String getStname() {
		return stname;
	}
	public void setStname(String stname) {
		this.stname = stname;
	}
	public SelectVO(String thname, String moname, String stname) {
		super();
		this.thname = thname;
		this.moname = moname;
		this.stname = stname;
	}
	public SelectVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	



}