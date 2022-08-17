package schedule;

public class HolidayVO {
	private int holidayIdx;
	private String holidayName;
	private String holidayDate;
	
	private String ym; // 년-월
	private String ymd; // 년-월-일
	
	public int getHolidayIdx() {
		return holidayIdx;
	}
	public void setHolidayIdx(int holidayIdx) {
		this.holidayIdx = holidayIdx;
	}
	public String getHolidayName() {
		return holidayName;
	}
	public void setHolidayName(String holidayName) {
		this.holidayName = holidayName;
	}
	public String getHolidayDate() {
		return holidayDate;
	}
	public void setHolidayDate(String holidayDate) {
		this.holidayDate = holidayDate;
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
		return "HolidayVO [holidayIdx=" + holidayIdx + ", holidayName=" + holidayName + ", holidayDate=" + holidayDate
				+ ", ym=" + ym + ", ymd=" + ymd + "]";
	}
	
	
}
