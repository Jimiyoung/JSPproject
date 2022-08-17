package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemMainCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String mid = (String) session.getAttribute("sMid");
		
		MemberDAO dao = new MemberDAO();
		
		MemberVO vo = dao.getUserInfor(mid);

		if(vo.getLevel()==0) vo.setStrLevel("관리자"); 
		else if(vo.getLevel()==1) vo.setStrLevel("준회원"); 
		else if(vo.getLevel()==2) vo.setStrLevel("학부모");
		else if(vo.getLevel()==3) vo.setStrLevel("교사"); 

		request.setAttribute("vo", vo);

//		request.setAttribute("lastDate", vo.getLastDate());
//		request.setAttribute("childName", vo.getChildName());
//		request.setAttribute("ban", vo.getBan());
	}

}
