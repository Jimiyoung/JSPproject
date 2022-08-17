package admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entrance.EntranceDAO;

public class EntranceSwOkCommand implements AdminInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx") == null ? 0 : Integer.parseInt(request.getParameter("idx"));

		EntranceDAO dao = new EntranceDAO();
		
		int res= dao.EntranceSw(idx);
		
		response.getWriter().write("1");
	}

}
