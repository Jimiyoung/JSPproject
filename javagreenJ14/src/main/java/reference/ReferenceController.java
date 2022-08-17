package reference;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.MemJoinOkCommand;

@WebServlet("*.re")
public class ReferenceController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ReferenceInterface command = null;
		String viewPaged = "/WEB-INF";
		
		String uri = request.getRequestURI(); 
		String com = uri.substring(uri.lastIndexOf("/")+1,uri.lastIndexOf("."));

		if(com.equals("reList")) {
			command = new ReListCommand();
			command.execute(request, response); 
			viewPaged += "/board/reference/reList.jsp";
		}
		else if(com.equals("reInput")) {
			viewPaged += "/board/reference/reInput.jsp";
		}
		else if(com.equals("reInputOk")) {
			command = new ReOkCommand();
			command.execute(request, response); 
			viewPaged = "/message/message.jsp";
		}
		else if(com.equals("reSearch")) {
			command = new ReSearchCommand();
			command.execute(request, response); 
			viewPaged += "/board/reference/reSearch.jsp";
		}
		else if(com.equals("reContent")) {
			command = new ReContentCommand();
			command.execute(request, response); 
			viewPaged += "/board/reference/reContent.jsp";
		} 
		else if(com.equals("reDeleteOk")) {
			command = new ReDeleteOkCommand();
			command.execute(request, response); 
			viewPaged = "/message/message.jsp";
		} 
		else if(com.equals("reUpdate")) {
			command = new ReUpdateCommand();
			command.execute(request, response); 
			viewPaged += "/board/reference/reUpdate.jsp";
		} 
		else if(com.equals("reUpdateOk")) {
			command = new ReUpdateOkCommand();
			command.execute(request, response); 
			viewPaged = "/message/message.jsp";
		} 
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPaged);
		dispatcher.forward(request, response);
	}
}
