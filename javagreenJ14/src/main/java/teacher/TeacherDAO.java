package teacher;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.GetConn;

public class TeacherDAO {
	GetConn getConn = GetConn.getInstance();
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql="";
	
	TeacherVO vo = null;

// 전체자료 가져오기	
	public ArrayList<TeacherVO> getTeList() {
		ArrayList<TeacherVO> vos = new ArrayList<TeacherVO>();
		try {
			sql="select * from teacher";
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new TeacherVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setfName(rs.getString("fName"));
				vo.setfSName(rs.getString("fSName"));
				vo.setfSize(rs.getInt("fSize"));
				vo.setTeacherName(rs.getString("teacherName"));
				vo.setTeacherBan(rs.getString("teacherBan"));
				vo.setwDate(rs.getString("wDate"));
				vo.setOpenSw(rs.getString("openSw"));
				vo.setContent(rs.getString("content"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("1sql오류 : " +e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vos;
	}

// 교사 등록	
	public int setTeInput(TeacherVO vo) {
		int res = 0;
		try {
			sql="insert into teacher values(default,?,?,?,?,?,?,default,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getfName());
			pstmt.setString(3, vo.getfSName());
			pstmt.setInt(4, vo.getfSize());
			pstmt.setString(5, vo.getTeacherName());
			pstmt.setString(6, vo.getTeacherBan());
			pstmt.setString(7, vo.getOpenSw());
			pstmt.setString(8, vo.getContent());
			pstmt.executeUpdate();
			res=1;
		} catch (SQLException e) {
			System.out.println("2SQL에러 : " +e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		
		return res;
	}

	
}
