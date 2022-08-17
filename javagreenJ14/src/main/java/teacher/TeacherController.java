package teacher;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("*.te")
public class TeacherController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		TeacherInterface command = null;
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
		if(com.equals("teList")) {
			command = new TeListCommand();
			command.execute(request, response); 
			viewPaged += "/intro/teacherIntro/teList.jsp";
		} 
		else if(com.equals("teInput")) {
			viewPaged += "/intro/teacherIntro/teInput.jsp";
		} 
		else if(com.equals("teInputOk")) {
			command = new TeInputOkCommand();
			command.execute(request, response); 
			viewPaged  = "/message/message.jsp";
		} 
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPaged);
		dispatcher.forward(request, response);
	}
}
