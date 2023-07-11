package VO;
import java.util.Date;




public class RevVO {

	/* create table review( 
	 * rev_id number(10) primary key, 
	 * mo_code number(10) not
	 * null references movie(mo_code), 
	 * write_date date, rev_contents varchar2(2000),
	 * m_id varchar2(20) not null references member(m_id));*/

	private int rev_id; // (�Խñ� ���̵�)(������)
	private int mo_code; //(��ȭ �ڵ�)
	private Date write_date; //  (�ۼ���)
	private String rev_contents; //  (�۳���)
	private String m_id; // (������̵�)
	private String mo_name;
	
	public RevVO() { }
	
	public RevVO(int rev_id, int mo_code,String mo_name, Date write_date, String rev_contents, String m_id) {
		super();
		this.rev_id = rev_id;
		this.mo_code = mo_code;
		this.mo_name = mo_name;
		this.write_date = write_date;
		this.rev_contents = rev_contents;
		this.m_id = m_id;
	}
	


	public int getRev_id() {return rev_id;}
	public void setRev_id(int rev_id) {this.rev_id = rev_id;}
	
	public int getMo_code() {return mo_code;}
	public void setMo_code(int mo_code) {this.mo_code = mo_code;}
	
	public Date getWrite_date() {return write_date;}
	public void setWrite_date(Date write_date) {this.write_date = write_date;}
	
	public String getRev_contents() {return rev_contents;}
	public void setRev_contents(String rev_contents) {this.rev_contents = rev_contents;}
	
	public String getM_id() {return m_id;}
	public void setM_id(String m_id) {this.m_id = m_id;}

	public String getMo_name() {return mo_name;}
	public void setMo_name(String mo_name) {this.mo_name = mo_name;}
	
	
	
}
