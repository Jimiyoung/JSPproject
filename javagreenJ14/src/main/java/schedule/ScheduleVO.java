package schedule;

public class ScheduleVO {
	private int idx;
	private String nickName;
	private String sDate;
	private String part;
	private String title;
	private String place;
	private String stime;
	private String content;
	
	private String ym; // 년-월
	private String ymd; // 년-월-일
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getsDate() {
		return sDate;
	}
	public void setsDate(String sDate) {
		this.sDate = sDate;
	}
	public String getPart() {
		return part;
	}
	public void setPart(String part) {
		this.part = part;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getStime() {
		return stime;
	}
	public void setStime(String stime) {
		this.stime = stime;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getYm() {
		return ym;
	}
	public void setYm(String ym) {
		this.ym = ym;
	}
	public String getYmd() {
		return ymd;
	}
	public void setYmd(String ymd) {
		this.ymd = ymd;
	}
	@Override
	public String toString() {
		return "ScheduleVO [idx=" + idx + ", nickName=" + nickName + ", sDate=" + sDate + ", part=" + part + ", title="
				+ title + ", place=" + place + ", stime=" + stime + ", content=" + content + ", ym=" + ym + ", ymd=" + ymd
				+ "]";
	}
	
	
}
