package schedule;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("*.sc")
public class ScheduleController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ScheduleInterface command = null;
		String viewPaged = "/WEB-INF";
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/")+1,uri.lastIndexOf("."));
		
//		// 세션이 끊겼으면 작업 진행을 로그인 창으로 보냄.
//		HttpSession session = request.getSession();
//		int level = session.getAttribute("sLevel")==null ? 99 : (int) session.getAttribute("sLevel");
//		
//		if(level > 4 || level ==1) { 	// 세션이 끊겼으면 작업 진행을 로그인 창으로 보냄.
//			RequestDispatcher dispatcher = request.getRequestDispatcher("/");
//			dispatcher.forward(request, response);
//		}
		if(com.equals("schedule")) {
			command = new Schedulecommand();
			command.execute(request, response); 
			viewPaged += "/education/schedule/schedule.jsp";
		} 
		else if(com.equals("scMenu")) {
			command = new ScMenucommand();
			command.execute(request, response); 
			viewPaged += "/education/schedule/scMenu.jsp";
		} 
		else if(com.equals("scContent")) {
			command = new ScContentcommand();
			command.execute(request, response); 
			viewPaged += "/education/schedule/scContent.jsp";
		} 
		else if(com.equals("scUpdate")) {
			command = new ScContentcommand();
			command.execute(request, response); 
			viewPaged += "/education/schedule/scUpdate.jsp";
		} 
		else if(com.equals("scUpdateOk")) {
			command = new ScUpdateOkcommand();
			command.execute(request, response); 
			viewPaged = "/message/message.jsp";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPaged);
		dispatcher.forward(request, response);
	}
}
