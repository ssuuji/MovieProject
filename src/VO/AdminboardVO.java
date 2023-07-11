package VO;

public class AdminboardVO {
	
	private int abbsID;
	private String abbsTitle;
	private String adminID;
	private String abbsDate;
	private String abbsContent;
	private int abbsAvailable;
	
	public AdminboardVO() {};
	
	public AdminboardVO(int abbsID, String abbsTitle, String adminID, String abbsDate, String abbsContent, int abbsAvailable ) {
		super();
		
		this.abbsID = abbsID;
		this.abbsTitle = abbsTitle;
		this.adminID = adminID;
		this.abbsDate = abbsDate;
		this.abbsContent = abbsContent;
		this.abbsAvailable = abbsAvailable;
		
	}

	public int getAbbsID() {
		return abbsID;
	}

	public void setAbbsID(int abbsID) {
		this.abbsID = abbsID;
	}

	public String getAbbsTitle() {
		return abbsTitle;
	}

	public void setAbbsTitle(String abbsTitle) {
		this.abbsTitle = abbsTitle;
	}



	public String getAdminID() {
		return adminID;
	}

	public void setAdminID(String adminID) {
		this.adminID = adminID;
	}

	public String getAbbsDate() {
		return abbsDate;
	}

	public void setAbbsDate(String abbsDate) {
		this.abbsDate = abbsDate;
	}

	public String getAbbsContent() {
		return abbsContent;
	}

	public void setAbbsContent(String abbsContent) {
		this.abbsContent = abbsContent;
	}

	public int getAbbsAvailable() {
		return abbsAvailable;
	}

	public void setAbbsAvailable(int abbsAvailable) {
		this.abbsAvailable = abbsAvailable;
	}

}
