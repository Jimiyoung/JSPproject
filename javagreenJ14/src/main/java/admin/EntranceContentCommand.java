package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.AdminInterface;
import entrance.EntranceDAO;
import entrance.EntranceVO;

public class EntranceContentCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null?0:Integer.parseInt(request.getParameter("idx"));
		
		EntranceDAO dao = new EntranceDAO();
		
		EntranceVO vo = dao.getEnContent(idx);
				
		request.setAttribute("vo", vo);
	}

}
