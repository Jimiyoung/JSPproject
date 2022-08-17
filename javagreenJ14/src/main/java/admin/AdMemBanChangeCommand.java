package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemberDAO;

public class AdMemBanChangeCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx =  Integer.parseInt(request.getParameter("idx"));
		String ban = request.getParameter("ban");
		 
		MemberDAO dao = new MemberDAO();

		dao.setMemBanChange(idx,ban);
		
		request.setAttribute("msg", "banChangeOk");
		request.setAttribute("url", request.getContextPath()+"/adMemList.ad");
		
	}

}
