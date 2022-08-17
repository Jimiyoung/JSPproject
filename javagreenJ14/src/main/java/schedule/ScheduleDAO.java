package schedule;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.GetConn;

public class ScheduleDAO {
	GetConn getConn = GetConn.getInstance();
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql="";
	
	ScheduleVO vo = null;


	// 해당 '년-월' 자료를 모두 검색
	public ArrayList<ScheduleVO> getScheduleList(String ym) {
		ArrayList<ScheduleVO> vos = new ArrayList<ScheduleVO>();
		try {
			sql="select * from schedule where date_format(sDate, '%Y-%m')=? order by sDate,part";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, ym);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				vo=new ScheduleVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setNickName(rs.getString("nickName"));
				vo.setPart(rs.getString("part"));
				vo.setTitle(rs.getString("title"));
				vo.setPlace(rs.getString("place"));
				vo.setStime(rs.getString("stime"));
				vo.setContent(rs.getString("content"));
				vo.setsDate(rs.getString("sDate"));
				
				vo.setYm(ym);
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("1sql에러 : " + e.getMessage());
		}	finally {
			getConn.rsClose();
		}	return vos;
	}


	
//개별날짜에 따른 일정 목록 가져오기
	public ArrayList<ScheduleVO> getScMenu(String ymd) {
		ArrayList<ScheduleVO> vos = new ArrayList<ScheduleVO>();
		try {
			sql="select * from schedule where date_format(sDate, '%Y-%m-%d')=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, ymd);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				vo=new ScheduleVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setNickName(rs.getString("nickName"));
				vo.setPart(rs.getString("part"));
				vo.setTitle(rs.getString("title"));
				vo.setPlace(rs.getString("place"));
				vo.setStime(rs.getString("stime"));
				vo.setContent(rs.getString("content"));
				vo.setYmd(ymd);
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("sql에러 : " + e.getMessage());
		}	finally {
			getConn.rsClose();
		}
		return vos;
	
	}

	//스케줄(일정)저장
	public int setScheduleInputOk(ScheduleVO vo) {
		int res=0;
		try {
			sql="insert into schedule values(default,?,?,?,?,?,?,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getNickName());
			pstmt.setString(2, vo.getsDate());
			pstmt.setString(3, vo.getPart());
			pstmt.setString(4, vo.getTitle());
			pstmt.setString(5, vo.getPlace());
			pstmt.setString(6, vo.getStime());
			pstmt.setString(7, vo.getContent());
			pstmt.executeUpdate();
			res=1;
		} catch (SQLException e) {
			System.out.println("sql에러 : " + e.getMessage());
		}	finally {
			getConn.pstmtClose();
		}
		return res;
	}

	//일정 1건 가져오기
	public ScheduleVO getScContent(int idx) {
		vo= new ScheduleVO();
		try {
			sql="select * from schedule where idx=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs=pstmt.executeQuery();
			
			rs.next();
			vo.setIdx(rs.getInt("idx"));
			vo.setNickName(rs.getString("nickName"));
			vo.setsDate(rs.getString("sDate"));
			vo.setPart(rs.getString("part"));
			vo.setTitle(rs.getString("title"));
			vo.setPlace(rs.getString("place"));
			vo.setStime(rs.getString("stime"));
			vo.setContent(rs.getString("content"));
		} catch (SQLException e) {
			System.out.println("sql에러 : " + e.getMessage());
		}	finally {
			getConn.rsClose();
		}
		return vo;
	}

	//일정 지우기
	public int setScheduleDeleteOk(int idx) {
		int res = 0;
		try {
			sql="delete from schedule where idx=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
			res=1;
		} catch (SQLException e) {
			System.out.println("sql에러 : " + e.getMessage());
		}	finally {
			getConn.pstmtClose();
		}
		return res;
	}

	//일정관리 수정
	public int setScUpdateOk(ScheduleVO vo) {
		int res = 0;
		try {
			sql = "update schedule set sDate=?, part=?, title=?, place=?, stime=?, content=? where idx=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getsDate());
			pstmt.setString(2, vo.getPart());
			pstmt.setString(3, vo.getTitle());
			pstmt.setString(4, vo.getPlace());
			pstmt.setString(5, vo.getStime());
			pstmt.setString(6, vo.getContent());
			pstmt.setInt(7, vo.getIdx());
			pstmt.executeUpdate();
			res = 1;
		} catch (SQLException e) {
			System.out.println("SQL Error : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

	
}
