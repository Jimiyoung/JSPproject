package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemInforCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid")==null? "" : request.getParameter("mid");
		
		MemberDAO dao = new MemberDAO();
		
		MemberVO vo = dao.getUserInfor(mid);

		if(vo.getLevel()==0) vo.setStrLevel("관리자"); 
		else if(vo.getLevel()==1) vo.setStrLevel("준회원"); 
		else if(vo.getLevel()==2) vo.setStrLevel("학부모");
		else if(vo.getLevel()==3) vo.setStrLevel("교사"); 
		
		request.setAttribute("vo", vo);
	}
}
