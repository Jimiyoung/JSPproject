package teacher;

public class TeacherVO {
	private int idx;
	private String mid;
	private String fName;
	private String fSName;
	private int fSize;
	private String teacherName;
	private String teacherBan;
	private String wDate;
	private String openSw;
	private String content;
	
	int getIdx() {
		return idx;
	}
	void setIdx(int idx) {
		this.idx = idx;
	}
	String getMid() {
		return mid;
	}
	void setMid(String mid) {
		this.mid = mid;
	}
	String getfName() {
		return fName;
	}
	void setfName(String fName) {
		this.fName = fName;
	}
	String getfSName() {
		return fSName;
	}
	void setfSName(String fSName) {
		this.fSName = fSName;
	}
	int getfSize() {
		return fSize;
	}
	void setfSize(int fSize) {
		this.fSize = fSize;
	}
	String getTeacherName() {
		return teacherName;
	}
	void setTeacherName(String teacherName) {
		this.teacherName = teacherName;
	}
	String getTeacherBan() {
		return teacherBan;
	}
	void setTeacherBan(String teacherBan) {
		this.teacherBan = teacherBan;
	}
	String getwDate() {
		return wDate;
	}
	void setwDate(String wDate) {
		this.wDate = wDate;
	}
	String getOpenSw() {
		return openSw;
	}
	void setOpenSw(String openSw) {
		this.openSw = openSw;
	}
	String getContent() {
		return content;
	}
	void setContent(String content) {
		this.content = content;
	}
	@Override
	public String toString() {
		return "TeacherVO [idx=" + idx + ", mid=" + mid + ", fName=" + fName + ", fSName=" + fSName + ", fSize=" + fSize
				+ ", teacherName=" + teacherName + ", teacherBan=" + teacherBan + ", wDate=" + wDate + ", openSw=" + openSw
				+ ", content=" + content + "]";
	}
	
}
