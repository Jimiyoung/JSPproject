package admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;
import member.MemberVO;

public class AdMemLevelChangeCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = Integer.parseInt(request.getParameter("idx"));
		int level = Integer.parseInt(request.getParameter("level"));
		
		MemberDAO dao = new MemberDAO();
		
		dao.setMemLevelChange(idx, level);
		
		request.setAttribute("msg", "levelChangeOk");
		request.setAttribute("url", request.getContextPath()+"/adMemList.ad");
		
	}

}
