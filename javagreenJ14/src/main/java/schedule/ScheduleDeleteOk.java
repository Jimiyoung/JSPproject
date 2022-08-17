package schedule;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/scheduleDeleteOk")
public class ScheduleDeleteOk extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
		
		ScheduleDAO dao = new ScheduleDAO();
		
		int res = dao.setScheduleDeleteOk(idx);
		
		if(res ==1) {
			response.getWriter().write("scheduleDeleteOk");
		}
		else {
			response.getWriter().write("scheduleDeleteNo");
		}
	}
}
