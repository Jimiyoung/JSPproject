package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemPwdFindCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null?"":request.getParameter("mid");
		String email = request.getParameter("email")==null?"":request.getParameter("email");
		
		MemberDAO dao = new MemberDAO();
		
		int res = dao.getPwdFind(mid,email);
		
		if(res ==1) {
			HttpSession session = request.getSession();
			session.setAttribute("imsiSession", mid);
			
			request.setAttribute("msg", "PwdFindOk");
			request.setAttribute("url", request.getContextPath()+"/memPwdReset.mem");
		}
		else {
			request.setAttribute("msg", "PwdFindNo");
			request.setAttribute("url", request.getContextPath()+"/memFind.mem");
		}
		
	}

}
