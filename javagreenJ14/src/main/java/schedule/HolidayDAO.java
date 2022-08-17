package schedule;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.GetConn;

public class HolidayDAO {
	GetConn getConn = GetConn.getInstance();
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql="";
	
	HolidayDAO vo = null;

	public ArrayList<HolidayVO> getScheduleList(String ym) {
		// TODO Auto-generated method stub
		return null;
	}

}
