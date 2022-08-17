package admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.ad")
public class AdminController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		AdminInterface command = null;
		String viewPaged = "/WEB-INF";
		
		String uri = request.getRequestURI(); 
		String com = uri.substring(uri.lastIndexOf("/")+1,uri.lastIndexOf("."));
		
		if(com.equals("adMemList")) {
			command=new AdMemListCommand();
			command.execute(request, response);
			viewPaged += "/admin/adMemList.jsp";
		}
		else if(com.equals("adMemLevelChange")) {
			command=new AdMemLevelChangeCommand();
			command.execute(request, response);
			viewPaged = "/message/message.jsp";
		}
		else if(com.equals("adMemBanChange")) {
			command=new AdMemBanChangeCommand();
			command.execute(request, response);
			viewPaged = "/message/message.jsp";
		}
		else if(com.equals("entranceList")) {
			command=new EntranceListCommand();
			command.execute(request, response);
			viewPaged += "/admin/entranceList.jsp";
		}
		else if(com.equals("entranceContent")) {
			command = new EntranceContentCommand();
			command.execute(request, response); 
			viewPaged += "/admin/entranceContent.jsp";
		}
		else if(com.equals("entranceSw")) {
			command = new EntranceSwOkCommand();
			command.execute(request, response); 
			return;
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPaged);
		dispatcher.forward(request, response);
	}
}
