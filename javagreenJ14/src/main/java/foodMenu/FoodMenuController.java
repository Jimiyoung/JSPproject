package foodMenu;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("*.fo")
public class FoodMenuController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		FoodMenuInterface command = null;
		String viewPaged = "/WEB-INF";
		
		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/")+1,uri.lastIndexOf("."));
		/*
		// 세션이 끊겼으면 작업 진행을 로그인 창으로 보냄.
		HttpSession session = request.getSession();
		int level = session.getAttribute("sLevel")==null ? 99 : (int) session.getAttribute("sLevel");
		
		if(level > 4 || level ==1) { 	// 세션이 끊겼으면 작업 진행을 로그인 창으로 보냄.
			RequestDispatcher dispatcher = request.getRequestDispatcher("/");
			dispatcher.forward(request, response);
		}*/
		if(com.equals("foList")) {
			command = new FoListCommand();
			command.execute(request, response); 
			viewPaged += "/board/foodMenu/foList.jsp";
		}
		else if(com.equals("foSearch")) {
			command = new FoSearchCommand();
			command.execute(request, response); 
			viewPaged += "/board/foodMenu/foSearch.jsp";
		}
		else if(com.equals("foInput")) {
			viewPaged += "/board/foodMenu/foInput.jsp";
		} 
		else if(com.equals("foInputOk")) {
			command = new FoInputOkCommand();
			command.execute(request, response); 
			viewPaged = "/message/message.jsp";
		}
		else if(com.equals("foContent")) {
			command = new FoContentCommand();
			command.execute(request, response); 
			viewPaged += "/board/foodMenu/foContent.jsp";
		} 
		else if(com.equals("foUpdate")) {
			command = new FoUpdateCommand();
			command.execute(request, response); 
			viewPaged += "/board/foodMenu/foUpdate.jsp";
		} 
		else if(com.equals("foUpdateOk")) {
			command = new FoUpdateOkCommand();
			command.execute(request, response); 
			viewPaged = "/message/message.jsp";
		} 
		else if(com.equals("foDeleteOk")) {
			command = new FoDeleteOkCommand();
			command.execute(request, response); 
			return;
		} 
		else if(com.equals("foDownNum")) {
			command = new FoDownNumCommand();
			command.execute(request, response); 
			return;
		} 
		else if(com.equals("fSNameDelete")) {
			command = new FSNameDeleteCommand();
			command.execute(request, response); 
			return;
		} 
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPaged);
		dispatcher.forward(request, response);
	}
}
