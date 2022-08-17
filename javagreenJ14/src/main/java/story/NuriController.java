package story;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("*.nu")
public class NuriController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		NuriInterface command = null;
		String viewPaged = "/WEB-INF";
		
		String uri = request.getRequestURI(); 
		String com = uri.substring(uri.lastIndexOf("/")+1,uri.lastIndexOf("."));
		
	  // 세션이 끈겼으면 작업의 진행을 홈창으로 보낸다.
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel")==null ? 99 : (int) session.getAttribute("sLevel");
		
		if(level > 3 || level == 1) {   // 세션이 끈겼으면 작업의 진행을 홈창으로 보낸다.
			if(level == 1) {
				request.setAttribute("msg", "normal");
				request.setAttribute("url", request.getContextPath()+"/");
				viewPaged = "/message/message.jsp";
			}
			else {
//				RequestDispatcher dispatcher = request.getRequestDispatcher("/");
//				dispatcher.forward(request, response);
				request.setAttribute("msg", "nono");
				request.setAttribute("url", request.getContextPath()+"/member/memLogin.mem");
				viewPaged = "/message/message.jsp";
			}
		}
		else if(com.equals("nuriList")) {
			command = new NuriListCommand();
			command.execute(request, response); 
			viewPaged += "/story/nuriList.jsp";
		}
		else if(com.equals("nuriInput")) {
			viewPaged += "/story/nuriInput.jsp";
		}
		else if(com.equals("nuriInputOk")) {
			command = new NuriInputOkCommand();
			command.execute(request, response); 
			viewPaged = "/message/message.jsp";
		}
		else if(com.equals("nuriContent")) {
			command = new NuriContentCommand();
			command.execute(request, response); 
			viewPaged += "/story/nuriContent.jsp";
		}
		else if(com.equals("nuriUpdate")) {
			command = new NuriUpdateCommand();
			command.execute(request, response); 
			viewPaged += "/story/nuriUpdate.jsp";
		} 
		else if(com.equals("nuriUpdateOk")) {
			command = new NuriUpdateOkCommand();
			command.execute(request, response); 
			viewPaged = "/message/message.jsp";
		} 
		else if(com.equals("fSNameDelete")) {
			command = new NuriFSNameDeleteCommand();
			command.execute(request, response); 
			return;
		} 
		else if(com.equals("nuriDeleteOk")) {
			command = new NuriDeleteOkCommand();
			command.execute(request, response); 
			return;
		} 
		else if(com.equals("nuriReplyUpdateOk")) {
			command = new NuriReplyUpdateOkCommand();
			command.execute(request, response); 
			return;
		} 
		else if(com.equals("nuriReplyDeleteOk")) {
			command = new NuriReplyDeleteOkCommand();
			command.execute(request, response); 
			return;
		} 

		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPaged);
		dispatcher.forward(request, response);
	}
}
