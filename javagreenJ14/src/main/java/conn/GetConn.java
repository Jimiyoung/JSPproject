package conn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class GetConn {  //1
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String driver = "com.mysql.jdbc.Driver";
	private String url = "jdbc:mysql://localhost:3306/javagreen_jmy";
	private String user = "root";
	private String password = "1234";
	
	private static GetConn instance = new GetConn();
	
	private GetConn() { //2
		try {
			Class.forName(driver);   //2-1
			conn = DriverManager.getConnection(url, user, password); //2-4
		} catch (ClassNotFoundException e) {  //2-2
			System.out.println("드라이버 검색 실패"); //2-3
		} catch (SQLException e) { //2-5
			System.out.println("DB 연동 실패"); //2-6
		}
	}

	public Connection getConn() {  //10번라인 connection 객체에 접근하기 위해 생성
		return conn;
	}

	public static GetConn getInstance() {  
		return instance;
	}
	
	public void pstmtClose() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {}
		}
	}
	
	public void rsClose() {
		if(rs != null) {
			try {
				rs.close();
				pstmt.close();
			} catch (SQLException e) {}
		}
	}
}
