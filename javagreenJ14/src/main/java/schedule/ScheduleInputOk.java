package schedule;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/scheduleInputOk")
public class ScheduleInputOk extends HttpServlet{
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String nickName = request.getParameter("nickName")==null ? "" : request.getParameter("nickName");
		String ymd = request.getParameter("ymd")==null ? "" : request.getParameter("ymd");
		String part = request.getParameter("part")==null ? "" : request.getParameter("part");
		String title = request.getParameter("title")==null ? "" : request.getParameter("title");
		String place = request.getParameter("place")==null ? "" : request.getParameter("place");
		String stime = request.getParameter("stime")==null ? "" : request.getParameter("stime");
		String content = request.getParameter("content")==null ? "" : request.getParameter("content");
		
		ScheduleVO vo = new ScheduleVO();
		vo.setNickName(nickName);
		vo.setsDate(ymd);
		vo.setPart(part);
		vo.setTitle(title);
		vo.setPlace(place);
		vo.setStime(stime);
		vo.setContent(content);
		
		ScheduleDAO dao = new ScheduleDAO();
		
		int res = dao.setScheduleInputOk(vo);
		
		if(res ==1) {
			response.getWriter().write("scheduleInputOk");
		}
		else {
			response.getWriter().write("scheduleInputNo");
		}
		
				
	}	
}
