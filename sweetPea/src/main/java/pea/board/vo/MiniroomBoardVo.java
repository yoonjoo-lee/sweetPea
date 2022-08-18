package pea.board.vo;

public class MiniroomBoardVo extends UserVo{

	private int mbidx;
	private int uidx;
	private String title;
	private String content;
	private int writer;
	private String date;
	private String ip;
	private int category;
	private String delyn;
	private String secret;
	private String subcategory;
	private String checkHomePhoto; // (미니홈피 홈에 뜨는 사진)구분하기 위한 임의 값(디비엔 없음)	
	
	
	 
	public String getCheckHomePhoto() {
		return checkHomePhoto;
	}
	public void setCheckHomePhoto(String checkHomePhoto) {
		this.checkHomePhoto = checkHomePhoto;
	}
	public int getMbidx() {
		return mbidx;
	}
	public void setMbidx(int mbidx) {
		this.mbidx = mbidx;
	}
	public int getUidx() {
		return uidx;
	}
	public void setUidx(int uidx) {
		this.uidx = uidx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getWriter() {
		return writer;
	}
	public void setWriter(int writer) {
		this.writer = writer;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public String getDelyn() {
		return delyn;
	}
	public void setDelyn(String delyn) {
		this.delyn = delyn;
	}
	public String getSecret() {
		return secret;
	}
	public void setSecret(String secret) {
		this.secret = secret;
	}
	public String getSubcategory() {
		return subcategory;
	}
	public void setSubcategory(String subcategory) {
		this.subcategory = subcategory;
	}
	
	
	
	
	
}
