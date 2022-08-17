package intro;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.MemJoinOkCommand;

@WebServlet("*.in")
public class IntroController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		IntroInterface command = null;
		String viewPaged = "/WEB-INF";
		
		String uri = request.getRequestURI(); 
		String com = uri.substring(uri.lastIndexOf("/")+1,uri.lastIndexOf("."));
		
		if(com.equals("road")) {
			viewPaged += "/intro/road.jsp";
		}
		else if(com.equals("greeting")) {
			viewPaged += "/intro/greeting.jsp";
		}
		
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPaged);
		dispatcher.forward(request, response);
	}
}
