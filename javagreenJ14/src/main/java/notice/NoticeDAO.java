package notice;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.GetConn;
import conn.TimeDiff;

public class NoticeDAO  {
	GetConn getConn = GetConn.getInstance();
	
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	
	NoticeVO vo = null;

// 공지사항 전체	자료 가져오기
	public ArrayList<NoticeVO> getNoticeList(int startIndexNo, int pageSize, int i) {
		ArrayList<NoticeVO> vos = new ArrayList<NoticeVO>();
		try {
			sql="select * from notice order by idx desc limit ?,?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, startIndexNo);
			pstmt.setInt(2, pageSize);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new NoticeVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setNickName(rs.getString("nickName"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setReadNum(rs.getInt("readNum"));
				vo.setMid(rs.getString("mid"));
				
			// 날짜를 24시간제로 체크하기위해서 사용자가 만든 클래스의 메소드로 처리한다.(timeDiff())
				vo.setwDate(rs.getString("wDate"));
				vo.setwCdate(rs.getString("wDate"));
				TimeDiff timeDiff = new TimeDiff();	// 날짜계산하는 사용자 클래스
				int res = timeDiff.timeDiff(vo.getwCdate());
				vo.setwNdate(res);  	// 오늘날짜와 글쓴날짜의 시간차를 숫자형식변수에 저장시켜준다.	
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("sql오류 : " +e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vos;
	}
	
// 전체 레코드 수 구하기
	public int totRecCnt(int recent) {
		int totRecCnt = 0;
		try {
			if(recent == 0) {
				sql = "select count(*) as cnt from notice";
				pstmt = conn.prepareStatement(sql);
			}
			else {
				sql = "select count(*) as cnt from notice where date_sub(now(), interval ? day) < wDate";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, recent);
			}
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

//공지사항 저장	
	public int setNoticeInputOk(NoticeVO vo) {
		int res= 0;
		try {
			sql="insert into notice values(default,?,?,?,default,default,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getNickName());
			pstmt.setString(2, vo.getTitle());
			pstmt.setString(3, vo.getContent());
			pstmt.setString(4, vo.getMid());
			pstmt.executeUpdate();
			res=1;
		} catch (SQLException e) {
			System.out.println("sql오류 : " +e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

//공지사항 검색기 처리
	public ArrayList<NoticeVO> getNoticeSearch(String search, String searchString) {
		ArrayList<NoticeVO> vos =	new ArrayList<NoticeVO>();
		try {
			sql="select * from notice where "+search+" like ? order by idx desc";  //like 포함연산자
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, "%"+searchString+"%");
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new NoticeVO();
				
				vo.setIdx(rs.getInt("idx"));
				vo.setNickName(rs.getString("nickName"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				
				// 날짜를 24시간제로 체크하기 위해 사용자가 만든 클래스의 메소드로 처리(timeDiff())
				vo.setwDate(rs.getString("wDate"));
				vo.setwCdate(rs.getString("wDate"));
				TimeDiff timeDiff = new TimeDiff();  // 날짜계산하는 사용자 클래스
				int res = timeDiff.timeDiff(vo.getwCdate());
				vo.setwNdate(res);  // 오늘 날짜와 글 쓴 날짜의 시간차를 숫자형식변수에 저장시킴
				
				vo.setReadNum(rs.getInt("readNum"));
				vo.setMid(rs.getString("mid"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("sql 에러 : " +e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vos;
	}

//글 조회수 1 증가
	public void setReadNum(int idx) {
		try {
			sql="update notice set readNum = readNum+1 where idx=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
		
		} catch (SQLException e) {
			System.out.println("sql오류 : " +e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
	}

// 공지사항 글 1개의 모든 내용을 가져온다.
	public NoticeVO getNoticeContent(int idx) {
		vo = new NoticeVO();
		try {
			sql="select * from notice where idx=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setNickName(rs.getString("nickName"));
				vo.setTitle(rs.getString("title"));
				vo.setContent(rs.getString("content"));
				vo.setwDate(rs.getString("wDate"));
				vo.setReadNum(rs.getInt("readNum"));
				vo.setMid(rs.getString("mid"));
			}
		} catch (SQLException e) {
			System.out.println("sql오류 : " +e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vo;
	}

	public NoticeVO getPreNextSearch(String str, int idx) {
		vo = new NoticeVO();
		try {
			if(str.equals("pre")) {
				sql="select * from notice where idx < ? order by idx desc limit 1";
			}
			else {
				sql="select * from notice where idx > ? limit 1";
			}
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			
			if(str.equals("pre") && rs.next()) {
				vo.setPreIdx(rs.getInt("idx"));
				vo.setPreTitle(rs.getString("title"));
			}
			else if(str.equals("next") && rs.next()) {
				vo.setNextIdx(rs.getInt("idx"));
				vo.setNextTitle(rs.getString("title"));
			}
		}catch (SQLException e) {
			System.out.println("SQL 에러 : " +e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vo;
	}

// 게시글 삭제
	public int setNoticeDeleteOk(int idx) {
		int res = 0;
		try {
			sql="delete from notice where idx=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
			res=1;
		}catch (SQLException e) {
			System.out.println("SQL 에러 : " +e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}
// 게시글 수정
	public int setNoticeUpdateOk(NoticeVO vo) {
		int res = 0;
		try {
			sql="update notice set title=?, content=? where idx=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setInt(3, vo.getIdx());
			pstmt.executeUpdate();
			res=1;
		}catch (SQLException e) {
			System.out.println("SQL 에러 : " +e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}
	
	
}

	
	
	
