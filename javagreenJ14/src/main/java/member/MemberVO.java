package member;

public class MemberVO {
	private int idx;
	private String mid;
	private String pwd;
	private String name;
	private String nickName;
	private String childName;
	private String ban;
	private String tel;
	private String address;
	private String email;
	private String birthday;
	private String startDate;
	private String lastDate;
	private String userDel;
	private int level;
	
	private int applyDiff; // 날짜차이를 저장하는 필드
	
	private String strLevel; // 회원등급을 문자로 저장하는 필드
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
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
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getChildName() {
		return childName;
	}
	public void setChildName(String childName) {
		this.childName = childName;
	}
	public String getBan() {
		return ban;
	}
	public void setBan(String ban) {
		this.ban = ban;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getLastDate() {
		return lastDate;
	}
	public void setLastDate(String lastDate) {
		this.lastDate = lastDate;
	}
	public String getUserDel() {
		return userDel;
	}
	public void setUserDel(String userDel) {
		this.userDel = userDel;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public int getApplyDiff() {
		return applyDiff;
	}
	public void setApplyDiff(int applyDiff) {
		this.applyDiff = applyDiff;
	}
	public String getStrLevel() {
		return strLevel;
	}
	public void setStrLevel(String strLevel) {
		this.strLevel = strLevel;
	}
	
	@Override
	public String toString() {
		return "MemberVO [idx=" + idx + ", mid=" + mid + ", pwd=" + pwd + ", name=" + name + ", nickName=" + nickName
				+ ", childName=" + childName + ", ban=" + ban + ", tel=" + tel + ", address=" + address + ", email=" + email
				+ ", birthday=" + birthday + ", startDate=" + startDate + ", lastDate=" + lastDate + ", userDel=" + userDel
				+ ", level=" + level + ", applyDiff=" + applyDiff + ", strLevel=" + strLevel + "]";
	}
	
}
