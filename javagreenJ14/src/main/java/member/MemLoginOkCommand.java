package member;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import conn.SecurityUtil;

public class MemLoginOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "": request.getParameter("mid");
		String pwd = request.getParameter("pwd")==null ? "": request.getParameter("pwd");
	
		//비밀번호 암호화
		SecurityUtil security = new SecurityUtil();
		pwd = security.encryptSHA256(pwd);
		
		MemberDAO dao = new MemberDAO();
		MemberVO vo = dao.getMemLoginOk(mid,pwd);
		
		//session.invalidate();  // 세션 끊음
		
		//로그인 실패
		if(vo.getNickName()==null) {
			request.setAttribute("msg", "loginNo");
			request.setAttribute("url", request.getContextPath()+"/memLogin.mem");
			return;
		}
		
		//로그인 성공(1. 주요자료 세션 저장 2. 쿠키에 아이디 저장유무 )
		HttpSession session = request.getSession();
		
		session.setAttribute("sMid", mid);
		session.setAttribute("sNickName", vo.getNickName());
		session.setAttribute("sLevel", vo.getLevel());
		session.setAttribute("sName", vo.getName());
		
		//아이디저장
		
		String idCheck=request.getParameter("idCheck")==null ? "off" : "on";
		Cookie cookieMid = new Cookie("cMid", mid);  // 쿠키변수 'cMid'에 사용자 아이디인 'mid'를 넣어서 생성한다.
		if(idCheck.equals("on")) {
			cookieMid.setMaxAge(60*60*24*7);	// cookieMid 쿠키 만료시간은 7일
		}
		else {
			cookieMid.setMaxAge(0);	// cookieMid 쿠키 삭제
		}
		response.addCookie(cookieMid);
		request.setAttribute("msg", "loginOk");
		request.setAttribute("url", request.getContextPath()+"/memMain.mem");
	
	}

}
