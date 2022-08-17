package story;

public class NuryVO {
	private int idx;
	private String mid;
	private String nickName;
	private String fName;
	private String fSName;
	private int fSize;
	private String title;
	private String wDate;
	private String openSw;
	private String content;
	private int readNum;
	private int good;
	
//날짜형식필드를 '문자'와 '숫자'로 저장시켜주기 위한 변수 선언
	private String wCdate;
	private int wNdate;
	
	// '이전글','다음글'을 위한 변수 선언
	private int preIdx;
	private int nextIdx;
	private String preTitle;
	private String nextTitle;
	
//댓글의 개수를 저장하기 위한 필드
	private int replyCount;

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

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getfName() {
		return fName;
	}

	public void setfName(String fName) {
		this.fName = fName;
	}

	public String getfSName() {
		return fSName;
	}

	public void setfSName(String fSName) {
		this.fSName = fSName;
	}

	public int getfSize() {
		return fSize;
	}

	public void setfSize(int fSize) {
		this.fSize = fSize;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getwDate() {
		return wDate;
	}

	public void setwDate(String wDate) {
		this.wDate = wDate;
	}

	public String getOpenSw() {
		return openSw;
	}

	public void setOpenSw(String openSw) {
		this.openSw = openSw;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getReadNum() {
		return readNum;
	}

	public void setReadNum(int readNum) {
		this.readNum = readNum;
	}

	public int getGood() {
		return good;
	}

	public void setGood(int good) {
		this.good = good;
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

	public int getPreIdx() {
		return preIdx;
	}

	public void setPreIdx(int preIdx) {
		this.preIdx = preIdx;
	}

	public int getNextIdx() {
		return nextIdx;
	}

	public void setNextIdx(int nextIdx) {
		this.nextIdx = nextIdx;
	}

	public String getPreTitle() {
		return preTitle;
	}

	public void setPreTitle(String preTitle) {
		this.preTitle = preTitle;
	}

	public String getNextTitle() {
		return nextTitle;
	}

	public void setNextTitle(String nextTitle) {
		this.nextTitle = nextTitle;
	}

	public int getReplyCount() {
		return replyCount;
	}

	public void setReplyCount(int replyCount) {
		this.replyCount = replyCount;
	}

	@Override
	public String toString() {
		return "NuryVO [idx=" + idx + ", mid=" + mid + ", nickName=" + nickName + ", fName=" + fName + ", fSName=" + fSName
				+ ", fSize=" + fSize + ", title=" + title + ", wDate=" + wDate + ", openSw=" + openSw + ", content=" + content
				+ ", readNum=" + readNum + ", good=" + good + ", wCdate=" + wCdate + ", wNdate=" + wNdate + ", preIdx=" + preIdx
				+ ", nextIdx=" + nextIdx + ", preTitle=" + preTitle + ", nextTitle=" + nextTitle + ", replyCount=" + replyCount
				+ "]";
	}

	
	
}
