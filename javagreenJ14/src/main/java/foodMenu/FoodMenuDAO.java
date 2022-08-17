package foodMenu;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.GetConn;
import conn.TimeDiff;
import notice.NoticeVO;

public class FoodMenuDAO {
	GetConn getConn = GetConn.getInstance();
	
	private Connection conn = getConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private String sql="";
	
	FoodMenuVO vo = null;

// 전체 레코드 수 구하기
	public int totRecCnt(int recent) {
		int totRecCnt = 0;
		try {
			if(recent==0) {
				sql="select count(*) cnt from foodMenu";
				pstmt=conn.prepareStatement(sql);
			}
			else {
				sql="select count(*) cnt from foodMenu where date_sub(now(),interval ? day)<wDate";
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, recent);
			}
			rs=pstmt.executeQuery();
			
			rs.next();
			totRecCnt=rs.getInt("cnt");
		} catch (SQLException e) {
			System.out.println("1sql 에러 : " +e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return totRecCnt;
	}

//식단게시판 전체 자료 가져오기	
	public ArrayList<FoodMenuVO> getFoList(int startIndexNo, int pageSize, int i) {
		ArrayList<FoodMenuVO> vos = new ArrayList<FoodMenuVO>();
		try {
			sql="select * from foodMenu order by idx desc limit ?,?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, startIndexNo);
			pstmt.setInt(2, pageSize);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				vo=new FoodMenuVO();
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setMidIdx(rs.getInt("midIdx"));
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
				
				vo.setDownNum(rs.getInt("downNum"));
				vo.setOpenSw(rs.getString("openSw"));
				vo.setContent(rs.getString("content"));
				vo.setReadNum(rs.getInt("readNum"));
				
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("2sql오류 : " +e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vos;
	}
	
//식단게시판 검색	
	public ArrayList<FoodMenuVO> getFoSearch(String search, String searchString, int startIndexNo, int pageSize) {
		ArrayList<FoodMenuVO> vos = new ArrayList<FoodMenuVO>();
		try {
			sql="select * from foodMenu where "+search+" like ? order by idx desc limit ?,?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, "%"+searchString+"%");
			pstmt.setInt(2, startIndexNo);
			pstmt.setInt(3, pageSize);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				vo=new FoodMenuVO();
				
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setMidIdx(rs.getInt("midIdx"));
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
				
				vo.setDownNum(rs.getInt("downNum"));
				vo.setOpenSw(rs.getString("openSw"));
				vo.setContent(rs.getString("content"));
				vo.setReadNum(rs.getInt("readNum"));
				vos.add(vo);
			}
		} catch (SQLException e) {
			System.out.println("3sql 에러 : " +e.getMessage());
		} finally {
			getConn.rsClose();
		}return vos;
	}
	
// 글 조회수 1 증가
	public void setReadNum(int idx) {
		try {
			sql="update foodMenu set readNum = readNum+1 where idx=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("4sql오류 : " +e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
	}
	
// 식단 개별자료 검색 
	public FoodMenuVO getFoContent(int idx) {
		vo = new FoodMenuVO();
		try {
			sql="select * from foodMenu where idx=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setIdx(rs.getInt("idx"));
				vo.setMid(rs.getString("mid"));
				vo.setMidIdx(rs.getInt("midIdx"));
				vo.setNickName(rs.getString("nickName"));
				vo.setfName(rs.getString("fName"));
				vo.setfSName(rs.getString("fSName"));
				vo.setfSize(rs.getInt("fSize"));
				vo.setTitle(rs.getString("title"));
				vo.setwDate(rs.getString("wDate"));
				vo.setDownNum(rs.getInt("downNum"));
				vo.setOpenSw(rs.getString("openSw"));
				vo.setContent(rs.getString("content"));
				vo.setReadNum(rs.getInt("readNum"));
			}
		} catch (SQLException e) {
			System.out.println("5sql 에러 : " +e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vo;
	}

//식단게시판에 업로드된 파일 정보를 DB에 저장	
	public int setFoInput(FoodMenuVO vo) {
		int res=0;
		try {
			sql="insert into foodMenu values(default,?,?,?,?,?,?,?,default,default,?,?,default)";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setInt(2, vo.getMidIdx());
			pstmt.setString(3, vo.getNickName());
			pstmt.setString(4, vo.getfName());
			pstmt.setString(5, vo.getfSName());
			pstmt.setInt(6, vo.getfSize());
			pstmt.setString(7, vo.getTitle());
			pstmt.setString(8, vo.getOpenSw());
			pstmt.setString(9, vo.getContent());
			pstmt.executeUpdate();
			res=1;
		} catch (SQLException e) {
			System.out.println("6SQL에러 : " +e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		
		return res;
	}

// 게시글 삭제	
	public int setFoDeleteOk(int idx) {
		int res= 0;
		try {
			sql="delete from foodMenu where idx=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
			res=1;
		} catch (SQLException e) {
			System.out.println("7SQL 에러 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}
// 게시글 수정
	public int setFoUpdateOk(FoodMenuVO vo) {
		int res=0;
		try {
			sql="update foodMenu set fName=?, fSName=?, fSize=? ,title=?, openSw=?, content=? where idx=?";
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
			System.out.println("8SQL 에러 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		return res;
	}

// 다운로드 수 증가	
	public void setFoDownNum(int idx) {
		try {
			sql="update foodMenu set downNum = downNum+1 where idx=?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("9SQL 에러 : " + e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
		
	}

// 이전글, 다음글	
	public FoodMenuVO getPreNextSearch(String str, int idx) {
		vo = new FoodMenuVO();
		try {
			if(str.equals("pre")) {
				sql="select * from foodMenu where idx < ? order by idx desc limit 1";
			}
			else {
				sql="select * from foodMenu where idx > ? order by idx desc limit 1";
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
			System.out.println("SQL 에러 : " +e.getMessage());
		} finally {
			getConn.rsClose();
		}
		return vo;
	}

	// 첨부파일 DB에서 삭제하기
	public void setFoDelete(int idx) {
		try {
			sql = "update foodMenu set fName='', fSName='' where idx = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			pstmt.executeUpdate();
		}catch (SQLException e) {
			System.out.println("SQL 에러 : " +e.getMessage());
		} finally {
			getConn.pstmtClose();
		}
	}


}

	
	
