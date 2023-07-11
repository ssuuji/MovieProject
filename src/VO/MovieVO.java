package VO;

public class MovieVO {
	int mo_code;
	String mo_name;
	String mo_info;
	String mo_post;
	String mo_run;
	String mo_type;
	String mo_open;
	String mo_age;
	String mo_dirname;
	String mo_actname;
	String mo_rank;
	String mo_audiAcc;
	
	public String getMo_rank() {return mo_rank;}
	public void setMo_rank(String mo_rank) {this.mo_rank = mo_rank;}
	public String getMo_audiAcc() {return mo_audiAcc;}
	public void setMo_audiAcc(String mo_audiAcc) {this.mo_audiAcc = mo_audiAcc;	}
	public MovieVO(int mo_code, String mo_name, String mo_info, String mo_post, String mo_run, String mo_type,
			String mo_open, String mo_age, String mo_dirname, String mo_actname) {
		super();
		this.mo_code = mo_code;
		this.mo_name = mo_name;
		this.mo_info = mo_info;
		this.mo_post = mo_post;
		this.mo_run = mo_run;
		this.mo_type = mo_type;
		this.mo_open = mo_open;
		this.mo_age = mo_age;
		this.mo_dirname = mo_dirname;
		this.mo_actname = mo_actname;
	}
	
	public MovieVO(String rank, String audiAcc, int mo_code, String mo_name, String mo_info, String mo_post, String mo_run, String mo_type,
			String mo_open, String mo_age, String mo_dirname, String mo_actname) {
		super();
		this.mo_code = mo_code;
		this.mo_name = mo_name;
		this.mo_info = mo_info;
		this.mo_post = mo_post;
		this.mo_run = mo_run;
		this.mo_type = mo_type;
		this.mo_open = mo_open;
		this.mo_age = mo_age;
		this.mo_dirname = mo_dirname;
		this.mo_actname = mo_actname;
		this.mo_rank= rank;
		this.mo_audiAcc=audiAcc;
		
	}

	public MovieVO() {}
	public int getMo_code() {return mo_code;}
	public void setMo_code(int mo_code) {this.mo_code = mo_code;}
	public String getMo_name() {return mo_name;}
	public void setMo_name(String mo_name) {this.mo_name = mo_name;}
	public String getMo_info() {return mo_info;}
	public void setMo_info(String mo_info) {this.mo_info = mo_info;}
	public String getMo_post() {return mo_post;}
	public void setMo_post(String mo_post) {this.mo_post = mo_post;}
	public String getMo_run() {return mo_run;}
	public void setMo_run(String mo_run) {this.mo_run = mo_run;}
	public String getMo_type() {return mo_type;}
	public void setMo_type(String mo_type) {this.mo_type = mo_type;}
	public String getMo_open() {return mo_open;}
	public void setMo_open(String mo_open) {this.mo_open = mo_open;}
	public String getMo_age() {return mo_age;}
	public void setMo_age(String mo_age) {this.mo_age = mo_age;}
	public String getMo_dirname() {return mo_dirname;}
	public void setMo_dirname(String mo_dirname) {this.mo_dirname = mo_dirname;}
	public String getMo_actname() {return mo_actname;}
	public void setMo_actname(String mo_actname) {this.mo_actname = mo_actname;}
	
}
