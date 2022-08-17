package conn;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

// 오늘(현재)날짜와 DB의 날짜간의 시간차이를 계산하여 돌려주는 클래스
public class TimeDiff {
	//1.'오늘날짜(1)와 'DB 날짜(2)'를 '문자'형식으로 변경(날짜형식기호에 맞도록 설계)
	//2.날짜연산을 위해서 다시 '날짜'형식으로 변경.
	//3.날짜차이를 시간(24시간제)으로 계산하기 위해 '숫자'형식으로 변환
	
	//외부로부터 날짜를 입력받아서 연산처리한 후 다시 정수값으로 돌려준다.
	public int timeDiff(String wCdate) {
		//1-1. 날짜형식을 문자(202205111245)형식으로 변경
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmm"); //hh:1~12(AM/PM), HH:24시간제
		String strToday =  sdf.format(cal.getTime());
		
		//2-1. 날짜연산을 위해 문자형식의 날짜를 날짜형식으로 변경
		Date today =null;
		try {
			today = sdf.parse(strToday);  // 이거 먼저 입력하면 sdf.parse 밑 빨간밑줄생김. try/catch
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		//1-2. DB에 저장된 날짜(2022-05-11 13:05:25.0)를 앞에 작업한 오늘날짜와 같은 포멧형식(yyyyMMddHHmm)으로 처리 
		String strWCdate = wCdate.substring(0,4)+wCdate.substring(5,7)+wCdate.substring(8,10)+wCdate.substring(11,13)+wCdate.substring(14,16);
		
		//2-2. 날짜연산을 위해 DB에서 가져온 문자변환형식자료를 날짜형식으로 변경
		Date dateWdate =null;
		try {
			dateWdate = sdf.parse(strWCdate);  // 이거 먼저 입력하면 sdf.parse 밑 빨간밑줄생김. try/catch
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		//3. 날짜형식으로 변경된 두 자료(today, dateWdate)를 숫자형식(getTime())으로 변경처리한다. 시간으로 연산처리하기 위함. : 결과값은 ms(1/1000초)형식으로 반환.
		long diffTime = (today.getTime() - dateWdate.getTime()) / (60*60*1000)+1;
		
		return (int) diffTime;
	}
}
