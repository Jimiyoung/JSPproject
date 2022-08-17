package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.GetConn;

public class MemberDAO {
	GetConn getConn = GetConn.getInstance();
	
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	
	MemberVO vo = null;

// 아이디 중복체크
	public String memIdCheck(String mid) {
		String name="";
		try {
			sql="select name from member where mid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs=pstmt.executeQuery();
			if(rs.next()) name=rs.getString(1);
		} catch (SQLException e) {
			System.out.println("1SQL 에러 : " +e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return name;
	}

//닉네임 중복체크
	public String memNickCheck(String nickName) {
		String name = "";
		try {
			sql="select name from member where nickName=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,nickName);
			rs = pstmt.executeQuery();
			if(rs.next()) name= rs.getString(1);  //(1) or ("name")
		} catch (SQLException e) {
			System.out.println("2SQL 에러 : " +e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return name;
	}

//회원가입처리
	public int setMemJoinOk(MemberVO vo) {
		int res=0;
		try {
			sql="insert into member values(default,?,?,?,?,?,?,?,?,?,?,default,default,default,default)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getPwd());
			pstmt.setString(3, vo.getName());
			pstmt.setString(4, vo.getNickName());
			pstmt.setString(5, vo.getChildName());
			pstmt.setString(6, vo.getBan());
			pstmt.setString(7, vo.getTel());
			pstmt.setString(8, vo.getAddress());
			pstmt.setString(9, vo.getEmail());
			pstmt.setString(10, vo.getBirthday());
			pstmt.executeUpdate();
			res=1;
		} catch (SQLException e) {
			System.out.println("3SQL 에러 : " +e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

//로그인체크(아이디와 비밀번호 체크)
	public MemberVO getMemLoginOk(String mid, String pwd) { 
		vo = new MemberVO();
		try {
			sql="select * from member where mid=? and pwd=? and userDel='NO'";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setNickName(rs.getString("nickName"));
				vo.setLevel(rs.getInt("level"));
			}
		} catch (SQLException e) {
			System.out.println("4SQL 에러 : " +e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vo;
	}

//개별 회원 정보를 모두 DB에서 가져와서 vo에 담아준다.
	public MemberVO getUserInfor(String mid) {
		vo = new MemberVO();
		try {
			sql="select * from member where mid=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			rs=pstmt.executeQuery();
			rs.next();
			
			vo.setIdx(rs.getInt("idx"));
			vo.setMid(rs.getString("mid"));
			vo.setPwd(rs.getString("pwd"));
			vo.setName(rs.getString("name"));
			vo.setNickName(rs.getString("nickName"));
			vo.setChildName(rs.getString("childName"));
			vo.setBan(rs.getString("ban"));
			vo.setTel(rs.getString("tel"));
			vo.setAddress(rs.getString("address"));
			vo.setEmail(rs.getString("email"));
			vo.setBirthday(rs.getString("birthday"));
			vo.setStartDate(rs.getString("startDate"));
			vo.setLastDate(rs.getString("lastDate"));
			vo.setUserDel(rs.getString("userDel"));
			vo.setLevel(rs.getInt("level"));
			
		} catch (SQLException e) {
			System.out.println("5SQL 에러 : " +e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vo;
	}

//회원정보 수정
	public int setMemUpdateOk(MemberVO vo) {
		int res = 0;
		try {
			sql="update member set childName=?, ban=?, tel=?, address=?, email=? where mid=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getChildName());
			pstmt.setString(2, vo.getBan());
			pstmt.setString(3, vo.getTel());
			pstmt.setString(4, vo.getAddress());
			pstmt.setString(5, vo.getEmail());
			pstmt.setString(6, vo.getMid());
			pstmt.executeUpdate();
			res=1;
		} catch (SQLException e) {
			System.out.println("6SQL 에러 : " +e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

// 회원 자료 전체 보기
	public ArrayList<MemberVO> getMemList(int startIndexNo, int pageSize, String ban) {
		ArrayList<MemberVO> vos = new ArrayList<MemberVO>();
		try {
			if(ban.equals("전체")) {
				sql="SELECT *,TIMESTAMPDIFF(DAY, lastDate, NOW()) as applyDiff from member order by idx desc limit ?,?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, startIndexNo);
				pstmt.setInt(2, pageSize);
			}
			else {
				sql="SELECT *,TIMESTAMPDIFF(DAY, lastDate, NOW()) as applyDiff from member where ban=? order by idx desc limit ?,?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, ban);
				pstmt.setInt(2, startIndexNo);
				pstmt.setInt(3, pageSize);
			}
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new MemberVO();
				
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setPwd(rs.getString("pwd"));
				vo.setName(rs.getString("name"));
				vo.setNickName(rs.getString("nickName"));
				vo.setChildName(rs.getString("childName"));
				vo.setBan(rs.getString("ban"));
				vo.setTel(rs.getString("tel"));
				vo.setAddress(rs.getString("address"));
				vo.setEmail(rs.getString("email"));
				vo.setBirthday(rs.getString("birthday"));
				vo.setStartDate(rs.getString("startDate"));
				vo.setLastDate(rs.getString("lastDate"));
				vo.setUserDel(rs.getString("userDel"));
				vo.setLevel(rs.getInt("level"));
				vo.setApplyDiff(rs.getInt("applyDiff"));
				
			  vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("7SQL 에러 : " +e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vos;
	}

//회원 등급 변경
	public void setMemLevelChange(int idx, int level) {
		try {
			sql="update member set level= ? where idx=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, level);
			pstmt.setInt(2, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("SQL 에러 : " +e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
	}

//회원 탈퇴 신청 처리하기
	public int setMemDeleteUpdate(String mid) {
		int res=0;
		try {
			sql="update member set userDel='OK' where mid=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.executeUpdate();
			
			res=1;
		} catch (SQLException e) {
			System.out.println("8SQL 에러 : " +e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

	//
//탈퇴신청 후 30일이 경과된 회원을 DB에서 완전히 삭제
	public int setUserDelete(int idx) {
		int res=0;
		try {
			sql="delete from member where idx=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
			res=1;
		} catch (SQLException e) {
			System.out.println("9SQL 에러 : " +e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

// 학급변경
	public void setMemBanChange(int idx, String ban) {
		try {
			sql="update member set ban= ? where idx=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, ban);
			pstmt.setInt(2, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("10SQL 에러 : " +e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
	}

//아이디찾기
	public String getMidFind(String name, String email) {
		String mid = "";
		try {
			sql="select mid from member where name=? and email=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			rs=pstmt.executeQuery();
			if(rs.next()) mid=rs.getString(1);
			
		} catch (SQLException e) {
			System.out.println("11SQL 에러 : " +e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return mid;
	}

//비밀번호찾기	
	public int getPwdFind(String mid, String email) {
		int res=0;
		try {
			sql="select * from member where mid=? and email=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.setString(2, email);
			rs=pstmt.executeQuery();
			if(rs.next())
			res=1;
		} catch (SQLException e) {
			System.out.println("12SQL 에러 : " +e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return res;
	}

//비밀번호 재설정	
	public int setPwdReset(String pwd, String mid) {
		int res = 0;
		try {
			sql="update member set pwd= ? where mid=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, pwd);
			pstmt.setString(2, mid);
			pstmt.executeUpdate();
			res=1;
		} catch (SQLException e) {
			System.out.println("13SQL 에러 : " +e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}
	
//총 레코드 건수 구하기
	public int totRecCnt() {
		int totRecCnt = 0;
		try {
			sql = "select count(*) from member";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			rs.next();
			totRecCnt=rs.getInt(1);
		} catch (SQLException e) {
			System.out.println("14sql 에러 : " +e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return totRecCnt;
	}
	
//마지막 방문일 
	public void setLsastDate(String mid) {
		try {
			sql="update member set lastDate = now() where mid=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, mid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("15sql 에러 : " +e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		
	}
	
}
