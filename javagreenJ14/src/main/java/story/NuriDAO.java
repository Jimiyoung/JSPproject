package story;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.GetConn;
import conn.TimeDiff;
import foodMenu.FoodMenuVO;

public class NuriDAO  {
	GetConn getConn = GetConn.getInstance();
	
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql = "";
	
	NuryVO vo = null;

	public int totRecCnt() {
		int totRecCnt = 0;
		try {
			sql = "select count(*) from nuri";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			rs.next();
			totRecCnt=rs.getInt(1);
		} catch (SQLException e) {
			System.out.println("1sql 에러 : " +e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return totRecCnt;
	}

// 누리반 게시글 전체 가져오기	
	public ArrayList<NuryVO> getNuriList(int startIndexNo, int pageSize) {
		ArrayList<NuryVO> vos = new ArrayList<NuryVO>();
		try {
			sql="select *,(select count(*) from nuriReply where nuriIdx=nuri.idx) as replyCount from nuri order by idx desc limit ?,?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, startIndexNo);
			pstmt.setInt(2, pageSize);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				vo = new NuryVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setNickName(rs.getString("nickName"));
				vo.setfName(rs.getString("fName"));
				vo.setfSName(rs.getString("fSName"));
				vo.setfSize(rs.getInt("fSize"));
				vo.setTitle(rs.getString("title"));
				
			// 날짜를 24시간제로 체크하기위해서 사용자가 만든 클래스의 메소드로 처리한다.(timeDiff())
				vo.setwDate(rs.getString("wDate"));
				vo.setwCdate(rs.getString("wDate"));
				TimeDiff timeDiff = new TimeDiff(); // 날짜계산하는 사용자 클래스
				int res = timeDiff.timeDiff(vo.getwCdate());
				vo.setwNdate(res); // 오늘날짜와 글쓴날짜의 시간차를 숫자형식변수에 저장시켜준다.	
				
				vo.setOpenSw(rs.getString("openSw"));
				vo.setContent(rs.getString("content"));
				vo.setReadNum(rs.getInt("readNum"));
				vo.setGood(rs.getInt("good"));
				vo.setReplyCount(rs.getInt("replyCount"));
			
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("2sql오류 : " +e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vos;
	}

// 누리게시판 db 저장 
	public int setNuriInputOk(NuryVO vo) {
		int res=0;
		try {
			sql="insert into nuri values(default,?,?,?,?,?,?,default,?,?,default,default)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getNickName());
			pstmt.setString(3, vo.getfName());
			pstmt.setString(4, vo.getfSName());
			pstmt.setInt(5, vo.getfSize());
			pstmt.setString(6, vo.getTitle());
			pstmt.setString(7, vo.getOpenSw());
			pstmt.setString(8, vo.getContent());
			pstmt.executeUpdate();
			res=1;
		} catch (SQLException e) {
			System.out.println("3SQL에러 : " +e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		
		return res;
	}
	
//글 조회수 1 증가
	public void setReadNum(int idx) {
		try {
			sql="update nuri set readNum = readNum+1 where idx=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("4sql오류 : " +e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
	}

// 누리게시글 개별자료	
	public NuryVO getNuriContent(int idx) {
		vo = new NuryVO();
		try {
			sql="select * from nuri where idx=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setNickName(rs.getString("nickName"));
				vo.setfName(rs.getString("fName"));
				vo.setfSName(rs.getString("fSName"));
				vo.setfSize(rs.getInt("fSize"));
				vo.setTitle(rs.getString("title"));
				vo.setwDate(rs.getString("wDate"));
				vo.setOpenSw(rs.getString("openSw"));
				vo.setContent(rs.getString("content"));
				vo.setReadNum(rs.getInt("readNum"));
				vo.setGood(rs.getInt("good"));
			}
		} catch (SQLException e) {
			System.out.println("5sql 에러 : " +e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vo;
	}

	public NuryVO getPreNextSearch(String str, int idx) {
		vo = new NuryVO();
		try {
			if(str.equals("pre")) {
				sql="select * from nuri where idx < ? order by idx desc limit 1";
			}
			else {
				sql="select * from nuri where idx > ? order by idx desc limit 1";
			}
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs=pstmt.executeQuery();
			
			if(str.equals("pre") && rs.next()) {
				vo.setPreIdx(rs.getInt("idx"));
				vo.setPreTitle(rs.getString("title"));
			}
			else if(str.equals("next") && rs.next()) {
				vo.setNextIdx(rs.getInt("idx"));
				vo.setNextTitle(rs.getString("title"));
			}
		}catch (SQLException e) {
			System.out.println("6SQL 에러 : " +e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vo;
	}

// 좋아요 증가
	public void setGoodCount(int idx) {
		try {
			sql="update nuri set good = good+1 where idx=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("7sql오류 : " +e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
	}

// 게시글 삭제	
	public int setNuriDeleteOk(int idx) {
		int res= 0;
		try {
			sql="delete from nuri where idx=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
			res=1;
		} catch (SQLException e) {
			System.out.println("8SQL 에러 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}
//첨부파일 DB에서 삭제하기
	public void setNuriDelete(int idx) {
		try {
			sql = "update nuri set fName='', fSName='' where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
		}catch (SQLException e) {
			System.out.println("9SQL 에러 : " +e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
	}

// 게시글 수정
	public int setNuriUpdateOk(NuryVO vo) {
		int res=0;
		try {
			sql="update nuri set fName=?, fSName=?, fSize=? ,title=?, openSw=?, content=? where idx=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getfName());
			pstmt.setString(2, vo.getfSName());
			pstmt.setInt(3, vo.getfSize());
			pstmt.setString(4, vo.getTitle());
			pstmt.setString(5, vo.getOpenSw());
			pstmt.setString(6, vo.getContent());
			pstmt.setInt(7, vo.getIdx());
			pstmt.executeUpdate();
			res=1;
		} catch (SQLException e) {
			System.out.println("10SQL 에러 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}
	
// 댓글 수정
	public int setReplyUpdateOk(int idx, String content) {
		int res=0;
		try {
			sql="update nuriReply set content=? where idx=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, content);
			pstmt.setInt(2, idx);
			pstmt.executeUpdate();
			res=1;
		}catch (SQLException e) {
			System.out.println("11.SQL 에러 : " +e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

// 댓글 입력	
	public int setReplyInputOk(NuriReplyVO replyVo) {
		int res=0;
		try {
			sql="insert into nuriReply values (default,?,?,?,default,?)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, replyVo.getNuriIdx());
			pstmt.setString(2, replyVo.getMid());
			pstmt.setString(3, replyVo.getNickName());
			pstmt.setString(4, replyVo.getContent());
			pstmt.executeUpdate();
			res=1;
		}catch (SQLException e) {
			System.out.println("12.SQL 에러 : " +e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

// 부모글에 해당하는 댓글 내용 가져오기
	public ArrayList<NuriReplyVO> getNuriReply(int nuriIdx) {
		ArrayList<NuriReplyVO> replyVos = new ArrayList<NuriReplyVO>();
		try {
			sql="select * from nuriReply where nuriIdx=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, nuriIdx);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				NuriReplyVO replyVo=new NuriReplyVO();
				replyVo.setIdx(rs.getInt("idx"));
				replyVo.setNuriIdx(rs.getInt("nuriIdx"));
				replyVo.setMid(rs.getString("mid"));
				replyVo.setNickName(rs.getString("nickName"));
				
			// 날짜를 24시간제로 체크하기 위해 사용자가 만든 클래스의 메소드로 처리(timeDiff())
				replyVo.setwDate(rs.getString("wDate"));
				replyVo.setwCdate(rs.getString("wDate"));
				TimeDiff timeDiff = new TimeDiff();  // 날짜계산하는 사용자 클래스
				int res = timeDiff.timeDiff(replyVo.getwCdate());
				replyVo.setwNdate(res);  // 오늘 날짜와 글 쓴 날짜의 시간차를 숫자형식변수에 저장시킴
				
				replyVo.setContent(rs.getString("content"));
				replyVos.add(replyVo);
			}
		}catch (SQLException e) {
			System.out.println("13.SQL 에러 : " +e.getMessage());
		} finally {
			getConn.rsClose();
		}
		
		return replyVos;
	}

//댓글 수정을 위해 선택한 댓글의 내용을 가져오기 위한 처리
	public String getReplyContent(int replyIdx) {
		String content="";
		try { 
			sql="select content from nuriReply where idx = ?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, replyIdx);
			rs=pstmt.executeQuery();
			rs.next();
			content = rs.getString(1);
		}catch (SQLException e) {
			System.out.println("14.SQL 에러 : " +e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return content;
	}
	
//댓글 삭제
	public int nuriReplyDeleteOk(int idx) {
		int res = 0;
		try {
			sql="delete from nuriReply where idx=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
			res=1;
		}catch (SQLException e) {
			System.out.println("15.SQL 에러 : " +e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

}
	


	
	
	
