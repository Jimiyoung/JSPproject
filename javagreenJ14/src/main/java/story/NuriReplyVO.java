package story;

public class NuriReplyVO {
	private int idx;
	private int nuriIdx;
	private String mid;
	private String nickName;
	private String wDate;
	private String content;
	
//날짜형식필드를 '문자'와 '숫자'로 저장시켜주기 위한 변수 선언
	private String wCdate;
	private int wNdate;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int getNuriIdx() {
		return nuriIdx;
	}
	public void setNuriIdx(int nuriIdx) {
		this.nuriIdx = nuriIdx;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getwDate() {
		return wDate;
	}
	public void setwDate(String wDate) {
		this.wDate = wDate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getwCdate() {
		return wCdate;
	}
	public void setwCdate(String wCdate) {
		this.wCdate = wCdate;
	}
	public int getwNdate() {
		return wNdate;
	}
	public void setwNdate(int wNdate) {
		this.wNdate = wNdate;
	}
	@Override
	public String toString() {
		return "nuriReplyVO [idx=" + idx + ", nuriIdx=" + nuriIdx + ", mid=" + mid + ", nickName=" + nickName + ", wDate="
				+ wDate + ", content=" + content + ", wCdate=" + wCdate + ", wNdate=" + wNdate + "]";
	}
	
	
}
