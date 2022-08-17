package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import conn.SecurityUtil;

public class MemPwdResetOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mid = (String)	session.getAttribute("imsiSession");
		String pwd = request.getParameter("pwd")== null? "" : request.getParameter("pwd");
	
		MemberDAO dao = new MemberDAO();
		
	// 비밀번호 암호화처리(sha256)
		SecurityUtil security = new SecurityUtil();
		pwd = security.encryptSHA256(pwd);
		
		int res = dao.setPwdReset(pwd,mid);
		
		session.invalidate();  // 세션 끊음
		
		if(res==1) {
			request.setAttribute("msg", "pwdResetOk");
			request.setAttribute("url", request.getContextPath()+"/memLogin.mem");
		}
		else {
			request.setAttribute("msg", "pwdResetNo");
			request.setAttribute("url", request.getContextPath()+"/memFind.mem");
		}
	}

}
