package entrance;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.GetConn;
import conn.TimeDiff;
import member.MemberVO;

public class EntranceDAO  {
	GetConn getConn = GetConn.getInstance();
	
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	
	EntranceVO vo = null;

// 입학대기신청	
	public int setEnInputOk(EntranceVO vo) {
		int res=0;
		try {
			sql="insert into entrance values(default,?,?,?,?,?,?,?,?,default)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getpName());
			pstmt.setString(2, vo.getRelation());
			pstmt.setString(3, vo.getTel());
			pstmt.setString(4, vo.getAddress());
			pstmt.setString(5, vo.getcName());
			pstmt.setString(6, vo.getGender());
			pstmt.setString(7, vo.getBirthday());
			pstmt.setString(8, vo.getContent());
			pstmt.executeUpdate();
			res=1;
		} catch (SQLException e) {
			System.out.println("1SQL 에러 : " +e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

// 관리자가 입학대기 리스트
	public ArrayList<EntranceVO> getEntranceList(String sw) {
		ArrayList<EntranceVO> vos = new ArrayList<EntranceVO>();
		try {
			if(sw.equals("전체")){
				sql="select * from entrance order by idx desc";
				pstmt=conn.prepareStatement(sql);
			}
			else {
				sql="select * from entrance where sw=? order by idx desc";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, sw);
			}
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo = new EntranceVO();
				
				vo.setIdx(rs.getInt("idx"));
				vo.setpName(rs.getString("pName"));
				vo.setRelation(rs.getString("relation"));
				vo.setTel(rs.getString("tel"));
				vo.setAddress(rs.getString("address"));
				vo.setcName(rs.getString("cName"));
				vo.setGender(rs.getString("gender"));
				vo.setBirthday(rs.getString("birthday"));
				vo.setContent(rs.getString("content"));
				vo.setSw(rs.getString("sw"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("2SQL 에러 : " +e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vos;
	}

// 개별 자료 가져오기	
	public EntranceVO getEnContent(int idx) {
		vo = new EntranceVO();
		try {
			sql="select * from entrance where idx=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs= pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setpName(rs.getString("pName"));
				vo.setRelation(rs.getString("relation"));
				vo.setTel(rs.getString("tel"));
				vo.setAddress(rs.getString("address"));
				vo.setcName(rs.getString("cName"));
				vo.setGender(rs.getString("gender"));
				vo.setBirthday(rs.getString("birthday"));
				vo.setContent(rs.getString("content"));
				vo.setSw(rs.getString("sw"));
			}
		} catch (SQLException e) {
			System.out.println("3sql 에러 : " +e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vo;
	}

// 확인 여부 체크	
	public int EntranceSw(int idx) {
		int res = 0;
		try {
			sql="update entrance set sw= 'YES' where idx=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
			res=1;
		} catch (SQLException e) {
			System.out.println("4SQL 에러 : " +e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

	// 총 레코드 수
	public int totRecCnt() {
		int totRecCnt = 0;
		try {
			sql = "select count(*) as cnt from entrance";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			rs.next();
			totRecCnt=rs.getInt("cnt");
		} catch (SQLException e) {
			System.out.println("14sql 에러 : " +e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return totRecCnt;
	}


	
}

	
	
	
