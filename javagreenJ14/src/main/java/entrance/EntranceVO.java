package entrance;

public class EntranceVO {
	private int idx;
	private String pName;
	private String relation;
	private String tel;
	private String address;
	private String cName;
	private String gender;
	private String birthday;
	private String content;
	private String sw;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getpName() {
		return pName;
	}
	public void setpName(String pName) {
		this.pName = pName;
	}
	public String getRelation() {
		return relation;
	}
	public void setRelation(String relation) {
		this.relation = relation;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getcName() {
		return cName;
	}
	public void setcName(String cName) {
		this.cName = cName;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSw() {
		return sw;
	}
	public void setSw(String sw) {
		this.sw = sw;
	}
	@Override
	public String toString() {
		return "EntranceVO [idx=" + idx + ", pName=" + pName + ", relation=" + relation + ", tel=" + tel + ", address="
				+ address + ", cName=" + cName + ", gender=" + gender + ", birthday=" + birthday + ", content=" + content
				+ ", sw=" + sw + "]";
	}
	
	
}
