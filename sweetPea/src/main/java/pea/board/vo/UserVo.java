package pea.board.vo;

public class UserVo {
	private int uidx;
	private String id;
	private String pwd;
	private String name;
	private String gender;
	private String birth;
	private String phone;
	private String email;
	private String addr;
	private String delyn;
	private String ip;
	private String udate;
	private int pea_amount;
	private String pea_super;
	private String profile;
	private String delreason;
	private String miniProfile;
	
	/* 친구추천용 함수 */
	private int visit;
	private int today;
	
	
	public int getVisit() {
		return visit;
	}
	public void setVisit(int visit) {
		this.visit = visit;
	}
	public int getToday() {
		return today;
	}
	public void setToday(int today) {
		this.today = today;
	}
	public String getMiniProfile() {
		return miniProfile;
	}
	public void setMiniProfile(String miniProfile) {
		this.miniProfile = miniProfile;
	}
	public String getDelreason() {
		return delreason;
	}
	public void setDelreason(String delreason) {
		this.delreason = delreason;
	}
	public int getUidx() {
		return uidx;
	}
	public void setUidx(int uidx) {
		this.uidx = uidx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getDelyn() {
		return delyn;
	}
	public void setDelyn(String delyn) {
		this.delyn = delyn;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getUdate() {
		return udate;
	}
	public void setUdate(String udate) {
		this.udate = udate;
	}
	public int getPea_amount() {
		return pea_amount;
	}
	public void setPea_amount(int pea_amount) {
		this.pea_amount = pea_amount;
	}
	public String getPea_super() {
		return pea_super;
	}
	public void setPea_super(String pea_super) {
		this.pea_super = pea_super;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	
	
	
}
