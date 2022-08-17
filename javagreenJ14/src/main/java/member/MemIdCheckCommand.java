package member;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemIdCheckCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null ? "" : request.getParameter("mid");
		
		MemberDAO dao = new MemberDAO();
		
		String name = dao.memIdCheck(mid);
		
		if(name.equals("")) { // 사용가능한 아이디
			request.setAttribute("res", 1);
		}
		else {
			request.setAttribute("res", 0); //사용불가한(중복된) 아이디는 res에 0을 넘김
		}
		request.setAttribute("mid", mid);
	}

}
