package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemIdFindCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name")==null?"":request.getParameter("name");
		String email = request.getParameter("email")==null?"":request.getParameter("email");

		MemberDAO dao = new MemberDAO();
		
		String mid = dao.getMidFind(name,email);
		
		if(mid.equals("")) {
			request.setAttribute("msg", "MidFindNo");
			request.setAttribute("url", request.getContextPath()+"/member/memFind.mem");
		}
		else {
			HttpSession session = request.getSession();
			session.setAttribute("imsiSession", mid);
			
			request.setAttribute("msg", "MidFindOk");
			request.setAttribute("url", request.getContextPath()+"/member/memLogin.mem");
		}
		
				
	}

}
