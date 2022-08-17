package entrance;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.NoticeInputOkCommand;


@WebServlet("*.en")
public class EntranceController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		EntranceInterface command = null;
		String viewPaged = "/WEB-INF";
		
		String uri = request.getRequestURI(); 
		String com = uri.substring(uri.lastIndexOf("/")+1,uri.lastIndexOf("."));
		
		if(com.equals("entrance")) {
			viewPaged += "/entrance/entrance.jsp";
		}
		else if(com.equals("entranceInput")) {
			viewPaged += "/entrance/entranceInput.jsp";
		}
		else if(com.equals("enInputOk")) {
			command = new EnInputOkCommand();
			command.execute(request, response); 
			viewPaged = "/message/message.jsp";
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPaged);
		dispatcher.forward(request, response);
	}
}
