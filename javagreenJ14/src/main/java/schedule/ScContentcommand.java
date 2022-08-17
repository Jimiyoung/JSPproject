package schedule;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ScContentcommand implements ScheduleInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = request.getParameter("idx")==null ? 0 : Integer.parseInt(request.getParameter("idx"));
		String ymd = request.getParameter("ymd")==null ? "" : request.getParameter("ymd");
		//String flag = request.getParameter("flag")==null ? "" : request.getParameter("flag");
		
		ScheduleDAO dao = new ScheduleDAO();
		
		ScheduleVO vo = dao.getScContent(idx);
		vo.setYmd(ymd);
		
		request.setAttribute("vo", vo);
	}

}
