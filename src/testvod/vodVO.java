package testvod;

public class vodVO {
	private int code;
	private String name;
	private String url;
	public vodVO() {}
	public vodVO(int code, String name, String url) {
		super();
		this.code = code;
		this.name = name;
		this.url = url;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	
}
