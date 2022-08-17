package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemNickCheckCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nickName = request.getParameter("nickName")==null ? "" : request.getParameter("nickName");
		
		MemberDAO dao = new MemberDAO();
		
		String name = dao.memNickCheck(nickName);
		
		if(name.equals("")) { // 사용가능한 아이디
			request.setAttribute("res", 1);
		}
		else {
			request.setAttribute("res", 0); //사용불가한(중복된) 아이디는 res에 0을 넘김
		}
		request.setAttribute("nickName", nickName);
	}
}
